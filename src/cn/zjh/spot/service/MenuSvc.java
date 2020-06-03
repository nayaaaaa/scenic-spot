package cn.zjh.spot.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.zjh.spot.dao.UserDao;
import cn.zjh.spot.entity.Cmenu;

@Service
public class MenuSvc {
	@Resource
	private UserDao<Cmenu> dao;
	public List<Cmenu> listMenu(int pid){
		return dao.menulist(pid);
	}
}
