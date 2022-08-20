package com.demo.controllers.user;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.google.gson.JsonObject;

@Controller
@RequestMapping("product")
public class ProductController {

	@Autowired
	private ProductService productService;

	@Autowired
	private CommendService commendService;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap, @RequestParam("id") int id) {
		try {
			Product product = productService.findById(id);
			List<Commend> commendList = commendService.findAllByProduct(id);
			if (product.getCategory().getId() == 1) {
				if (!product.getConfiguration().equals("")) {
					HashMap<String, String> configMap = new HashMap<>();
					String[] configs = product.getConfiguration().split(",");
					configMap.put("OS", configs[0]);
					configMap.put("Front Camera", configs[1]);
					configMap.put("Size", configs[2]);
					configMap.put("Battery", configs[3]);
					configMap.put("Back Camera", configs[4]);
					configMap.put("RAM", configs[5]);
					configMap.put("Display", configs[6]);
					configMap.put("Resolution", configs[7]);
					modelMap.put("config", configMap);
				}
			}

			modelMap.put("commendList", commendList);
			modelMap.put("product", product);
			return "user.product.index";
		} catch (Exception e) {
			System.err.println("ProductController - index :\n" + e.getMessage());
		}
		return null;
	}

	@RequestMapping(value = "comment", method = RequestMethod.POST)
	public String comment(@RequestParam("id") int id, @RequestParam("content") String content,
			@RequestParam("rating") int rating, HttpSession session) {
		try {
			Product product = productService.findById(id);
			Account account = (Account) session.getAttribute("account");
			Commend commend = new Commend();
			commend.setAccount(account);
			commend.setProduct(product);
			commend.setRate(rating);
			commend.setContent(content);
			commend.setStatus(false);
			commendService.save(commend);
		} catch (Exception e) {
			System.err.println("ProductController - commend :\n" + e.getMessage());
		}
		return "redirect:?id=" + id;
	}

	@RequestMapping(value = "commend", method = RequestMethod.POST)
	@ResponseBody
	public void commend(@RequestParam("productId") int id, @RequestParam("content") String content,
			@RequestParam("stars") int rating, HttpSession session, HttpServletResponse response) {
		try {
			Product product = productService.findById(id);
			Account account = (Account) session.getAttribute("account");
			JsonObject object = new JsonObject();
			if (!content.equals("")) {
				Commend commend = new Commend();
				commend.setAccount(account);
				commend.setProduct(product);
				commend.setRate(rating);
				commend.setContent(content);
				commend.setStatus(false);
				if (commendService.save(commend) != null) {
					object.addProperty("success", true);
					object.addProperty("msg", "Your comment and rate has sent");
				}
			} else {
				object.addProperty("success", false);
				object.addProperty("msg", "Somethings went wrong, please try again later");
			}
			PrintWriter printWriter = response.getWriter();
			printWriter.print(object);
			printWriter.flush();
			printWriter.close();
		} catch (Exception e) {
			System.err.println("ProductController - commend :\n" + e.getMessage());
		}
	}

}
