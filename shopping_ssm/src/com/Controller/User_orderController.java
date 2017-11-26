package com.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entity.User_order;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.service.User_orderService;

@Controller
@RequestMapping(value="/User_orderController")
public class User_orderController {
	@Autowired
	private User_orderService ords;	
	
	
	@ResponseBody
	@RequestMapping(value="/insertUser_order",produces="text/html;charset=UTF-8")
	public String insertUser_order(User_order order) throws JsonProcessingException {
		                  				//点击 加入购物车按钮时，即插入商品 到订单中，此时该订单的状态为0
		int a=ords.insertUser_order(order);
		ObjectMapper mapper=new ObjectMapper();
		String jackson=mapper.writeValueAsString(order);
		return jackson;
	}
	
	
	@ResponseBody
	@RequestMapping(value="/selectUser_orderByusername",produces="text/html;charset=UTF-8")
	public String selectUser_orderByusername(String username) throws JsonProcessingException {                 				
		List<User_order> listorder=ords.selectUser_orderByusername(username);
		ObjectMapper mapper=new ObjectMapper();
		String jackson=mapper.writeValueAsString(listorder);
		return jackson;
	}
	
}
