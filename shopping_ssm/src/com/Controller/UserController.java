package com.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.entity.Message;
import com.entity.User;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.service.UserService;

@Controller
@RequestMapping(value="/UserController")
public class UserController {
	@Autowired
	private UserService uss;
	
	
	
	@RequestMapping(value="/login")
	public ModelAndView login(ModelAndView mv,User us,HttpServletRequest request ) {
		
			User a=uss.selectUserByusername(us);
			
			if(a!=null){
				if(a.getPassword().equals(us.getPassword())) {
					if(a.getStatus()==2){
						mv.setViewName("manager");
					}else{
						//把登陆用户，放进session 对象中
						HttpSession session = request.getSession();
						session.setAttribute("user", us.getUsername());
						mv.setViewName("index");
						
					}
					
				}else{
					mv.setViewName("shibai");
				}
				
			}else {
				mv.setViewName("shibai");
			}
			
			return mv;
			
		
		
		
	}
	
	
	@RequestMapping(value="/zhuce")
	public ModelAndView zhuce(ModelAndView mv,User us,HttpServletRequest request) {
		
		User a=uss.selectUserByusername(us);           
		if(a!=null){
			mv.setViewName("shibai");
		}else {
			uss.insertUser(us);             //把注册的数据插入数据库
			HttpSession session = request.getSession();
			session.setAttribute("user", us.getUsername());
			mv.setViewName("index");
		}
		
		return mv;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/selectAlluser",produces="text/html;charset=UTF-8")
	public String selectAlluser() throws JsonProcessingException {
		
		List<User> user=uss.selectAllUser();                     //查询全部用户信息
		ObjectMapper mapper=new ObjectMapper();
		
		String jackson=mapper.writeValueAsString(user);         //将查询的用户信息，转换为json格式
		
		return jackson;
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/selectUserByusername",produces="text/html;charset=UTF-8")
	public String selectUserByusername(User user) throws JsonProcessingException {
		
		User us=uss.selectUserByusername(user);                //通过用户名，查询用户信息
		ObjectMapper mapper=new ObjectMapper();
		
		String jackson=mapper.writeValueAsString(us);         //将查询的用户信息，转换为json格式
		
		return jackson;
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/updateUser",produces="text/html;charset=UTF-8")
	public String updateUser(User user) throws JsonProcessingException {
		
		int a=uss.updateUser(user);       
		
		//Message me=new Message("success");
		ObjectMapper mapper=new ObjectMapper();
		
		String jackson=mapper.writeValueAsString(user);         
		
		return jackson;
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/selectUser",produces="text/html;charset=UTF-8")
	public String selectUser(User user) throws JsonProcessingException {
		
		User u=uss.selectUser(user);       
		
		//Message me=new Message("success");
		ObjectMapper mapper=new ObjectMapper();
		
		String jackson=mapper.writeValueAsString(u);         
		
		return jackson;
		
	}
	
	
}
