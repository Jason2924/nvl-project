package com.demo.controllers.admin;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
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
import com.demo.entities.Delivery;
import com.demo.entities.Status;
import com.demo.services.DeliveryService;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.google.common.collect.Lists;
import com.google.gson.Gson;

@Controller
@RequestMapping("admin/delivery")
public class AdminDeliveryController {
	@Autowired
	private DeliveryService deliveryService;

	@RequestMapping(value = { "", "index" }, method = RequestMethod.GET)
	public String index(ModelMap modelMap) {
		try {
			modelMap.put("deliveries", deliveryService.findAll());
			modelMap.put("statuses", deliveryService.getStatuses());
			List<Status> statusesEdit = deliveryService.getStatuses();
			statusesEdit.remove(0);
			modelMap.put("statusesEdit", statusesEdit);
			List<String> types = new ArrayList<>();
			types.add("Normal");
			types.add("Express");
			modelMap.put("types", types);
			modelMap.put("deliveryJson", new DeliveryJson());
			modelMap.put("account", new Account());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin.delivery.index";
	}

	@RequestMapping(value = "update", method = RequestMethod.GET)
	@ResponseBody
	public String update(@RequestParam("deliveryId") int deliveryId) {
		try {
			// find status for delivery
			Delivery delivery = deliveryService.findById(deliveryId);
			DeliveryJson deliveryJson = new DeliveryJson();
			deliveryJson.setId(delivery.getId());
			deliveryJson.setOrderCode(delivery.getOrder().getCode());
			deliveryJson.setType(delivery.getType());
			deliveryJson.setDeliveryDate(delivery.getDeliveryDate());
			deliveryJson.setDestination(delivery.getDestination());
			Status status = deliveryService.findStatusByName(delivery.getStatus());
			deliveryJson.setStatus(String.valueOf(status.getId()));
			return new Gson().toJson(deliveryJson);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(@ModelAttribute("deliveryJson") DeliveryJson deliveryJson) {
		try {
			Delivery delivery = deliveryService.findById(deliveryJson.getId());
			delivery.setType(deliveryJson.getType());
			int statusId = Integer.parseInt(deliveryJson.getStatus());
			delivery.setStatus(deliveryService.findStatusById(statusId).getName());
			deliveryService.save(delivery);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:";
	}

	@RequestMapping(value = "ajaxDeliveryStatus", method = RequestMethod.GET)
	@ResponseBody
	public String ajaxDeliveryStatus(@RequestParam("statusId") int statusId) {
		try {
			List<Delivery> deliveries = new ArrayList<>();
			if (statusId == 0) {
				deliveries = Lists.newArrayList(deliveryService.findAll());
			} else {
				deliveries = deliveryService.findAllByStatus(deliveryService.findStatusById(statusId).getName());
			}
			List<DeliveryJson> deliveryJsons = new ArrayList<>();
			for (Delivery delivery : deliveries) {
				DeliveryJson deliveryJson = new DeliveryJson();
				deliveryJson.setId(delivery.getId());
				deliveryJson.setOrderCode(delivery.getOrder().getCode());
				deliveryJson.setType(delivery.getType());
				deliveryJson.setDeliveryDate(delivery.getDeliveryDate());
				deliveryJson.setDestination(delivery.getDestination());
				deliveryJson.setStatus(delivery.getStatus());
				deliveryJsons.add(deliveryJson);
			}
			return new Gson().toJson(deliveryJsons);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@RequestMapping(value = "ajaxDeliverySort", method = RequestMethod.POST)
	@ResponseBody
	public String ajaxOrderSort(@RequestBody List<DeliveryJson> deliveryJsons, @RequestParam("header") String header,
			@RequestParam("turn") String turn) {
		try {
			switch (header) {
			case "thOrder":
				if (turn.equals("0")) {
					Collections.sort(deliveryJsons, new DeliveryOrderSort());
				} else {
					Collections.sort(deliveryJsons, new DeliveryOrderSort().reversed());
				}
				break;
			case "thType":
				if (turn.equals("0")) {
					Collections.sort(deliveryJsons, new DeliveryTypeSort());
				} else {
					Collections.sort(deliveryJsons, new DeliveryTypeSort().reversed());
				}
				break;
			case "thDeliveryDate":
				if (turn.equals("0")) {
					Collections.sort(deliveryJsons, new DeliveryDeliveryDateSort());
				} else {
					Collections.sort(deliveryJsons, new DeliveryDeliveryDateSort().reversed());
				}
				break;
			case "thDestination":
				if (turn.equals("0")) {
					Collections.sort(deliveryJsons, new DeliveryDestinationSort());
				} else {
					Collections.sort(deliveryJsons, new DeliveryDestinationSort().reversed());
				}
				break;
			case "thStatus":
				if (turn.equals("0")) {
					Collections.sort(deliveryJsons, new DeliveryStatusSort());
				} else {
					Collections.sort(deliveryJsons, new DeliveryStatusSort().reversed());
				}
				break;
			}
			return new Gson().toJson(deliveryJsons);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}

//temp class to store needed data
class DeliveryJson implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private String orderCode;
	private String type;
	@JsonDeserialize(using = CustomDateAndTimeDeserialize.class)
	private Date deliveryDate;
	private String destination;
	private String status;

	public DeliveryJson(int id, String orderCode, String type, Date deliveryDate, String destination, String status) {
		super();
		this.id = id;
		this.orderCode = orderCode;
		this.type = type;
		this.deliveryDate = deliveryDate;
		this.destination = destination;
		this.status = status;
	}

	public DeliveryJson() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Date getDeliveryDate() {
		return deliveryDate;
	}

	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}

//comparing classes
class DeliveryOrderSort implements Comparator<DeliveryJson> {

	@Override
	public int compare(DeliveryJson deliveryJson1, DeliveryJson deliveryJson2) {
		return deliveryJson1.getOrderCode().compareTo(deliveryJson2.getOrderCode());
	}
}

class DeliveryTypeSort implements Comparator<DeliveryJson> {

	@Override
	public int compare(DeliveryJson deliveryJson1, DeliveryJson deliveryJson2) {
		return deliveryJson1.getType().compareTo(deliveryJson2.getType());
	}

}

class DeliveryDeliveryDateSort implements Comparator<DeliveryJson> {

	@Override
	public int compare(DeliveryJson deliveryJson1, DeliveryJson deliveryJson2) {
		if (deliveryJson1.getDeliveryDate() != null && deliveryJson2.getDeliveryDate() == null) {
			return 1;
		} else if (deliveryJson1.getDeliveryDate() == null && deliveryJson2.getDeliveryDate() == null) {
			return 0;
		} else if (deliveryJson1.getDeliveryDate() == null && deliveryJson2.getDeliveryDate() != null) {
			return -1;
		} else {
			return deliveryJson1.getDeliveryDate().compareTo(deliveryJson2.getDeliveryDate());
		}
	}

}

class DeliveryDestinationSort implements Comparator<DeliveryJson> {
	@Override
	public int compare(DeliveryJson deliveryJson1, DeliveryJson deliveryJson2) {
		return deliveryJson1.getDestination().compareTo(deliveryJson2.getDestination());
	}
}

class DeliveryStatusSort implements Comparator<DeliveryJson> {

	@Override
	public int compare(DeliveryJson deliveryJson1, DeliveryJson deliveryJson2) {
		return deliveryJson1.getStatus().compareTo(deliveryJson2.getStatus());
	}

}
