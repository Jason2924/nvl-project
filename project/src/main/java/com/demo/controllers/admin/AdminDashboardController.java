package com.demo.controllers.admin;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.demo.entities.Account;
import com.demo.entities.Order;
import com.demo.entities.OrderDetail;
import com.demo.entities.Payment;
import com.demo.entities.Price;
import com.demo.entities.Promotion;
import com.demo.entities.PromotionDetail;
import com.demo.services.AccountService;
import com.demo.services.BrandService;
import com.demo.services.OrderDetailService;
import com.demo.services.OrderService;
import com.demo.services.PriceService;
import com.demo.services.ProductService;
import com.demo.services.PromotionService;

@Controller
@RequestMapping(value = { "admin", "admin/dashboard" })
public class AdminDashboardController {
	@Autowired
	private OrderService orderService;

	@Autowired
	private AccountService accountService;

	@Autowired
	private ProductService productService;

	@Autowired
	private PromotionService promotionService;

//	@Autowired
//	private ExchangeService exchangeService;

	@Autowired
	private PriceService priceService;

	@Autowired
	private OrderDetailService orderDetailService;

	@Autowired
	private BrandService brandService;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(HttpSession session, ModelMap modelMap) {
		try {
			User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			session.setAttribute("username", user.getUsername());
			
			// @NANG Code start
			// - khi ong Accepted xong thi nho remove va set lai cai session nay de no update du lieu nha
			// @NANG Code end
			
			modelMap.put("account", new Account());
			modelMap.put("totalOrder", orderService.countTotalOrder());
			modelMap.put("totalAccount", accountService.countTotalAccount(true));

			modelMap.put("totalProduct", productService.countTotalProduct(true));
			// set this month and last month for comparison
			Date today = new Date();
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(today);
			int thisMonth = calendar.get(Calendar.MONTH) + 1;
			int lastMonth = calendar.get(Calendar.MONTH);
			if (lastMonth == 0) {
				lastMonth = 12;
			}
			// set promotion statistics
			double promotionPresentPrices = 0;
			for (Order order : orderService.findAllByMonth(thisMonth, calendar.get(Calendar.YEAR))) {
				for (Payment payment : order.getPayments()) {
					if (payment.getStatus()) {
						for (OrderDetail orderDetail : order.getOrderDetails()) {
							for (PromotionDetail promotionDetail : orderDetail.getProduct().getPromotionDetails()) {
								Promotion promotion = promotionDetail.getPromotion();
								int compareStartDate = promotion.getStartDate().compareTo(order.getCreatedDate());
								int compareEndDate = promotion.getEndDate().compareTo(order.getCreatedDate());
								if (compareStartDate < 1 && compareEndDate > -1) {
									promotionPresentPrices += promotion.getPrice();
								}
							}
						}
					}
				}
			}
			double promotionPastPrices = 0;
			for (Order order : orderService.findAllByMonth(lastMonth, calendar.get(Calendar.YEAR))) {
				for (Payment payment : order.getPayments()) {
					if (payment.getStatus()) {
						for (OrderDetail orderDetail : order.getOrderDetails()) {
							for (PromotionDetail promotionDetail : orderDetail.getProduct().getPromotionDetails()) {
								Promotion promotion = promotionDetail.getPromotion();
								int compareStartDate = promotion.getStartDate().compareTo(order.getCreatedDate());
								int compareEndDate = promotion.getEndDate().compareTo(order.getCreatedDate());
								if (compareStartDate < 1 && compareEndDate > -1) {
									promotionPresentPrices += promotion.getPrice();
								}
							}
						}
					}
				}
			}
			double promotionPriceRate = 0;
			if (promotionPastPrices == 0) {
				if (promotionPresentPrices == 0) {
					promotionPriceRate = 0;
				} else {
					promotionPriceRate = 100;
				}
			} else {
				promotionPriceRate = (promotionPresentPrices - promotionPastPrices) * 100 / promotionPastPrices;
			}
			modelMap.put("promotionPriceRate", promotionPriceRate);
			double promotionTotalPrice = 0;
			for (Order order : orderService.findAll()) {
				for (Payment payment : order.getPayments()) {
					if (payment.getStatus()) {
						for (OrderDetail orderDetail : order.getOrderDetails()) {
							for (PromotionDetail promotionDetail : orderDetail.getProduct().getPromotionDetails()) {
								Promotion promotion = promotionDetail.getPromotion();
								int compareStartDate = promotion.getStartDate().compareTo(order.getCreatedDate());
								int compareEndDate = promotion.getEndDate().compareTo(order.getCreatedDate());
								if (compareStartDate < 1 && compareEndDate > -1) {
									promotionTotalPrice += promotion.getPrice() / 100 * orderDetail.getPrice()
											* orderDetail.getQuantity();
								}
							}
						}
					}
				}
			}
			modelMap.put("promotionTotalPrice", promotionTotalPrice);
			// set exchange statistics
//			double exchangePresentPrices = 0;
//			for (Exchange exchange : exchangeService.findAllByMonth(thisMonth)) {
//				exchangePresentPrices += exchange.getVoucher().getPrice();
//			}
//			double exchangePastPrices = 0;
//			for (Exchange exchange : exchangeService.findAllByMonth(lastMonth)) {
//				exchangePastPrices += exchange.getVoucher().getPrice();
//			}
//			double exchangePriceRate = 0;
//			if (exchangePastPrices == 0) {
//				exchangePriceRate = 100;
//			} else {
//				exchangePriceRate = (exchangePresentPrices - exchangePastPrices) * 100 / exchangePastPrices;
//			}
//			modelMap.put("exchangePriceRate", exchangePriceRate);
//			double exchangeTotalPrice = 0;
//			for (Exchange exchange : exchangeService.findAll()) {
//				exchangeTotalPrice += exchange.getVoucher().getPrice();
//			}
//			modelMap.put("exchangeTotalPrice", exchangeTotalPrice);
			// set order statistics
			int ordersPresent = orderService.findAllByMonth(thisMonth, calendar.get(Calendar.YEAR)).size();
			int ordersPast = orderService.findAllByMonth(lastMonth, calendar.get(Calendar.YEAR)).size();
			double orderRate = 100;
			if (ordersPast != 0) {
				orderRate = (ordersPresent - ordersPast) * 100 / ordersPast;
			}
			modelMap.put("ordersPresent", ordersPresent);
			modelMap.put("orderRate", orderRate);
			// set product statistics
			double maxIncreaseRate = 0, minIncreaseRate = Double.POSITIVE_INFINITY, maxDescreaseRate = 0,
					minDescreaseRate = Double.NEGATIVE_INFINITY;
			int maxIncreaseId = 0, minIncreaseId = 0, maxDescreaseId = 0, minDescreaseId = 0;
			for (int i = 1; i <= productService.findMaxId(); ++i) {
				double presentPrice = priceService.findByProductId(i, true).getPrice();
				double pastPrice = 0;
				for (Price price : priceService.findAllByProductId(i, false)) {
					if (price.getPrice() > pastPrice) {
						pastPrice = price.getPrice();
					}
				}
				double temp = 0;
				if (pastPrice != 0) {
					temp = (presentPrice - pastPrice) * 100 / pastPrice;
				}
				if (temp > 0) {
					if (temp > maxIncreaseRate) {
						maxIncreaseRate = temp;
						maxIncreaseId = i;
					}
					if (temp < minIncreaseRate) {
						minIncreaseRate = temp;
						minIncreaseId = i;
					}
				} else if (temp < 0) {
					if (temp < maxDescreaseRate) {
						maxDescreaseRate = temp;
						maxDescreaseId = i;
					}
					if (temp > minDescreaseRate) {
						minDescreaseRate = temp;
						minDescreaseId = i;
					}
				}
			}
			modelMap.put("maxIncreaseProduct", productService.findById(maxIncreaseId));
			modelMap.put("maxIncreaseRate", maxIncreaseRate);
			modelMap.put("minIncreaseProduct", productService.findById(minIncreaseId));
			modelMap.put("minIncreaseRate", minIncreaseRate);
			modelMap.put("maxDescreaseProduct", productService.findById(maxDescreaseId));
			modelMap.put("maxDescreaseRate", maxDescreaseRate);
			modelMap.put("minDescreaseProduct", productService.findById(minDescreaseId));
			modelMap.put("minDescreaseRate", minDescreaseRate);
			// set tops list statistic
			// set bestProduct
			modelMap.put("bestProduct", productService.findById(orderDetailService.getMostProductId()));
			modelMap.put("bestProductQuantity", orderDetailService.getMostProductQuantity());
			// set bestBrand
			modelMap.put("bestBrand", brandService.findById(orderDetailService.getBrandIdByMaxPrice()));
			modelMap.put("bestBrandTotalPrice", orderDetailService.getTotalMaxPriceByBrand());
			// set bestBuyer
			modelMap.put("bestBuyer", accountService.find(accountService.getAccountIdByMaxPaymentPrices()));
			modelMap.put("bestPriceBuyer", accountService.getMaxPaymentPrices());
			// set bestVoucher
			modelMap.put("bestVoucher", accountService.find(accountService.getAccountIdByMaxVoucher()));
			modelMap.put("bestTotalVoucher", accountService.getTotalVoucher());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin.dashboard.index";
	}
}
