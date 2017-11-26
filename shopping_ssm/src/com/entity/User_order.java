package com.entity;

import java.util.List;
public class User_order {
	private Integer id;                  //订单编号，自动增长	
	private String sumprice;
	private String createtime;
	private String username;
	private String order_status;             //订单状态
	
	public User_order(){}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSumprice() {
		return sumprice;
	}

	public void setSumprice(String sumprice) {
		this.sumprice = sumprice;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getOrder_status() {
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}

	@Override
	public String toString() {
		return "User_order [id=" + id + ", sumprice=" + sumprice
				+ ", createtime=" + createtime + ", username=" + username
				+ ", order_status=" + order_status + "]";
	}

	

	
	
}
