package com.demo.controllers.user;

import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.entities.Cart;
import com.demo.entities.Product;
import com.demo.entities.PromotionDetail;
import com.demo.services.PriceService;
import com.demo.services.ProductService;
import com.google.gson.JsonObject;

@Controller
@RequestMapping("cart")
public class CartController {

	@Autowired
	private ProductService productService;
	@Autowired
	private PriceService priceService;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index() {
		return "user.cart.index";
	}

	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String create(@RequestParam("id") int id, @RequestParam("quantity") int quantity, HttpSession session) {
		try {
			DecimalFormat decimalFormat = new DecimalFormat("#.##");
			Product product = productService.findById(id);
			double discount = 0;
			double price = priceService.findByProductId(id, true).getPrice();
			if (product.getPromotionDetails() != null && !product.getPromotionDetails().isEmpty()) {
				for (PromotionDetail promotionDetail : product.getPromotionDetails()) {
					if (promotionDetail.getPromotion() != null && 
							promotionDetail.getPromotion().isStatus() && 
							promotionDetail.isStatus() &&
							promotionDetail.getPromotion().getStartDate().before(new Date()) &&
							promotionDetail.getPromotion().getEndDate().after(new Date())
							) {
						discount += promotionDetail.getPromotion().getPrice();
					}
				}
			}
			if (discount > 0) {
				price -= (price * discount / 100);
			}
			price = Double.valueOf(decimalFormat.format(price));
			if (session.getAttribute("cartList") != null) {
				List<Cart> cartList = (List<Cart>) session.getAttribute("cartList");
				boolean isExisted = false;
				for (Cart cart : cartList) {
					if (cart.getProduct().getId() == product.getId()) {
						cart.setQuantity(cart.getQuantity() + quantity);
						isExisted = true;
					}
				}
				if (isExisted == false) {
					cartList.add(new Cart(product, price, quantity));
				}
				session.setAttribute("cartList", cartList);
			} else {
				List<Cart> cartList = new ArrayList<Cart>();
				cartList.add(new Cart(product, price, quantity));
				session.setAttribute("cartList", cartList);
			}
		} catch (Exception e) {
			System.err.println("UserCartController - create : \n" + e.getMessage());
		}
		return "redirect:";
	}
	
	@RequestMapping(value = "update", method = RequestMethod.POST)
	@ResponseBody
	public void update(@RequestParam("productId") int id, @RequestParam("cartQuantity") int qty, HttpSession session, HttpServletResponse response) {
		try {
			double subtotal = 0;
			double total = 0;
			if (session.getAttribute("cartList") != null) {
				List<Cart> cartList = (List<Cart>) session.getAttribute("cartList");
				for (Cart cart : cartList) {
					if (cart.getProduct().getId() == id) {
						cart.setQuantity(qty);
						subtotal = cart.getPrice() * cart.getQuantity();
					}
					total = total + cart.getPrice() * cart.getQuantity();
				}
				session.setAttribute("cartList", cartList);
				JsonObject object = new JsonObject();
				object.addProperty("subtotal", String.format("%.2f", subtotal));
				object.addProperty("total", String.format("%.2f", total));
				PrintWriter printWriter = response.getWriter();
				printWriter.print(object);
				printWriter.flush();
				printWriter.close();
			}
		} catch (Exception e) {
			System.err.println("CartController - update :\n" + e.getMessage());
		}
	}

	@RequestMapping(value = "remove", method = RequestMethod.POST)
	@ResponseBody
	public void remove(@RequestParam("productId") int id, HttpSession session, HttpServletResponse response) {
		try {
			double total = 0;
			if (session.getAttribute("cartList") != null) {
				List<Cart> cartList = (List<Cart>) session.getAttribute("cartList");
				for (Cart cart : cartList) {
					if (cart.getProduct().getId() == id) {
						cartList.remove(cart);
						break;
					}
				}
				if (cartList.size() > 0) {
					for (Cart cart : cartList) {
						total = total + cart.getPrice() * cart.getQuantity();
					}
					session.setAttribute("cartList", cartList);
				} else {
					session.removeAttribute("cartList");
				}
				JsonObject object = new JsonObject();
				object.addProperty("total", String.format("%.2f", total));
				object.addProperty("size", cartList.size());
				PrintWriter printWriter = response.getWriter();
				printWriter.print(object);
				printWriter.flush();
				printWriter.close();
			}
		} catch (Exception e) {
			System.err.println("CartController - remove : \n" + e.getMessage());
		}
	}

}
