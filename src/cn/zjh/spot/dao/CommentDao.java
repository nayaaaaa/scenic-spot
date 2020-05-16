package cn.zjh.spot.dao;

import org.apache.ibatis.annotations.Param;

public interface CommentDao<T> {
	public int addcomment(T o);
	public void delete(T o);
	public T getcomment(@Param("id")int id);
	public T getspot(@Param("sid")int sid);
	public T getuser(@Param("uid")int uid);
}
