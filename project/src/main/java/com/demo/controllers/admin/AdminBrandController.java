package com.demo.controllers.admin;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
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
import com.demo.entities.Brand;
import com.demo.services.BrandService;
import com.google.gson.Gson;

@Controller
@RequestMapping("admin/brand")
public class AdminBrandController {
	@Autowired
	private BrandService brandService;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		try {
			modelMap.put("brands", brandService.findAll(true));
			modelMap.put("brandJson", new BrandJson());
			modelMap.put("account", new Account());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin.brand.index";
	}

	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String create(@ModelAttribute("brandJson") BrandJson brandJson) {
		try {
			Brand brand = new Brand();
			brand.setName(brandJson.getName());
			brand.setStatus(true);
			brandService.save(brand);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:";
	}

	@RequestMapping(value = "update", method = RequestMethod.GET)
	@ResponseBody
	public String update(@RequestParam("brandId") int brandId) {
		try {
			Brand brand = brandService.findById(brandId);
			BrandJson brandJson = new BrandJson(brand.getId(), brand.getName());
			return new Gson().toJson(brandJson);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@ModelAttribute("brandJson") BrandJson brandJson) {
		try {
			Brand brand = brandService.findById(brandJson.getId());
			brand.setName(brandJson.getName());
			brandService.save(brand);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:";
	}

	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(@RequestParam("id") int id) {
		try {
			Brand brand = brandService.findById(id);
			brand.setStatus(false);
			brandService.save(brand);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:";
	}

	@RequestMapping(value = "ajaxBrandSort", method = RequestMethod.GET)
	@ResponseBody
	public String ajaxBrandSort(@RequestParam("turn") int turn) {
		try {
			List<BrandJson> brandJsons = new ArrayList<>();
			for (Brand brand : brandService.findAll(true)) {
				brandJsons.add(new BrandJson(brand.getId(), brand.getName()));
			}
			if (turn == 1) {
				Collections.sort(brandJsons);
			} else {
				Collections.reverse(brandJsons);
			}
			return new Gson().toJson(brandJsons);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}

// temp class to store needed data
class BrandJson implements Serializable, Comparable<BrandJson> {
	/**
	* 
	*/
	private static final long serialVersionUID = 1L;
	private int id;
	private String name;

	public BrandJson(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public BrandJson() {
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

	@Override
	public int compareTo(BrandJson brandJson) {
		return this.getName().compareTo(brandJson.getName());
	}

}
