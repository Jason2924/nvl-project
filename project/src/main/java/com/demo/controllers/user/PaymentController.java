package com.demo.controllers.user;

import java.io.PrintWriter;
import java.security.SecureRandom;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.demo.entities.Account;
import com.demo.entities.Cart;
import com.demo.entities.Customer;
import com.demo.entities.Delivery;
import com.demo.entities.Exchange;
import com.demo.entities.Order;
import com.demo.entities.OrderDetail;
import com.demo.entities.OrderDetailId;
import com.demo.entities.Payment;
import com.demo.entities.Voucher;
import com.demo.paypals.PayPalConfig;
import com.demo.paypals.PayPalResult;
import com.demo.paypals.PayPalSuccess;
import com.demo.services.AccountService;
import com.demo.services.DeliveryService;
import com.demo.services.ExchangeService;
import com.demo.services.MailService;
import com.demo.services.OrderDetailService;
import com.demo.services.OrderService;
import com.demo.services.PaymentService;
import com.demo.services.VoucherService;
import com.demo.validations.UserValidator;
import com.google.gson.JsonObject;

@Controller
@RequestMapping("payment")
public class PaymentController {

	@Autowired
	private DeliveryService deliveryService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private PaymentService paymentService;

	@Autowired
	private OrderDetailService orderDetailService;

	@Autowired
	private VoucherService voucherService;

	@Autowired
	private ExchangeService exchangeService;

	@Autowired
	private UserValidator userValidator;

	@Autowired
	private AccountService accountService;

	@Autowired
	private MailService mailService;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap, HttpSession session) {
		Customer customer = new Customer();
		if (session.getAttribute("account") != null) {
			Account account = (Account) session.getAttribute("account");
			List<Voucher> voucherList = voucherService.retrieveAllByPoint(account.getCreditPoint());
			modelMap.put("voucherList", voucherList);
		}
		if (session.getAttribute("cartList") == null) {
			modelMap.put("err", "Please add product(s) to cart before you make an order");
		}
		modelMap.put("customer", customer);
		return "user.payment.index";
	}

	// Delete RequestParam deliveryAddress, put customer.getAddress in
	// createDelivery

	@RequestMapping(value = "index", method = RequestMethod.POST)
	public String index(@ModelAttribute("customer") @Valid Customer customer, BindingResult bindingResult,
			@RequestParam("deliveryType") boolean deliveryType, @RequestParam("voucherId") int voucherId,
			@RequestParam("paymentMethod") String paymentMethod, HttpSession session, ModelMap modelMap) {
		try {
			if (session.getAttribute("cartList") != null) {
				List<Cart> cartList = (List<Cart>) session.getAttribute("cartList");
				Account account = (Account) session.getAttribute("account");
				List<Voucher> voucherList = voucherService.retrieveAllByPoint(account.getCreditPoint());
				modelMap.put("voucherList", voucherList);
				userValidator.validate(customer, bindingResult);
				if (bindingResult.hasErrors()) {
					return "user.payment.index";
				} else {
					DecimalFormat decimalFormat = new DecimalFormat("#.##");
					Order order = createOrder(customer, session);
					createDelivery(customer.getAddress(), deliveryType, order);
					double totalPrice = 0;
					for (Cart cart : cartList) {
						totalPrice += cart.getPrice() * cart.getQuantity();
					}
					if (session.getAttribute("account") != null && voucherId > 0) {
						Voucher voucher = voucherService.findById(voucherId);
						createExchage(voucher, order, session);
						totalPrice = totalPrice - (totalPrice * voucher.getPrice() / 100);
					}
					Payment payment = createPayment(paymentMethod, order, Double.valueOf(decimalFormat.format(totalPrice)));
					if (createOrderDetail(order, cartList)) {
						if (paymentMethod.equalsIgnoreCase("pay at home")) {
							modelMap.put("msg", "Your order has created, we will accept your order in 24 hours");
						} else if (paymentMethod.equalsIgnoreCase("pay by paypal")) {
							PayPalConfig paypalConfig = new PayPalConfig();
							modelMap.put("ppmsg", "Your order has created, please wait few second to going to Paypal");
							modelMap.put("posturl", paypalConfig.getPosturl());
							modelMap.put("business", paypalConfig.getBusiness());
							modelMap.put("returnurl", paypalConfig.getReturnurl() + "?paymentId=" + payment.getId());
							modelMap.put("paypalItemList", createPaypalItemList(cartList, voucherId));
						}
						session.removeAttribute("cartList");
					}
				}
			} else {
				modelMap.put("err", "Please add product(s) to cart before you make an order");
			}

		} catch (Exception e) {
			System.err.println("PatmentController - index :\n" + e.getMessage());
			modelMap.put("err", "Somethings went wrong, your order can not be made");
		}
		return "user.payment.index";
	}

	@RequestMapping(value = "success", method = RequestMethod.GET)
	public String success(@RequestParam("paymentId") int paymenId, HttpSession session, ModelMap modelMap,
			HttpServletRequest request) {
		try {
			PayPalSuccess payPalSuccess = new PayPalSuccess();
			PayPalResult result = payPalSuccess.getPayPal(request);
			Payment payment = paymentService.retrieveById(paymenId);
			if (payment != null) {
				payment.setPaypalCustomer(result.getFirst_name() + " " + result.getLast_name());
				payment.setPaypalGross(Double.parseDouble(result.getMc_gross()));
				payment.setPaypalFee(Double.parseDouble(result.getMc_fee()));
				payment.setStatus(true);
				paymentService.save(payment);
				modelMap.put("msg", "Your payment has succeeded, we will accept your order in 24 hours");
				modelMap.put("customer", new Customer());
				String content = "Order has paid from Paypal payment<br/>" + "Customer Name : "
						+ payment.getOrder().getCustomerName() + "<br/>" + "Customer Email : "
						+ payment.getOrder().getCustomerEmail() + "<br/>" + "Customer Phone : "
						+ payment.getOrder().getCustomerPhone() + "<br/>" + "Order ID : " + payment.getOrder().getId()
						+ "<br/>" + "Order Code : " + payment.getOrder().getCode() + "<br/>";
				mailService.sendMail(payment.getOrder().getCustomerEmail(), "nvlteam123@gmail.com", "Paypal Pay",
						content);
			}
		} catch (Exception e) {
			System.err.println("PatmentController - success :\n" + e.getMessage());
		}
		return "user.payment.index";
	}

	@RequestMapping(value = "account-info", method = RequestMethod.GET)
	public void accountInfo(HttpSession session, HttpServletResponse response) {
		try {
			Account account = (Account) session.getAttribute("account");
			JsonObject object = new JsonObject();
			object.addProperty("fullName", account.getFullName());
			object.addProperty("phone", account.getPhone());
			object.addProperty("email", account.getEmail());
			object.addProperty("address", account.getAddress());
			PrintWriter printWriter = response.getWriter();
			printWriter.print(object);
			printWriter.flush();
			printWriter.close();
		} catch (Exception e) {
			System.err.println("PaymentController - accountInfo :\n" + e.getMessage());
		}
	}

	private boolean createExchage(Voucher voucher, Order order, HttpSession session) {
		try {
			Account account = (Account) session.getAttribute("account");
			Exchange exchange = new Exchange();
			exchange.setAccount(account);
			exchange.setVoucher(voucher);
			exchange.setPoint(voucher.getPoint());
			exchange.setOrder(order);
			exchange.setStatus(false);
			exchangeService.save(exchange);
			return true;
		} catch (Exception e) {
			System.err.println("PaymentController - createExchange :\n" + e.getMessage());
		}
		return false;
	}

	private boolean createOrderDetail(Order order, List<Cart> cartList) {
		try {
			for (Cart cart : cartList) {
				OrderDetail orderDetail = new OrderDetail();
				OrderDetailId orderDetailId = new OrderDetailId(order.getId(), cart.getProduct().getId());
				orderDetail.setId(orderDetailId);
				orderDetail.setOrder(order);
				orderDetail.setProduct(cart.getProduct());
				orderDetail.setPrice(cart.getPrice());
				orderDetail.setQuantity(cart.getQuantity());
				orderDetail.setStatus(true);
				orderDetailService.save(orderDetail);
			}
			return true;
		} catch (Exception e) {
			System.err.println("PaymentController : createOrderDetail :\n" + e.getMessage());
		}
		return false;
	}

	private Payment createPayment(String paymentType, Order order, double totalPrice) {
		try {
			Payment payment = new Payment();
			payment.setMethod(paymentType);
			payment.setPrice(totalPrice);
			payment.setOrder(order);
			payment.setStatus(false);
			paymentService.save(payment);
			return payment;
		} catch (Exception e) {
			System.err.println("PaymentController - choosePayment :\n" + e.getMessage());
		}
		return null;
	}

	private boolean createDelivery(String deliveryAddress, boolean deliveryType, Order order) {
		try {
			Delivery delivery = new Delivery();
			Date deliveryDate = new Date();
			if (deliveryType == true) {
				delivery.setType("Express");
			} else {
				delivery.setType("Normal");
			}
			delivery.setOrder(order);
			delivery.setDestination(deliveryAddress);
			delivery.setDeliveryDate(deliveryDate);
			delivery.setStatus("Awaiting");
			deliveryService.save(delivery);
			return true;
		} catch (Exception e) {
			System.err.println("PaymentContoller - createDelivery :\n" + e.getMessage());
		}
		return false;
	}

