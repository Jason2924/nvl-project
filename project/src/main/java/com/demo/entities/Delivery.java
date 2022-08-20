package com.demo.entities;
// Generated Jun 4, 2020 2:35:22 PM by Hibernate Tools 5.1.10.Final

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;

/**
 * Delivery generated by hbm2java
 */
@Entity
@Table(name = "delivery", catalog = "nvl", uniqueConstraints = @UniqueConstraint(columnNames = "orderId"))
public class Delivery implements java.io.Serializable {

	private Integer id;
	private Order order;
	private String type;
	private String destination;
	private Date deliveryDate;
	private String status;
	private Date createdDate;
	private Date modifiedDate;

	public Delivery() {
	}

	public Delivery(Order order, Date createdDate, Date modifiedDate) {
		this.order = order;
		this.createdDate = createdDate;
		this.modifiedDate = modifiedDate;
	}

	public Delivery(Order order, String type, String destination, Date deliveryDate, String status, Date createdDate,
			Date modifiedDate) {
		this.order = order;
		this.type = type;
		this.destination = destination;
		this.deliveryDate = deliveryDate;
		this.status = status;
		this.createdDate = createdDate;
		this.modifiedDate = modifiedDate;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "orderId", unique = true, nullable = false)
	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@Column(name = "type", length = 100)
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "destination", length = 250)
	public String getDestination() {
		return this.destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "deliveryDate", length = 10)
	public Date getDeliveryDate() {
		return this.deliveryDate;
	}

	public void setDeliveryDate(Date deliveryDate) {
		this.deliveryDate = deliveryDate;
	}

	@Column(name = "status", length = 100)
	public String getStatus() {
		return this.status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "createdDate", nullable = false, insertable = false, updatable = false, length = 19)
	public Date getCreatedDate() {
		return this.createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "modifiedDate", nullable = false, insertable = false, updatable = false, length = 19)
	public Date getModifiedDate() {
		return this.modifiedDate;
	}

	public void setModifiedDate(Date modifiedDate) {
		this.modifiedDate = modifiedDate;
	}

}