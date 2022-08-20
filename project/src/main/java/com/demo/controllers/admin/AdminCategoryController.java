package com.demo.controllers.admin;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.entities.Account;
import com.demo.entities.Category;
import com.demo.services.CategoryService;
import com.google.gson.Gson;

@Controller
@RequestMapping("admin/category")
public class AdminCategoryController {
	@Autowired
	private CategoryService categoryService;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		try {
			modelMap.put("categories", categoryService.findAll(true));
			modelMap.put("account", new Account());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin.category.index";
	}

	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(@RequestParam("id") int id) {
		try {
			Category category = categoryService.findById(id);
			category.setStatus(false);
			categoryService.save(category);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:";
	}

	@RequestMapping(value = "ajaxCategorySort", method = RequestMethod.GET)
	@ResponseBody
	public String ajaxCategorySort(HttpServletRequest request) {
		try {
			int turn = Integer.parseInt(request.getParameter("turn"));
			List<CategoryJson> categoryJsons = new ArrayList<>();
			for (Category category : categoryService.findAll(true)) {
				categoryJsons.add(new CategoryJson(category.getId(), category.getName()));
			}
			if (turn == 0) {
				Collections.sort(categoryJsons, new CategoryNameSort().reversed());
			} else {
				Collections.sort(categoryJsons, new CategoryNameSort());
			}
			return new Gson().toJson(categoryJsons);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}

//temp class to store needed data
class CategoryJson implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String name;

	public CategoryJson(int id, String name) {
		super();
		this.id = id;
		this.name = name;
	}

	public CategoryJson() {
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

}

//comparing classes
class CategoryNameSort implements Comparator<CategoryJson> {

	@Override
	public int compare(CategoryJson categoryJson1, CategoryJson categoryJson2) {
		return categoryJson1.getName().compareTo(categoryJson2.getName());
	}

}