package com.entity;

public class Order_goodsMessage {
	private Integer order_id;
	
	private String goods_name;
	private Double goods_price;
	private Integer goods_count;
	private String username;
	
	public Order_goodsMessage(){}

	public Integer getOrder_id() {
		return order_id;
	}

	public void setOrder_id(Integer order_id) {
		this.order_id = order_id;
	}

	

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getGoods_name() {
		return goods_name;
	}

	public void setGoods_name(String goods_name) {
		this.goods_name = goods_name;
	}

	public Double getGoods_price() {
		return goods_price;
	}

	public void setGoods_price(Double goods_price) {
		this.goods_price = goods_price;
	}

	public Integer getGoods_count() {
		return goods_count;
	}

	public void setGoods_count(Integer goods_count) {
		this.goods_count = goods_count;
	}

	@Override
	public String toString() {
		return "Order_goodsMessage [order_id=" + order_id + ", goods_name="
				+ goods_name + ", goods_price=" + goods_price
				+ ", goods_count=" + goods_count + ", username=" + username
				+ "]";
	}

	
	
	
	
}
