package com.service;

import java.util.List;

import com.entity.User_order;

public interface User_orderService {
	public int insertUser_order(User_order order);
	public int deleteUser_order(User_order order);
	public int updateUser_order(User_order order);
	public User_order selectUser_order(User_order order);
	public List<User_order> selectUser_orderByusername(String username);
	public List<User_order> selectAllUser_order();	
}
