package com.demo.controllers.admin;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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
import com.demo.entities.Voucher;
import com.demo.services.VoucherService;
import com.google.gson.Gson;

@Controller
@RequestMapping(value = "admin/voucher")
public class AdminVoucherController {

	@Autowired
	private VoucherService voucherService;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		try {
			modelMap.put("vouchers", voucherService.findAll(true));
			modelMap.put("voucher", new Voucher());
			modelMap.put("account", new Account());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin.voucher.index";
	}

	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String create(@ModelAttribute("voucher") Voucher voucher) {
		try {
			voucher.setStatus(true);
			voucherService.save(voucher);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:";
	}

	@RequestMapping(value = "update", method = RequestMethod.GET)
	@ResponseBody
	public String update(@RequestParam("voucherId") int id) {
		try {
			Voucher voucher = voucherService.findById(id);
			Voucher temp = new Voucher();
			temp.setId(voucher.getId());
			temp.setPrice(voucher.getPrice());
			temp.setPoint(voucher.getPoint());
			return new Gson().toJson(temp);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@ModelAttribute("voucher") Voucher temp) {
		try {
			Voucher voucher = voucherService.findById(temp.getId());
			voucher.setPrice(temp.getPrice());
			voucher.setPoint(temp.getPoint());
			voucherService.save(voucher);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:";
	}

	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(@RequestParam("id") int id) {
		try {
			Voucher voucher = voucherService.findById(id);
			voucher.setStatus(false);
			voucherService.save(voucher);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:";
	}

	@RequestMapping(value = "ajaxVoucherSort", method = RequestMethod.GET)
	@ResponseBody
	public String ajaxVoucherSort(@RequestParam("turn") int turn, @RequestParam("thead") String thead) {
		try {
			List<VoucherJson> voucherJsons = new ArrayList<>();
			List<Voucher> vouchers = voucherService.findAll(true);
			for (Voucher voucher : vouchers) {
				VoucherJson voucherJson = new VoucherJson();
				voucherJson.setId(voucher.getId());
				voucherJson.setPrice(voucher.getPrice());
				voucherJson.setPoint(voucher.getPoint());
				voucherJsons.add(voucherJson);
			}
			switch (thead) {
			case "thPrice":
				if (turn == 0) {
					Collections.sort(voucherJsons, new VoucherPriceSort());
				} else {
					Collections.sort(voucherJsons, new VoucherPriceSort().reversed());
				}
				break;
			case "thPoint":
				if (turn == 0) {
					Collections.sort(voucherJsons, new VoucherPointSort());
				} else {
					Collections.sort(voucherJsons, new VoucherPointSort().reversed());
				}
				break;
			}
			return new Gson().toJson(voucherJsons);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}

class VoucherJson implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private double price;
	private int point;

	public VoucherJson(int id, double price, int point) {
		super();
		this.id = id;
		this.price = price;
		this.point = point;
	}

	public VoucherJson() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}

class VoucherPriceSort implements Comparator<VoucherJson> {

	@Override
	public int compare(VoucherJson voucherJson1, VoucherJson voucherJson2) {
		if (voucherJson1.getPrice() > voucherJson2.getPrice()) {
			return -1;
		} else if (voucherJson1.getPrice() == voucherJson2.getPrice()) {
			return 0;
		} else {
			return 1;
		}
	}

}

class VoucherPointSort implements Comparator<VoucherJson> {

	@Override
	public int compare(VoucherJson voucherJson1, VoucherJson voucherJson2) {
		if (voucherJson1.getPoint() > voucherJson2.getPoint()) {
			return -1;
		} else if (voucherJson1.getPoint() == voucherJson2.getPoint()) {
			return 0;
		} else {
			return 1;
		}
	}

}
