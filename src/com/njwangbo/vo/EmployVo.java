package com.njwangbo.vo;

import java.util.List;

import com.njwangbo.po.Company;
import com.njwangbo.po.Employ;
import com.njwangbo.po.Job;
import com.njwangbo.po.Student;

public class EmployVo
{
	private int employid;
	private String employstatus;
	private String employtime;
	private String stunum;
	private String stuname;
	private int jid;
	private String jobname;//职业名称
	private String salary;//工资
	private String jobdescription;//职业介绍
	private String jobstatus;//招聘信息状态
	private String starttime;//发布时间
	private String deadline;//截止时间
	private int cid;
	private String cname;//企业名称
	private String ccontact;//企业联系方式
	private String location;//企业地址
	private String site;//企业网址
	private String description;//企业介绍
	private String industry;//所属行业
	private Job job;
	private Company company;
	private Student student;
	private Employ employ;
	
	private int pagenum;
	
	private List<Company> companys;
	private List<Employ> employs;
	private List<Job> jobs;
	private List<Student> students;
	
	
	public int getPagenum() {
		return pagenum;
	}
	public void setPagenum(int pagenum) {
		this.pagenum = pagenum;
	}
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
	public Employ getEmploy() {
		return employ;
	}
	public void setEmploy(Employ employ) {
		this.employ = employ;
	}
	public Student getStudent() {
		return student;
	}
	public void setStudent(Student student) {
		this.student = student;
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
	public String getStuname() {
		return stuname;
	}
	public void setStuname(String stuname) {
		this.stuname = stuname;
	}
	public int getJid() {
		return jid;
	}
	public void setJid(int jid) {
		this.jid = jid;
	}
	public String getJobname() {
		return jobname;
	}
	public void setJobname(String jobname) {
		this.jobname = jobname;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public String getJobdescription() {
		return jobdescription;
	}
	public void setJobdescription(String jobdescription) {
		this.jobdescription = jobdescription;
	}
	public String getJobstatus() {
		return jobstatus;
	}
	public void setJobstatus(String jobstatus) {
		this.jobstatus = jobstatus;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
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
	public String getIndustry() {
		return industry;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
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
