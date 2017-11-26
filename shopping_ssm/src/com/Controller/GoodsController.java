package com.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.entity.Goods;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.service.GoodsService;



@Controller
@RequestMapping(value="/GoodsController")
public class GoodsController {
		
	@Autowired
	private GoodsService goodss;
	
	@ResponseBody
	@RequestMapping(value="/selectAllGoods",produces="text/html;charset=UTF-8")
	public String selectAllGoods() throws JsonProcessingException {
		List<Goods> go=goodss.selectAllGoods();            //查出所以商品信息
		ObjectMapper mapper = new ObjectMapper();       

		String mapJakcson = mapper.writeValueAsString(go);           //把查出的商品信息转换为json格式
		return mapJakcson;
		
		
	}
	

	
	
	@ResponseBody
	@RequestMapping(value="/selectGoods",produces="text/html;charset=UTF-8")
	public String selectGoods(Goods gods) throws JsonProcessingException {
		List<Goods> go=goodss.selectGoods(gods);        //查出所以商品信息
		ObjectMapper mapper = new ObjectMapper();       
	
		String mapJakcson = mapper.writeValueAsString(go);           //把查出的商品信息转换为json格式
		return mapJakcson;
		
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/selectGoodsByname",produces="text/html;charset=UTF-8")
	public String selectGoodsByname(String goods_name) throws JsonProcessingException {
		Goods go=goodss.selectGoodsByname(goods_name);        //查出所以商品信息
		ObjectMapper mapper = new ObjectMapper();       
	
		String mapJakcson = mapper.writeValueAsString(go);           //把查出的商品信息转换为json格式
		return mapJakcson;
		
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/updateGoods",produces="text/html;charset=UTF-8")
	public String updateGoods(Goods gods) throws JsonProcessingException {
		
		int a=goodss.updateGoods(gods);        //查出所以商品信息
		ObjectMapper mapper = new ObjectMapper();       
	
		
		String mapJakcson = mapper.writeValueAsString(gods);           //把查出的商品信息转换为json格式
		return mapJakcson;
		
		
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteGoods",produces="text/html;charset=UTF-8")
	public String deleteGoods(Goods gods) throws JsonProcessingException {
		
		int b=goodss.deleteGoods(gods);   //查出所有商品信息
		
		ObjectMapper mapper = new ObjectMapper();       
	
		
		String mapJakcson = mapper.writeValueAsString(gods);           //把查出的商品信息转换为json格式
		return mapJakcson;
		
		
	}
	
	@ResponseBody
	@RequestMapping(value="/insertGoods",produces="text/html;charset=UTF-8")
	public String insertGoods(Goods gods) throws JsonProcessingException {
		
		int b=goodss.insertGoods(gods);   //查出所有商品信息
		
		ObjectMapper mapper = new ObjectMapper();       
	
		
		String mapJakcson = mapper.writeValueAsString(gods);           //把查出的商品信息转换为json格式
		return mapJakcson;
		
		
	}
	
}
