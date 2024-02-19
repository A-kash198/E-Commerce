package com.tech.model;

public class Order extends Product {

	private int OrderId;
	private int uid;
	private int quantity;
	private String date;
	public Order() {
	}
	public Order(int orderId, int uid, int quantity, String date) {

		OrderId = orderId;
		this.uid = uid;
		this.quantity = quantity;
		this.date = date;
	}
	public int getOrderId() {
		return OrderId;
	}
	public void setOrderId(int orderId) {
		OrderId = orderId;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}

}
