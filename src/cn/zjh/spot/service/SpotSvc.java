package cn.zjh.spot.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.zjh.spot.dao.SpotDao;
import cn.zjh.spot.entity.Spot;



@Service
public class SpotSvc {
	@Resource
	public SpotDao<Spot> dao;
	public void addspot(Spot spot) throws Exception{
		dao.addspot(spot);
	}
	public void deletespot(int id) throws Exception{
		Spot u = (Spot)dao.getspot(id);
		dao.delete(u);
	}
	public void updatespot(Spot spot) throws Exception{
		dao.update(spot);
	}
	public List<Spot> listDgSpot(String title,int page,int rows){
		if(page<1){
			page=1;
		}
		if(rows<1){
			rows=10;
		}
		page=(page-1)*rows;
		if(title == null||"".equals(title))
			return dao.listpage(page, rows);
		else return dao.listtitle(title, page, rows);
	}
	public List<Spot> getallspot(){
		return dao.allspot();
	}
	public Spot getspot(int id){
		Spot spot=dao.getspot(id);
		spot.setHitnum(spot.getHitnum()+1);//点击量增加
		dao.uphitnum(spot);
		return spot;
	}
	public int getspotCount(){
		try{
			Long a=dao.countofSpot();
			return Integer.parseInt(a.toString());
		}catch(Exception e){
			e.printStackTrace();
			return 0;
		}
	}
	public List<Spot> listCSpot(String city,int page,int rows){
		if(page<1){
			page=1;
		}
		if(rows<1){
			rows=10;
		}
		page=(page-1)*rows;
		return dao.listcity(city, page, rows);
	}
	public List<Spot> listDSpot(String district,int page,int rows){
		if(page<1){
			page=1;
		}
		if(rows<1){
			rows=10;
		}
		page=(page-1)*rows;
		return dao.listdistrict(district, page, rows);
	}
}
