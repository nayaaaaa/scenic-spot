package cn.zjh.spot.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.zjh.spot.dao.UserDao;
import cn.zjh.spot.entity.User;



@Service
public class UserSvc {
	@Resource
	private UserDao<User> dao;
	public void addU(User user){
		dao.adduser(user);
	}
	public User findU(String uid,String pwd){
		return dao.getuser(uid, pwd);
	}
	public User sameID(String uid){
		return dao.getid(uid);
	}
	public Long getCount(){
		return dao.countofUser();
	}
	public void updateU(User user){
		dao.updateuser(user);
	}
}
