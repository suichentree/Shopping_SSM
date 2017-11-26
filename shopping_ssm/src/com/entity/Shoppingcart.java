package com.entity;

public class Shoppingcart {
	private Integer id;
	private String goods_name;
	private Double goods_price;
	private Integer goods_count;
	private String user_name;
	private Integer status;
	private String order_createtime;
	
	public Shoppingcart() {}

	
	

	public String getOrder_createtime() {
		return order_createtime;
	}




	public void setOrder_createtime(String order_createtime) {
		this.order_createtime = order_createtime;
	}




	public String getUser_name() {
		return user_name;
	}




	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	


	public Integer getStatus() {
		return status;
	}




	public void setStatus(Integer status) {
		this.status = status;
	}




	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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
		return "Shoppingcart [id=" + id + ", goods_name=" + goods_name
				+ ", goods_price=" + goods_price + ", goods_count="
				+ goods_count + ", user_name=" + user_name + ", status="
				+ status + ", order_createtime=" + order_createtime + "]";
	}







	



	

	
	
	
}
