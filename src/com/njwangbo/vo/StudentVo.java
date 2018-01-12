package com.njwangbo.vo;

import java.util.List;

import com.njwangbo.po.Company;
import com.njwangbo.po.Employ;
import com.njwangbo.po.Job;
import com.njwangbo.po.Student;



public class StudentVo
{
	private String stunum;//学生学号
	private String stuname;//学生姓名
	private String stuloginpwd;//学生登录密码
	private String emplstatus;//就业状态
	private String email;//邮箱
	private int pagenum;
	private List<Company> companys;
	private List<Employ> employs;
	private List<Job> jobs;
	private List<Student> students;
	
	public List<Company> getCompanys() {
		return companys;
	}
	public void setCompanys(List<Company> companys) {
		this.companys = companys;
	}
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public int getPagenum() {
		return pagenum;
	}
	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
	}
	public String getStuloginpwd() {
		return stuloginpwd;
	}
	public void setStuloginpwd(String stuloginpwd) {
		this.stuloginpwd = stuloginpwd;
	}
	public String getStunum() {
		return stunum;
	}
	public void setStunum(String stunum) {
		this.stunum = stunum;
	}
	public String getStuname() {
		return stuname;
	}
	public void setStuname(String stuname) {
		this.stuname = stuname;
	}
	public String getEmplstatus() {
		return emplstatus;
	}
	public void setEmplstatus(String emplstatus) {
		this.emplstatus = emplstatus;
	}
	
}
