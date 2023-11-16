package com.human.sample.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.human.sample.db.UserDaoOracle;
import com.human.sample.entity.User;


@Service
public class UserServiceOracleImpl implements UserService {
	@Autowired private UserDaoOracle userDao; 	
	// 오라클 버전으로 이용하고 있기 때문에 오라클로 표기한 것. 다른 DB 를 이용하면 그걸로 이름 바꿔도 됨.
	
	
	@Override
	public int getUserCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public User getUser(String uid) {
		User user = userDao.getUser(uid);
		return user;
	}

	@Override
	public List<User> getUserList(int page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertUser(User user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUser(String uid) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int login(String uid, String pwd) {
		// TODO Auto-generated method stub
		return 0;
	}

}
