package com.njwangbo.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njwangbo.mapper.UserMapper;
import com.njwangbo.po.User;
import com.njwangbo.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	public User getOneUserByUserName(String username) {
		return userMapper.getOneUserByUserName(username);
	}
	
	

}
