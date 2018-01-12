package com.njwangbo.po;

import java.util.List;

public class Employ 
{
	private int employid;
	private String employstatus;
	private String employtime;
	private String stunum;
	private int jid;
	private int cid;
	private Job job;
	private Company company;
	private Student student;
	private List<Company> companys;
	private List<Employ> employs;
	private List<Job> jobs;
	private List<Student> students;
	
	
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
	}
	public List<Company> getCompanys() {
		return companys;
	}
	public void setCompanys(List<Company> companys) {
		this.companys = companys;
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
	public List<Employ> getEmploys() {
		return employs;
	}
	public void setEmploys(List<Employ> employs) {
		this.employs = employs;
	}
	public int getEmployid() {
		return employid;
	}
	public void setEmployid(int employid) {
		this.employid = employid;
	}
	public String getEmploystatus() {
		return employstatus;
	}
	public void setEmploystatus(String employstatus) {
		this.employstatus = employstatus;
	}
	public String getEmploytime() {
		return employtime;
	}
	public void setEmploytime(String employtime) {
		this.employtime = employtime;
	}
	public String getStunum() {
		return stunum;
	}
	public void setStunum(String stunum) {
		this.stunum = stunum;
	}
	public int getJid() {
		return jid;
	}
	public void setJid(int jid) {
		this.jid = jid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	
	public Job getJob() {
		return job;
	}
	public void setJob(Job job) {
		this.job = job;
	}
	public Company getCompany() {
		return company;
	}
	public void setCompany(Company company) {
		this.company = company;
	}
	

}
