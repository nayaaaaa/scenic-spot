package cn.zjh.spot.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


import cn.zjh.spot.dao.CommentDao;
import cn.zjh.spot.entity.Comment;



@Service
public class CommentSvc {
	@Resource
	public CommentDao<Comment> dao;
	public void addComment(Comment comment) throws Exception{
		dao.addcomment(comment);
	}
	public void deleteComment(int id) throws Exception{
		Comment u = (Comment)dao.getcomment(id);
		dao.delete(u);
	}
}
