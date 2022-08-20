package com.demo.controllers.user;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.Account;
import com.demo.entities.Order;
import com.demo.entities.Product;
import com.demo.services.OrderService;
import com.demo.services.ProductService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
@RequestMapping("invoice")
public class InvoiceController {
	
	@Autowired
	private OrderService orderService;
	
	@RequestMapping(value = {"", "index"}, method = RequestMethod.GET)
	public String index(@RequestParam("orderCode") String orderCode, ModelMap modelMap) {
		try {
			List<Order> orderList = (List<Order>) orderService.findAll();
			for (Order order : orderList) {
				if (order.getCode().equals(orderCode)) {
					modelMap.put("order", order);
					return "user.invoice.index";
				}
			}
			modelMap.put("msg", "Your order code not correct, please try agian");
		} catch (Exception e) {
			System.err.println("InvoiceController - index :\n" + e.getMessage());
		}
		return "user.invoice.index";
	}
	
}
