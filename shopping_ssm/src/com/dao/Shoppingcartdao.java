package com.dao;

import java.util.List;


import com.entity.Shoppingcart;

public interface Shoppingcartdao {
	public int insertShoppingcart(Shoppingcart shoppingcart);
	public int deleteShoppingcart(Shoppingcart shoppingcart);
	public int deleteShoppingcartByusername_goodsname(Shoppingcart shoppingcart);
	public int updateShoppingcart(Shoppingcart shoppingcart);
	public int updateShoppingcartByuser_name(Shoppingcart shoppingcart);
	public Shoppingcart selectShoppingcart(Shoppingcart shoppingcart);
	public Shoppingcart selectShoppingcartByname(String name);
	public List<Shoppingcart> selectShoppingcartByuser_nameandstatusandtime(Shoppingcart shoppingcart);
	public List<Shoppingcart> selectAllShoppingcart();	
}
