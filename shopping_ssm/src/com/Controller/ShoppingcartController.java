package com.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.Goods;
import com.entity.Shoppingcart;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.service.GoodsService;
import com.service.ShoppingcartService;

@Controller
@RequestMapping(value="/ShoppingcartController")
public class ShoppingcartController {
		
	@Autowired
	private ShoppingcartService shoppingcs;
	
	@Autowired
	private GoodsService goodss;
	
	/**0，该方法是Goods类的参数，会存放一个商品名称，其余为null。 另一个Shoppingcart 类的参数，会有一个用户名称，其余为null。
	 * 1，通过传来的商品名称，查询该名称下的商品全部信息，获取传来的用户名称，表示这件商品属于该用户，应存放在该用户的购物车中
	 * 2，通过商品名称，查看购物车中是否存在，该商品。
	 * 3，若存在，该商品数量+1.
	 * 4，若不存在，取出商品的名称，销售价。
	 * 5.其中作为参数的Shoppingcart 类， 把商品的名称，销售价，放到Shoppingcart 类的名称，销售价并把商品的数量 置为1，此时该Shoppingcart 类会有商品的名称，销售价，商品数量，用户名称属性
	 *
	 *	 * */
	@ResponseBody
	@RequestMapping(value="/insertShoppingcart",produces="text/html;charset=UTF-8")
	public String insertShoppingcart(Shoppingcart sc) throws JsonProcessingException {
		
		
		ObjectMapper mapper=new ObjectMapper();         //jackson中将java 对象转为json 的类
		
		Goods golist=goodss.selectGoodsByname(sc.getGoods_name());        //通过传来的商品名称，来查询该商品的全部信息
		
		Shoppingcart shcart=shoppingcs.selectShoppingcart(sc);      //通过商品名称,用户名称，来查询该用户的购物车表中该商品是否存在
		
		if(shcart!=null){
			
			shcart.setGoods_count(shcart.getGoods_count()+1);       //当多次点击同一商品的加入购物车按钮时，对应的购物车表的商品数量加1.
			int a=shoppingcs.updateShoppingcart(shcart);
			String stringj=mapper.writeValueAsString(shcart);
			return stringj;
		
		
		}else{
			sc.setGoods_name(golist.getName());
			sc.setGoods_count(1);
			sc.setGoods_price(golist.getShop_price());
			int a=shoppingcs.insertShoppingcart(sc);
			String jackson=mapper.writeValueAsString(sc);
			return jackson;

		}
			
	}
	
	
	@ResponseBody
	@RequestMapping(value="/updateShoppingcart",produces="text/html;charset=UTF-8")
	public String updateShoppingcart(Shoppingcart shoppingcart) throws JsonProcessingException {
		
		int a=shoppingcs.updateShoppingcart(shoppingcart);
		
		ObjectMapper mapper=new ObjectMapper();
		
		String jackson=mapper.writeValueAsString(shoppingcart);
		
		return jackson;

		
		
		
	}
	
	
	
	
	@ResponseBody
	@RequestMapping(value="/updateShoppingcartByuser_name",produces="text/html;charset=UTF-8")
	public String updateShoppingcartByuser_name(Shoppingcart shoppingcart) throws JsonProcessingException {
		
		System.out.println("shoppingcart_______________"+shoppingcart);
		int a=shoppingcs.updateShoppingcartByuser_name(shoppingcart);
		
		ObjectMapper mapper=new ObjectMapper();
		
		String jackson=mapper.writeValueAsString(shoppingcart);
		
		return jackson;	
	}
	
	@ResponseBody
	@RequestMapping(value="/selectAllShoppingcart",produces="text/html;charset=UTF-8")
	public String selectAllShoppingcart() throws JsonProcessingException {
			
		
		List<Shoppingcart> shc=shoppingcs.selectAllShoppingcart();
		
		ObjectMapper mapper=new ObjectMapper();
		
		String jackson=mapper.writeValueAsString(shc);
		
		return jackson;
	
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/selectShoppingcartByuser_nameandstatusandtime",produces="text/html;charset=UTF-8")
	public String selectShoppingcartByuser_nameandstatusandtime(Shoppingcart shoppingcart) throws JsonProcessingException {
		System.out.println("shoppingcart——————————————"+shoppingcart);
		
		
		List<Shoppingcart>  shc=shoppingcs.selectShoppingcartByuser_nameandstatusandtime(shoppingcart);
		
		ObjectMapper mapper=new ObjectMapper();
		
		String jackson=mapper.writeValueAsString(shc);
		
		return jackson;
	
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/deleteShoppingcartByusername_goodsname",produces="text/html;charset=UTF-8")
	public String deleteShoppingcartByusername_goodsname(Shoppingcart shoppingcart) throws JsonProcessingException {
		System.out.println("shoppingcart——————————————"+shoppingcart);
		
		
		int a=shoppingcs.deleteShoppingcartByusername_goodsname(shoppingcart);
		
		ObjectMapper mapper=new ObjectMapper();
		
		String jackson=mapper.writeValueAsString(shoppingcart);
		
		return jackson;
	
		
	}
}
