package com.njwangbo.po;

import java.util.List;

//企业信息实体类
public class Company 
{
	private int cid;//企业编号
	private String cloginname;//企业登录帐号
	private String cloginpwd;//企业登录密码
	private String cname;//企业名称
	private String ccontact;//企业联系方式
	private String location;//企业地址
	private String site;//企业网址
	private String description;//企业介绍
	private String industry;//所属行业
	private List<Company> companys;
	private List<Employ> employs;
	private List<Job> jobs;
	private List<Student> students;
	
	
	public List<Employ> getEmploys() {
		return employs;
	}
	public void setEmploys(List<Employ> employs) {
		this.employs = employs;
	}
	public List<Job> getJobs() {
		return jobs;
	}
	public void setJobs(List<Job> jobs) {
		this.jobs = jobs;
	}
	public List<Student> getStudents() {
		return students;
	}
	public void setStudents(List<Student> students) {
		this.students = students;
	}
	public List<Company> getCompanys() {
		return companys;
	}
	public void setCompanys(List<Company> companys) {
		this.companys = companys;
	}
	public String getIndustry() {
		return industry;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getCloginname() {
		return cloginname;
	}
	public void setCloginname(String cloginname) {
		this.cloginname = cloginname;
	}
	public String getCloginpwd() {
		return cloginpwd;
	}
	public void setCloginpwd(String cloginpwd) {
		this.cloginpwd = cloginpwd;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getCcontact() {
		return ccontact;
	}
	public void setCcontact(String ccontact) {
		this.ccontact = ccontact;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}
