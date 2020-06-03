package cn.zjh.spot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface UserDao<T> {
	public int adduser(T o);
	public void updateuser(T o);
	public T getuser(@Param("s1")String s1,@Param("s2")String s2);
	public T getid(@Param("i1")String i1);
	public Long countofUser();
	public List<T> menulist(@Param("id")int pid);
}
