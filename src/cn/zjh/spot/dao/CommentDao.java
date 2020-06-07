package cn.zjh.spot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface CommentDao<T> {
	public int addcomment(T o);
	public void delete(T o);
	public List<T> getall();
	public List<T> getuser(@Param("uid")String uid);
	public T getid(@Param("id")int id);
}
