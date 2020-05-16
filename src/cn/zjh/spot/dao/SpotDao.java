package cn.zjh.spot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface SpotDao<T> {
	public int addspot(T o);
	public void delete(T o);
	public void update(T o);
	public T getspot(@Param("id")int id);
	
	public List<T>listpage(@Param("offset")int page,@Param("rows")int rows);
	
	public List<T>list4(@Param("s1")String s1,@Param("offset")int offset,@Param("rows")int rows);
	public Long countofNews();
}
