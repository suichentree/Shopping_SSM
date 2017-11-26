package com.serviceimpl;

import java.util.List;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.Shoppingcartdao;
import com.entity.Shoppingcart;
import com.service.ShoppingcartService;
@Service
public class ShoppingcartServiceImpl implements ShoppingcartService{

	
	@Autowired
	private Shoppingcartdao shoppingcs;
	
	@Override
	public int insertShoppingcart(Shoppingcart shoppingcart) {
	
		return shoppingcs.insertShoppingcart(shoppingcart);
	}

	@Override
	public int deleteShoppingcart(Shoppingcart shoppingcart) {
		return shoppingcs.deleteShoppingcart(shoppingcart);
	}

	@Override
	public int updateShoppingcart(Shoppingcart shoppingcart) {
		
		return shoppingcs.updateShoppingcart(shoppingcart);
	}

	@Override
	public Shoppingcart selectShoppingcart(Shoppingcart shoppingcart) {
		
		return shoppingcs.selectShoppingcart(shoppingcart);
	}

	@Override
	public List<Shoppingcart> selectAllShoppingcart() {
		
		return shoppingcs.selectAllShoppingcart();
	}

	@Override
	public Shoppingcart selectShoppingcartByname(String name) {
		
		return shoppingcs.selectShoppingcartByname(name);
	}

	@Override
	public List<Shoppingcart> selectShoppingcartByuser_nameandstatusandtime(Shoppingcart shoppingcart) {
		
		return shoppingcs.selectShoppingcartByuser_nameandstatusandtime(shoppingcart);
	}

	@Override
	public int updateShoppingcartByuser_name(Shoppingcart shoppingcart) {
		
		return shoppingcs.updateShoppingcartByuser_name(shoppingcart);
	}

	@Override
	public int deleteShoppingcartByusername_goodsname(Shoppingcart shoppingcart) {
		
		return shoppingcs.deleteShoppingcartByusername_goodsname(shoppingcart);
	}

}
