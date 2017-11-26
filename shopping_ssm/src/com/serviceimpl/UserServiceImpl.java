package com.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.Userdao;
import com.entity.User;
import com.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private Userdao userdao;	
	
	@Override
	public int insertUser(User us) {
		return userdao.insertUser(us);
	}

	@Override
	public int deleteUser(User us) {
		
		return userdao.deleteUser(us);
	}

	@Override
	public int updateUser(User us) {
		
		return userdao.updateUser(us);
	}

	@Override
	public User selectUser(User us) {
	
		return userdao.selectUser(us);
	}

	@Override
	public List<User> selectAllUser() {
		
		return userdao.selectAllUser();
	}

	@Override
	public User selectUserByusername(User us) {
		
		return  userdao.selectUserByusername(us);
	}
	
	
}