//	Edit order.setStatus to Awaiting 
	private Order createOrder(Customer customer, HttpSession session) {
		try {
			Order order = new Order();
			if (session.getAttribute("account") != null) {
				Account account = (Account) session.getAttribute("account");
				order.setAccount(account);
			}
			String code = randomString(5) + (orderService.max() + 1);
			order.setCustomerName(customer.getName());
			order.setCustomerPhone(customer.getPhone());
			order.setCustomerEmail(customer.getEmail());
			order.setStatus("Awaiting");
			order.setCode(code);
			return orderService.save(order);
		} catch (Exception e) {
			System.err.println("PaymentContoller - createOrder :\n" + e.getMessage());
		}
		return null;
	}

	private List<Cart> createPaypalItemList(List<Cart> cartList, int voucherId) {
		try {
			List<Cart> paypalItemList = new ArrayList<>();
			double discount = 0;
			if (voucherId > 0) {
				Voucher voucher = voucherService.findById(voucherId);
				discount = voucher.getPrice();
			}
			for (Cart cart : cartList) {
				if (discount > 0) {
					cart.setPrice(cart.getPrice() - (cart.getPrice() * discount / 100));
				}
				paypalItemList.add(cart);
			}
			return paypalItemList;
		} catch (Exception e) {
			System.err.println("PaymentContoller - createPaypalItemList :\n" + e.getMessage());
		}
		return null;
	}

	private String randomString(int length) {
		SecureRandom random = new SecureRandom();
		StringBuilder result = new StringBuilder(length);
		String lowercase = "abcdefghijklmnopqrstuvwxyz";
		String uppercase = lowercase.toUpperCase();
		String number = "0123456789";
		String forRandom = lowercase + uppercase + number;
		for (int i = 0; i < length; i++) {
			int charAt = random.nextInt(forRandom.length());
			char character = forRandom.charAt(charAt);
			result.append(character);
		}
		return result.toString();
	}

}
