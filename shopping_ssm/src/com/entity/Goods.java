package com.entity;

public class Goods {

	private Integer id;
	private String type;
	private String suitpeople;
	private String name;
	private Double market_price;
	private Double shop_price;
	private String createtime;
	
	
	public Goods() {}

	
	public String getSuitpeople() {
		return suitpeople;
	}


	public void setSuitpeople(String suitpeople) {
		this.suitpeople = suitpeople;
	}


	public String getCreatetime() {
		return createtime;
	}


	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getMarket_price() {
		return market_price;
	}

	public void setMarket_price(Double market_price) {
		this.market_price = market_price;
	}

	public Double getShop_price() {
		return shop_price;
	}

	public void setShop_price(Double shop_price) {
		this.shop_price = shop_price;
	}


	@Override
	public String toString() {
		return "Goods [id=" + id + ", type=" + type + ", suitpeople=" + suitpeople + ", name=" + name
				+ ", market_price=" + market_price + ", shop_price=" + shop_price + ", createtime=" + createtime + "]";
	}

	
	
}
