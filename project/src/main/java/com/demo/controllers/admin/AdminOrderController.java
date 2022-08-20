package com.demo.controllers.admin;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.demo.configurations.CustomDateAndTimeDeserialize;
import com.demo.entities.Account;
import com.demo.entities.Exchange;
import com.demo.entities.Order;
import com.demo.entities.OrderDetail;
import com.demo.entities.Payment;
import com.demo.entities.Product;
import com.demo.entities.Promotion;
import com.demo.entities.PromotionDetail;
import com.demo.entities.Status;
import com.demo.entities.Voucher;
import com.demo.services.DeliveryService;
import com.demo.services.MailService;
import com.demo.services.OrderDetailService;
import com.demo.services.OrderService;
import com.demo.services.PaymentService;
import com.demo.services.ProductService;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.google.common.collect.Lists;
import com.google.gson.Gson;

@Controller
@RequestMapping("admin/order")
public class AdminOrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private OrderDetailService orderDetailService;
	@Autowired
	private PaymentService paymentService;
	@Autowired
	private DeliveryService deliveryService;
	@Autowired
	private MailService mailService;
	@Autowired
	private ProductService productService;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		try {
			modelMap.put("order", new Order());
			modelMap.put("orders", orderService.findAll());
			modelMap.put("statuses", orderService.getStatuses());
			modelMap.put("account", new Account());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin.order.index";
	}

	@RequestMapping(value = "update", method = RequestMethod.GET)
	@ResponseBody
	public String update(@RequestParam("orderId") int id) {
		try {
			// set order
			Order order = new Order();
			order.setId(id);
			order.setCode(orderService.find(id).getCode());
			order.setCreatedDate(orderService.find(id).getCreatedDate());
			order.setCustomerName(orderService.find(id).getCustomerName());
			order.setCustomerPhone(orderService.find(id).getCustomerPhone());
			order.setCustomerEmail(orderService.find(id).getCustomerEmail());
			order.setStatus(orderService.find(id).getStatus());
			int orderStatusId = orderService.findStatusByName(order.getStatus()).getId();
			// set orderDetail
			List<OrderDetail> orderDetails = new ArrayList<>();
			for (OrderDetail orderDetail : orderDetailService.findAllByOrderId(id)) {
				OrderDetail temp = new OrderDetail();
				// set product for orderDetail
				Product product = new Product();
				product.setName(orderDetail.getProduct().getName());
				temp.setProduct(product);
				temp.setPrice(orderDetail.getPrice());
				temp.setQuantity(orderDetail.getQuantity());
				orderDetails.add(temp);
			}
			// set payment
			Payment payment = new Payment();
			payment.setMethod(paymentService.findByOrderId(id).getMethod());
			payment.setPrice(paymentService.findByOrderId(id).getPrice());
			payment.setCreatedDate(paymentService.findByOrderId(id).getCreatedDate());
			// set exchanges
			List<Exchange> exchanges = new ArrayList<>();
			for (Exchange exchange : orderService.find(id).getExchanges()) {
				Exchange temp = new Exchange();
				Voucher voucher = new Voucher();
				voucher.setPrice(exchange.getVoucher().getPrice());
				voucher.setPoint(exchange.getVoucher().getPoint());
				temp.setVoucher(voucher);
				exchanges.add(temp);
			}
			// set promotions
			List<Promotion> promotions = new ArrayList<>();
			for (OrderDetail orderDetail : orderDetailService.findAllByOrderId(id)) {
				// check if respective product has promotions
				if (orderDetail.getProduct().getPromotionDetails().size() != 0) {
					for (PromotionDetail promotionDetail : orderDetail.getProduct().getPromotionDetails()) {
						Promotion promotion = new Promotion();
						promotion.setPrice(promotionDetail.getPromotion().getPrice());
						promotion.setName(promotionDetail.getPromotion().getName());
						promotions.add(promotion);
					}
				}
			}
			HashMap<String, Object> hashMap = new HashMap<>();
			hashMap.put("orderStatusId", orderStatusId);
			hashMap.put("order", order);
			hashMap.put("orderDetails", orderDetails);
			hashMap.put("payment", payment);
			hashMap.put("exchanges", exchanges);
			hashMap.put("promotions", promotions);
			return new Gson().toJson(hashMap);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@ModelAttribute("order") Order orderTemp) {
		try {
			Order order = orderService.find(orderTemp.getId());
			Status status = orderService.findStatusById(Integer.parseInt(orderTemp.getStatus()));
			if (status.getName().equalsIgnoreCase("Accepted")) {
				for (Payment payment : order.getPayments()) {
					payment.setStatus(true);
				}
			}
			order.setStatus(status.getName());
			orderService.save(order);
			if (order.getStatus().equalsIgnoreCase("Accepted")) {
				String content = "Your order has accepted from NVLTech.com, please come to nvltech.com to tracking your order<br/>"
						+ "Your order code : " + order.getCode();
				mailService.sendMail("nvlteam123@gmail.com", order.getCustomerEmail(), "NVLTech", content);
				for (OrderDetail detail : order.getOrderDetails()) {
					Product product = productService.findById(detail.getProduct().getId());
					product.setQuantity(product.getQuantity() - detail.getQuantity());
					productService.save(product);
				}
			}
			return "redirect:";
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping(value = "ajaxOrderStatus", method = RequestMethod.GET)
	@ResponseBody
	public String ajaxOrderStatus(@RequestParam("status") int statusId) {
//		GsonBuilder b = new GsonBuilder();
//		b.registerTypeAdapterFactory(HibernateProxyTypeAdapter.FACTORY);
//		Gson gson = b.create();
		try {
			List<Order> orders = new ArrayList<>();
			if (statusId == 0) {
				orders = Lists.newArrayList(orderService.findAll());
			} else {
				orders = orderService.findAllByStatus(orderService.findStatusById(statusId).getName());
			}
			// Create orderJsons to store all needed data
			List<OrderJson> orderJsons = new ArrayList<>();
			for (Order order : orders) {
				OrderJson orderJson = new OrderJson();
				orderJson.setId(order.getId());
				orderJson.setCode(order.getCode());
				if (order.getAccount() == null) {
					orderJson.setName(order.getCustomerName());
				} else {
					orderJson.setName(order.getAccount().getFullName());
				}
				orderJson.setCreatedDate(order.getCreatedDate());
				orderJson.setTotalPrice(paymentService.findByOrderId(order.getId()).getPrice());
				orderJson.setStatus(order.getStatus());
				orderJson.setDelivery(deliveryService.findByOrderId(order.getId()).getDestination());
				orderJsons.add(orderJson);
			}
			return new Gson().toJson(orderJsons);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping(value = "ajaxOrderSort", method = RequestMethod.POST)
	@ResponseBody
	public String ajaxOrderSort(@RequestBody List<OrderJson> orderJsons, @RequestParam("header") String header,
			@RequestParam("turn") String turn) {
		try {
			switch (header) {
			case "thOrderCode":
				if (turn.equals("0")) {
					Collections.sort(orderJsons, new OrderCodeSort());
				} else {
					Collections.sort(orderJsons, new OrderCodeSort().reversed());
				}
				break;
			case "thCustomer":
				if (turn.equals("0")) {
					Collections.sort(orderJsons, new OrderNameSort());
				} else {
					Collections.sort(orderJsons, new OrderNameSort().reversed());
				}
				break;
			case "thOrderDate":
				if (turn.equals("0")) {
					Collections.sort(orderJsons, new OrderCreatedDateSort());
				} else {
					Collections.sort(orderJsons, new OrderCreatedDateSort().reversed());
				}
				break;
			case "thPrice":
				if (turn.equals("0")) {
					Collections.sort(orderJsons, new OrderPriceSort());
				} else {
					Collections.sort(orderJsons, new OrderPriceSort().reversed());
				}
				break;
			case "thStatus":
				if (turn.equals("0")) {
					Collections.sort(orderJsons, new OrderStatusSort());
				} else {
					Collections.sort(orderJsons, new OrderStatusSort().reversed());
				}
				break;
			case "thDelivery":
				if (turn.equals("0")) {
					Collections.sort(orderJsons, new OrderDeliverySort());
				} else {
					Collections.sort(orderJsons, new OrderDeliverySort().reversed());
				}
				break;
			}
			return new Gson().toJson(orderJsons);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}

// temp class to store needed data
class OrderJson implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String code;
	private String name;
	@JsonDeserialize(using = CustomDateAndTimeDeserialize.class)
	private Date createdDate;
	private double price;
	private String status;
	private String delivery;

	public OrderJson(int id, String code, String name, Date createdDate, double price, String status, String delivery) {
		super();
		this.id = id;
		this.code = code;
		this.name = name;
		this.createdDate = createdDate;
		this.price = price;
		this.status = status;
		this.delivery = delivery;
	}

	public OrderJson() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public double getPrice() {
		return price;
	}

	public void setTotalPrice(double price) {
		this.price = price;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}

//comparing classes
class OrderCodeSort implements Comparator<OrderJson> {

	@Override
	public int compare(OrderJson orderJson1, OrderJson orderJson2) {
		return orderJson1.getCode().compareTo(orderJson2.getCode());
	}

}

class OrderNameSort implements Comparator<OrderJson> {

	@Override
	public int compare(OrderJson orderJson1, OrderJson orderJson2) {
		return orderJson1.getName().compareTo(orderJson2.getName());
	}

}

class OrderCreatedDateSort implements Comparator<OrderJson> {

	@Override
	public int compare(OrderJson orderJson1, OrderJson orderJson2) {
		return orderJson1.getCreatedDate().compareTo(orderJson2.getCreatedDate());
	}

}

class OrderPriceSort implements Comparator<OrderJson> {

	@Override
	public int compare(OrderJson orderJson1, OrderJson orderJson2) {
		if (orderJson1.getPrice() < orderJson2.getPrice()) {
			return -1;
		} else if (orderJson1.getPrice() == orderJson2.getPrice()) {
			return 0;
		} else {
			return 1;
		}
	}

}

class OrderStatusSort implements Comparator<OrderJson> {

	@Override
	public int compare(OrderJson orderJson1, OrderJson orderJson2) {
		return orderJson1.getStatus().compareTo(orderJson2.getStatus());
	}

}

class OrderDeliverySort implements Comparator<OrderJson> {

	@Override
	public int compare(OrderJson orderJson1, OrderJson orderJson2) {
		return orderJson1.getDelivery().compareTo(orderJson2.getDelivery());
	}

}