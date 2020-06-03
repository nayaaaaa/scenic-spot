package cn.zjh.spot.entity;

import java.util.Date;

public class Spot {
    private Integer id;
	private String title;
	private String content;
	private Date tjdate;
    private String cruser;
    private Float positionx;
    private Float positiony;
	private Date update;
	private Integer hitnum;
	private String city;
	private String district;

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getTjdate() {
		return tjdate;
	}
	public void setTjdate(Date tjdate) {
		this.tjdate = tjdate;
	}
	public String getCruser() {
		return cruser;
	}
	public void setCruser(String cruser) {
		this.cruser = cruser;
	}
	public Float getPositionx() {
		return positionx;
	}
	public void setPositionx(Float positionx) {
		this.positionx = positionx;
	}
	public Float getPositiony() {
		return positiony;
	}
	public void setPositiony(Float positiony) {
		this.positiony = positiony;
	}
	public Date getUpdate() {
		return update;
	}
	public void setUpdate(Date update) {
		this.update = update;
	}
	public Integer getHitnum() {
		return hitnum;
	}
	public void setHitnum(Integer hitnum) {
		this.hitnum = hitnum;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getDistrict() {
		return district;
	}
	public void setDistrict(String district) {
		this.district = district;
	}
}
