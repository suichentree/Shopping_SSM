package com.service;

import java.util.List;

import com.entity.Shoppingcart;

public interface ShoppingcartService {
	public int insertShoppingcart(Shoppingcart shoppingcart);
	public int deleteShoppingcart(Shoppingcart shoppingcart);
	public int deleteShoppingcartByusername_goodsname(Shoppingcart shoppingcart);
	
	public int updateShoppingcart(Shoppingcart shoppingcart);
	public Shoppingcart selectShoppingcart(Shoppingcart shoppingcart);
	public Shoppingcart selectShoppingcartByname(String name);
	public List<Shoppingcart> selectShoppingcartByuser_nameandstatusandtime(Shoppingcart shoppingcart);
	public List<Shoppingcart> selectAllShoppingcart();	
	public int updateShoppingcartByuser_name(Shoppingcart shoppingcart);
}
