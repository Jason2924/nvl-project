package com.demo.controllers.admin;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.entities.Account;
import com.demo.entities.Commend;
import com.demo.entities.Product;
import com.demo.services.CommendService;
import com.demo.services.ProductService;
import com.google.common.collect.Lists;
import com.google.gson.Gson;

@Controller
@RequestMapping("admin/commend")
public class AdminCommendController {
	@Autowired
	private CommendService commendService;

	@Autowired
	private ProductService productService;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String commend(ModelMap modelMap) {
		try {
			modelMap.put("account", new Account());
			modelMap.put("statuses", commendService.getAllStatus());
			modelMap.put("commends", commendService.findAll());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin.commend.index";
	}

	@RequestMapping(value = "update", method = RequestMethod.GET)
	public String update(@RequestParam("id") int id) {
		try {
			Commend commend = commendService.findById(id);
			commend.setStatus(true);
			commendService.save(commend);
			if (commend.getRate() != 0) {
				Product product = productService.findById(commend.getProduct().getId());
				List<Commend> commends = commendService.findAllByProduct(product.getId());
				float rates = 0;
				int n = 0;
				for (Commend temp : commends) {
					if (temp.isStatus() == true && temp.getRate() != 0) {
						rates += temp.getRate();
						++n;
					}
				}
				DecimalFormat decimalFormat = new DecimalFormat("#.#");
				product.setRate(Float.valueOf(decimalFormat.format((rates / n))));
				productService.save(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:";
	}

	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(@RequestParam("id") int id) {
		try {
			Commend commend = commendService.findById(id);
			commendService.delete(commend);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:";
	}

	@RequestMapping(value = "ajaxCommendStatus", method = RequestMethod.GET)
	@ResponseBody
	public String ajaxOrderStatus(@RequestParam("status") int statusId) {
		try {
			List<Commend> commends = new ArrayList<>();
			if (statusId == 0) {
				commends = Lists.newArrayList(commendService.findAll());
			} else if (statusId == 1) {
				commends = commendService.findAllByStatus(false);
			} else {
				commends = commendService.findAllByStatus(true);
			}
			// Create orderJsons to store all needed data
			List<CommendJson> commendJsons = new ArrayList<>();
			for (Commend commend : commends) {
				CommendJson commendJson = new CommendJson();
				commendJson.setId(commend.getId());
				commendJson.setAccount(commend.getAccount().getUsername());
				commendJson.setProduct(commend.getProduct().getName());
				commendJson.setRate(commend.getRate());
				commendJson.setStatus(commend.isStatus());
				commendJson.setContent(commend.getContent());
				commendJsons.add(commendJson);
			}
			return new Gson().toJson(commendJsons);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping(value = "ajaxCommendSort", method = RequestMethod.GET)
	@ResponseBody
	public String ajaxcommendSort(@RequestParam("turn") int turn, @RequestParam("thead") String thead) {
		try {
			List<CommendJson> commendJsons = new ArrayList<>();
			Iterable<Commend> commends = commendService.findAll();
			for (Commend commend : commends) {
				CommendJson commendJson = new CommendJson();
				commendJson.setId(commend.getId());
				commendJson.setAccount(commend.getAccount().getUsername());
				commendJson.setProduct(commend.getProduct().getName());
				commendJson.setRate(commend.getRate());
				commendJson.setStatus(commend.isStatus());
				commendJson.setContent(commend.getContent());
				commendJsons.add(commendJson);
			}
			switch (thead) {
			case "thAccount":
				if (turn == 0) {
					Collections.sort(commendJsons, new CommendAccountSort());
				} else {
					Collections.sort(commendJsons, new CommendAccountSort().reversed());
				}
				break;
			case "thProduct":
				if (turn == 0) {
					Collections.sort(commendJsons, new CommendProductSort());
				} else {
					Collections.sort(commendJsons, new CommendProductSort().reversed());
				}
				break;
			case "thRate":
				if (turn == 0) {
					Collections.sort(commendJsons, new CommendRateSort());
				} else {
					Collections.sort(commendJsons, new CommendRateSort().reversed());
				}
				break;
			case "thStatus":
				if (turn == 0) {
					Collections.sort(commendJsons, new CommendStatusSort());
				} else {
					Collections.sort(commendJsons, new CommendStatusSort().reversed());
				}
				break;
			}
			return new Gson().toJson(commendJsons);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}

class CommendJson implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String account;
	private String product;
	private int rate;
	private boolean status;
	private String content;

	public CommendJson(int id, String account, String product, int rate, boolean status, String content) {
		super();
		this.id = id;
		this.account = account;
		this.product = product;
		this.rate = rate;
		this.status = status;
		this.content = content;
	}

	public CommendJson() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public int getRate() {
		return rate;
	}

	public void setRate(int rate) {
		this.rate = rate;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}

// sort classes
class CommendAccountSort implements Comparator<CommendJson> {

	@Override
	public int compare(CommendJson commendJson1, CommendJson commendJson2) {
		return commendJson1.getAccount().compareTo(commendJson2.getAccount());
	}

}

class CommendProductSort implements Comparator<CommendJson> {

	@Override
	public int compare(CommendJson commendJson1, CommendJson commendJson2) {
		return commendJson1.getProduct().compareTo(commendJson2.getProduct());
	}

}

class CommendRateSort implements Comparator<CommendJson> {

	@Override
	public int compare(CommendJson commendJson1, CommendJson commendJson2) {
		if (commendJson1.getRate() < commendJson2.getRate()) {
			return -1;
		} else if (commendJson1.getRate() == commendJson2.getRate()) {
			return 0;
		} else {
			return 1;
		}
	}

}

class CommendStatusSort implements Comparator<CommendJson> {

	@Override
	public int compare(CommendJson commendJson1, CommendJson commendJson2) {
		if (commendJson1.isStatus() == true && commendJson2.isStatus() == false) {
			return -1;
		} else if (commendJson1.isStatus() == commendJson2.isStatus()) {
			return 0;
		} else {
			return 1;
		}
	}

}
