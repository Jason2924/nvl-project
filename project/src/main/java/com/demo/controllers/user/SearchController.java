package com.demo.controllers.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.Product;
import com.demo.services.ProductService;

@Controller
@RequestMapping("search")
public class SearchController {
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = {"", "index"}, method = RequestMethod.GET)
	public String index(@RequestParam("keyword") String keyword, 
			@RequestParam("category") int category, 
			ModelMap modelMap) {
		try {
			List<Product> productList = null;
			if (category > 0) {
				productList = productService.retrieveAllByKeywordCate(keyword, category);
			} else {
				productList = productService.retrieveAllByKeyword(keyword);
			}
			modelMap.put("productList", productList);
			modelMap.put("count", productList.size());
			modelMap.put("keyword", keyword);
		} catch (Exception e) {
			System.err.println("SearchController - index :\n" + e.getStackTrace());
		}
		return "user.search.index";
	}
	
}
