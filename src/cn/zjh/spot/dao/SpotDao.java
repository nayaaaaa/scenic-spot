package cn.zjh.spot.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface SpotDao<T> {
	public int addspot(T o);
	public void delete(T o);
	public void update(T o);
	public void uphitnum(T o);
	public T getspot(@Param("id")int id);
	public List<T> listpage(@Param("offset")int page,@Param("rows")int rows);
	public List<T> listtitle(@Param("s1")String s1,@Param("offset")int offset,@Param("rows")int rows);
	public List<T> allspot();
	public List<T> listcity(@Param("c1")String c1,@Param("offset")int offset,@Param("rows")int rows);
	public List<T> listdistrict(@Param("d1")String d1,@Param("offset")int offset,@Param("rows")int rows);
	public Long countofSpot();

}
