package com.service;

import java.util.List;

import com.entity.User;

public interface UserService {
	/*
	 * 增改查都为动态的,其中增有几个必填的字段
	 * 
	 * */
	
	public int insertUser(User us);
	public int deleteUser(User us);             //删除根据id删除
	public int updateUser(User us);
	public User selectUser(User us);
	public List<User> selectAllUser();
	
	public User selectUserByusername(User us);
}
