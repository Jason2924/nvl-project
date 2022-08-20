package com.demo.controllers.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.Brand;
import com.demo.entities.Category;
import com.demo.entities.Product;
import com.demo.services.BrandService;
import com.demo.services.CategoryService;
import com.demo.services.ProductService;

@Controller
@RequestMapping("shop")
public class ShopController {
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private BrandService brandService;
	
	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap, HttpServletRequest request) {
		try {
			List<Product> productList = productService.retrieveAll();
			List<Category> categoryList = (List<Category>) categoryService.findAll();
			List<Brand> brandList = (List<Brand>) brandService.findAll();
			
			modelMap.put("listHolder", pageListHolder(productList, request));
			modelMap.put("count", productList.size());
			modelMap.put("categoryList", categoryList);
			modelMap.put("brandList", brandList);
			modelMap.put("currentLink", "shop");
		} catch (Exception e) {
			System.err.println("ShopController - index : \n" + e.getMessage());
		}
		return "user.shop.index";
	}
	
	@RequestMapping(value = "category", method = RequestMethod.GET)
	public String indexByCategory(@RequestParam("id") int id, ModelMap modelMap, HttpServletRequest request) {
		try {
			List<Product> productList = productService.findAllByCategory(id);
			List<Category> categoryList = (List<Category>) categoryService.findAll();
			List<Brand> brandList = (List<Brand>) brandService.findAll();
			modelMap.put("listHolder", pageListHolder(productList, request));
			modelMap.put("count", productList.size());
			modelMap.put("categoryList", categoryList);
			modelMap.put("brandList", brandList);
			modelMap.put("currentLink", "shop/category?id=" + id);
		} catch (Exception e) {
			System.err.println("ShopController - category : \n" + e.getMessage());
		}
		return "user.shop.index";
	}
	
	@RequestMapping(value = "brand", method = RequestMethod.GET)
	public String indexByBrand(@RequestParam("id") int id, ModelMap modelMap, HttpServletRequest request) {
		try {
			List<Product> productList = productService.findAllByBrand(id);
			List<Category> categoryList = (List<Category>) categoryService.findAll();
			List<Brand> brandList = (List<Brand>) brandService.findAll();
			modelMap.put("listHolder", pageListHolder(productList, request));
			modelMap.put("count", productList.size());
			modelMap.put("categoryList", categoryList);
			modelMap.put("brandList", brandList);
			modelMap.put("currentLink", "shop/brand?id=" + id);
		} catch (Exception e) {
			System.err.println("ShopController - brand : \n" + e.getMessage());
		}
		return "user.shop.index";
	}
	
	private PagedListHolder<Product> pageListHolder(List<Product> productList, HttpServletRequest request) {
		try {
			PagedListHolder<Product> listHolder = new PagedListHolder<Product>(productList);
			int page = ServletRequestUtils.getIntParameter(request, "page", 0);
			listHolder.setPage(page);
			listHolder.setPageSize(10);
			return listHolder;
		} catch (Exception e) {
			System.err.println("ShopController - pageListHolder :\n" + e.getStackTrace());
		}
		return null;
	}
}
