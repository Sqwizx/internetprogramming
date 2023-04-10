package com.model;

import javax.persistence.*;

@Entity
@Table(name = "cart")
public class Cart {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int cartId;

	@Column(name = "paymentStatus", columnDefinition = "varchar(25) default 'not paid'")
	private String paymentStatus;

	public String getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public int getcartId() {
		return cartId;
	}

	public void setId(int cartId) {
		this.cartId = cartId;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Medicine getMedicine() {
		return medicine;
	}

	public void setMedicine(Medicine medicine) {
		this.medicine = medicine;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "quantity")
	private Integer quantity;

	@Column(name = "price")
	private Double price;

	@ManyToOne
	@JoinColumn(name = "medicine_id")
	private Medicine medicine;

	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	// Getters and setters for each field
	// ...
}
