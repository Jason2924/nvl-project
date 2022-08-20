package com.demo.controllers.admin;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.entities.Account;
import com.demo.entities.Price;
import com.demo.entities.Product;
import com.demo.entities.Promotion;
import com.demo.entities.PromotionDetail;
import com.demo.services.PromotionDetailService;
import com.demo.services.PromotionService;
import com.google.gson.Gson;

@Controller
@RequestMapping(value = "admin/promotion")
public class AdminPromotionController {

	@Autowired
	private PromotionService promotionService;

	@Autowired
	private PromotionDetailService promotionDetailService;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		try {
			modelMap.put("promotions", promotionService.findAll());
			modelMap.put("promotion", new Promotion());
			modelMap.put("account", new Account());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin.promotion.index";
	}

	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String create(@ModelAttribute("promotion") Promotion promotion) {
		try {
			promotion.setStatus(true);
			promotionService.save(promotion);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:";
	}

	@RequestMapping(value = "update", method = RequestMethod.GET)
	@ResponseBody
	public String update(@RequestParam("promotionId") int id) {
		try {
			Promotion promotion = promotionService.findById(id);
			Promotion temp = new Promotion();
			temp.setId(promotion.getId());
			temp.setName(promotion.getName());
			temp.setPrice(promotion.getPrice());
			temp.setDescription(promotion.getDescription());
			temp.setStartDate(promotion.getStartDate());
			temp.setEndDate(promotion.getEndDate());
			for (PromotionDetail promotionDetail : promotionDetailService.findAllByPromotionId(id)) {
				PromotionDetail tempDetail = new PromotionDetail();
				tempDetail.setId(promotionDetail.getId());
				Product product = new Product();
				product.setName(promotionDetail.getProduct().getName());
				product.setBrand(promotionDetail.getProduct().getBrand());
				tempDetail.setProduct(product);
				temp.getPromotionDetails().add(tempDetail);
			}
			return new Gson().toJson(temp);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@ModelAttribute("promotion") Promotion temp) {
		try {
			Promotion promotion = promotionService.findById(temp.getId());
			promotion.setName(temp.getName());
			promotion.setPrice(temp.getPrice());
			promotion.setDescription(temp.getDescription());
			promotion.setStartDate(temp.getStartDate());
			promotion.setEndDate(temp.getEndDate());
			promotionService.save(promotion);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:";
	}

	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(@RequestParam("id") int id) {
		try {
			Promotion promotion = promotionService.findById(id);
			promotion.setStatus(false);
			promotionService.save(promotion);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:";
	}

	@RequestMapping(value = "ajaxPromotionSort", method = RequestMethod.GET)
	@ResponseBody
	public String ajaxDiscountSort(@RequestParam("turn") int turn, @RequestParam("thead") String thead) {
		try {
			List<PromotionJson> promotionJsons = new ArrayList<>();
			Iterable<Promotion> promotions = promotionService.findAll();
			for (Promotion promotion : promotions) {
				PromotionJson promotionJson = new PromotionJson();
				promotionJson.setId(promotion.getId());
				promotionJson.setName(promotion.getName());
				promotionJson.setPrice(promotion.getPrice());
				promotionJson.setDescription(promotion.getDescription());
				promotionJson.setStartDate(promotion.getStartDate());
				promotionJson.setEndDate(promotion.getEndDate());
				promotionJsons.add(promotionJson);
			}
			switch (thead) {
			case "thName":
				if (turn == 0) {
					Collections.sort(promotionJsons, new PromotionNameSort());
				} else {
					Collections.sort(promotionJsons, new PromotionNameSort().reversed());
				}
				break;
			case "thPrice":
				if (turn == 0) {
					Collections.sort(promotionJsons, new PromotionPriceSort());
				} else {
					Collections.sort(promotionJsons, new PromotionPriceSort().reversed());
				}
				break;
			case "thDescription":
				if (turn == 0) {
					Collections.sort(promotionJsons, new PromotionDescriptionSort());
				} else {
					Collections.sort(promotionJsons, new PromotionDescriptionSort().reversed());
				}
				break;
			case "thStartDate":
				if (turn == 0) {
					Collections.sort(promotionJsons, new PromotionStartDateSort());
				} else {
					Collections.sort(promotionJsons, new PromotionStartDateSort().reversed());
				}
				break;
			case "thEndDate":
				if (turn == 0) {
					Collections.sort(promotionJsons, new PromotionEndDateSort());
				} else {
					Collections.sort(promotionJsons, new PromotionEndDateSort().reversed());
				}
				break;
			}
			return new Gson().toJson(promotionJsons);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}

class PromotionJson implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String name;
	private double price;
	private String description;
	private Date startDate;
	private Date endDate;

	public PromotionJson(int id, String name, double price, String description, Date startDate, Date endDate) {
		super();
		this.id = id;
		this.name = name;
		this.price = price;
		this.description = description;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public PromotionJson() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}

class PromotionNameSort implements Comparator<PromotionJson> {

	@Override
	public int compare(PromotionJson promotionJson1, PromotionJson promotionJson2) {
		return promotionJson1.getName().compareTo(promotionJson2.getName());
	}

}

class PromotionPriceSort implements Comparator<PromotionJson> {

	@Override
	public int compare(PromotionJson promotionJson1, PromotionJson promotionJson2) {
		if (promotionJson1.getPrice() > promotionJson2.getPrice()) {
			return -1;
		} else if (promotionJson1.getPrice() == promotionJson2.getPrice()) {
			return 0;
		} else {
			return 1;
		}
	}

}

class PromotionDescriptionSort implements Comparator<PromotionJson> {

	@Override
	public int compare(PromotionJson promotionJson1, PromotionJson promotionJson2) {
		return promotionJson1.getDescription().compareTo(promotionJson2.getDescription());
	}

}

class PromotionStartDateSort implements Comparator<PromotionJson> {

	@Override
	public int compare(PromotionJson promotionJson1, PromotionJson promotionJson2) {
		return promotionJson1.getStartDate().compareTo(promotionJson2.getStartDate());
	}

}

class PromotionEndDateSort implements Comparator<PromotionJson> {

	@Override
	public int compare(PromotionJson promotionJson1, PromotionJson promotionJson2) {
		return promotionJson1.getEndDate().compareTo(promotionJson2.getEndDate());
	}

}
