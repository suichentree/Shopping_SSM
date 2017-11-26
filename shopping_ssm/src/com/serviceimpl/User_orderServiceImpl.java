package com.serviceimpl;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.User_orderdao;
import com.entity.User_order;
import com.service.User_orderService;
@Service
public class User_orderServiceImpl implements User_orderService {
	
	@Autowired
	private User_orderdao orderdao;

	@Override
	public int insertUser_order(User_order order) {
	
		return orderdao.insertUser_order(order);
	}

	@Override
	public int deleteUser_order(User_order order) {
	
		return orderdao.deleteUser_order(order);
	}

	@Override
	public int updateUser_order(User_order order) {
		
		return orderdao.updateUser_order(order);
	}

	@Override
	public User_order selectUser_order(User_order order) {
		
		return orderdao.selectUser_order(order);
	}

	@Override
	public List<User_order> selectAllUser_order() {
		
		return orderdao.selectAllUser_order();
	}

	@Override
	public List<User_order> selectUser_orderByusername(String username) {
		
		return orderdao.selectUser_orderByusername(username);
	}
	
	

}
