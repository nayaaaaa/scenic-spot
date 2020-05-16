package cn.zjh.spot.entity;

import java.util.Date;

public class Comment {
	private Integer id;
	private	String uid;
	private	Integer sid;
	private	String content;
	private Integer upnum;
	private	String	name;
	private Date adate;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getUpnum() {
		return upnum;
	}
	public void setUpnum(Integer upnum) {
		this.upnum = upnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getAdate() {
		return adate;
	}
	public void setAdate(Date adate) {
		this.adate = adate;
	}
	
}
