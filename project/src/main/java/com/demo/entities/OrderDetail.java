package com.demo.entities;
// Generated Jun 4, 2020 2:35:22 PM by Hibernate Tools 5.1.10.Final

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * OrderDetail generated by hbm2java
 */
@Entity
@Table(name = "order_detail", catalog = "nvl")
public class OrderDetail implements java.io.Serializable {

	private OrderDetailId id;
	private Order order;
	private Product product;
	private double price;
	private int quantity;
	private boolean status;

	public OrderDetail() {
	}

	public OrderDetail(OrderDetailId id, Order order, Product product, double price, int quantity, boolean status) {
		this.id = id;
		this.order = order;
		this.product = product;
		this.price = price;
		this.quantity = quantity;
		this.status = status;
	}

	@EmbeddedId

	@AttributeOverrides({ @AttributeOverride(name = "orderId", column = @Column(name = "orderId", nullable = false)),
			@AttributeOverride(name = "productId", column = @Column(name = "productId", nullable = false)) })
	public OrderDetailId getId() {
		return this.id;
	}

	public void setId(OrderDetailId id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "orderId", nullable = false, insertable = false, updatable = false)
	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "productId", nullable = false, insertable = false, updatable = false)
	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Column(name = "price", nullable = false, precision = 22, scale = 0)
	public double getPrice() {
		return this.price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	@Column(name = "quantity", nullable = false)
	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Column(name = "status", nullable = false)
	public boolean isStatus() {
		return this.status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

}