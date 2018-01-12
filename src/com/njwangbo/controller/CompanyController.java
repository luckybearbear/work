package com.njwangbo.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baison.constraint.Constraint;
import com.njwangbo.po.Company;
import com.njwangbo.po.Job;

import com.njwangbo.service.CompanyService;
import com.njwangbo.service.EmployService;
import com.njwangbo.service.JobService;
import com.njwangbo.vo.CompanyVo;
import com.njwangbo.vo.EmployVo;

@Controller
public class CompanyController 
{
	@Autowired
	private CompanyService cs;
	@Autowired
	private EmployService es;
	@Autowired
	private JobService js;
	
	
	
	
	
	//企业管理界面
	@RequestMapping("/gocompanycontroller")
	public String gocompanycontroller()
	{
		return "redirect:company/companycontroller";
	}
	//登录企业
	@RequestMapping("/gocompanylogin")
	public String companylogin(String cloginname,String cloginpwd,HttpServletRequest request)
	{
		return "company/companylogin";
	}
	//去企业管理界面
	@RequestMapping("/checkclogin")
	public String goCompanyController(String cloginname,String cloginpwd,HttpServletRequest request)
	{
		String error = "";
		Company company = cs.getOneCompanyByCloginname(cloginname);
		if(company != null)
		{
			if(company.getCloginpwd().equals(cloginpwd))
			{
				HttpSession session = request.getSession();
				session.setAttribute("companymsg", company);
				return "company/companycontroller";
			}
			else
			{
				error = "密码错误";
				HttpSession session = request.getSession();
				session.setAttribute("error", error);
				return "company/companylogin";
			}
		}
		else
		{
			error = "用户不存在";
			HttpSession session = request.getSession();
			session.setAttribute("error", error);
			return "company/companylogin";
			
		}
	}
	//去企业注册页面
	@RequestMapping("/register")
	public String gocompanyregister(HttpServletRequest request)
	{
		return "company/companyregister";
	}
	//企业注册
	@RequestMapping("/companyregister")
	public String companyRegister(HttpServletRequest request,Company company)
	{
		cs.addCompanyByCompany(company);
		return "company/companylogin";
	}
	
	//验证注册公司的登录名是否存在
	@RequestMapping("/checkcloginname")
	public void checkcloginname(String cloginname,HttpServletResponse response) throws Exception 
	{
		List<CompanyVo> list = cs.showAllCompany();
		StringBuffer str = new StringBuffer();
		for(int i = 0;i<list.size();i++)
		{
			str.append(list.get(i).getCloginname()+",");
		}
		String s = str.toString();
		response.setCharacterEncoding("UTF-8");
		PrintWriter out;
		out = response.getWriter();
		out.print(s);
        out.flush();
        out.close();
		
	}
	//公司查看公司信息
	@RequestMapping("/gocompanymsg")
	public String goCompanymsg(HttpServletRequest request)
	{
		return "company/companymsg";
	}
	//公司去修改公司界面
	@RequestMapping("/goupdatecompanymsgbycompany")
	public String goupdatecompanymsg()
	{
		return "company/updatecompanymsg";
	}
	//公司修改公司
	@RequestMapping("/updatecompanybycompany")
	public String updatecompanybycompany(Company company, HttpServletRequest request)
	{
		cs.updateCompany(company);
		Company cm = cs.getOneCompanyByCid(company.getCid());
		HttpSession session = request.getSession();
		session.setAttribute("companymsg", cm);
		return "company/updatecompanymsg";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//查看所有的公司
	@RequestMapping("/allcompany")
	public String showAllCompany(HttpSession session,CompanyVo companyvo,HttpServletRequest request)
	{
		session.removeAttribute("cid");
		session.removeAttribute("cname");
		session.removeAttribute("industry");
		List<CompanyVo> list = cs.showAllCompany();
		int maxpagenum = 0;
        if(list.size()%Constraint.PAGE_SIZE==0){
            maxpagenum =list.size()/Constraint.PAGE_SIZE;
        }
        else{
            maxpagenum =list.size()/Constraint.PAGE_SIZE+1;
        }
        int page=companyvo.getPagenum();
         if(page>=maxpagenum){
            page=maxpagenum;
          }
          if(page<=1){
            page=1;
          }
        List<CompanyVo> clist = new ArrayList<CompanyVo>();
        for(int i=(page-1)*Constraint.PAGE_SIZE;i<page*Constraint.PAGE_SIZE;i++){
            if(list.size()>i){
            	clist.add(list.get(i));
            }
        }
        session = request.getSession();
		session.setAttribute("curPage", page);
		session.setAttribute("maxPage", maxpagenum);
		session.setAttribute("showAllCompany", clist);
		return "company/allcompany";
		
	}
	@RequestMapping("/getsomecompanybysome")
	public String getsomecompanybysome1(HttpSession session,CompanyVo companyvo,HttpServletRequest request)
	{ 
		System.out.println(companyvo.getCname());
		if(companyvo.getCname() != null)
		{
			session.setAttribute("cname", companyvo.getCname());
		}
		if(session.getAttribute("cname") != null)
		{
			companyvo.setCname(session.getAttribute("cname").toString());
		}
		if(companyvo.getIndustry() !=null)
		{
			session.setAttribute("industry", companyvo.getIndustry());
		}
		if(session.getAttribute("industry") != null)
		{
			companyvo.setIndustry(session.getAttribute("industry").toString());
		}
		List<CompanyVo> list = cs.getSomeCompanyBySome(companyvo);
		int maxpagenum = 0;
        if(list.size()%Constraint.PAGE_SIZE==0){
            maxpagenum =list.size()/Constraint.PAGE_SIZE;
        }
        else{
            maxpagenum =list.size()/Constraint.PAGE_SIZE+1;
        }
        int page=companyvo.getPagenum();
         if(page>=maxpagenum){
            page=maxpagenum;
          }
          if(page<=1){
            page=1;
          }
        List<CompanyVo> clist = new ArrayList<CompanyVo>();
        for(int i=(page-1)*Constraint.PAGE_SIZE;i<page*Constraint.PAGE_SIZE;i++){
            if(list.size()>i){
            	clist.add(list.get(i));
            }
        }
        session = request.getSession();
		session.setAttribute("curPage", page);
		session.setAttribute("maxPage", maxpagenum);
		session.setAttribute("showAllCompany", clist);
		return "company/allcompany";
		
	}
	//删除公司
	@RequestMapping("/deletecompany")
	public String deleteCompany(EmployVo employvo,int cid,HttpServletRequest request)
	{
		cs.deleteCompany(cid);
		List<Job> joblist = js.showSomeJObByCid(cid);
		for(int i = 0;i<joblist.size();i++)
		{
			js.deleteJobByJid(joblist.get(i).getJid());
		}
		List<EmployVo> elist = es.getSomeEmployBySome(employvo);
		for(int i = 0;i<elist.size();i++)
		{
			es.deleteEmploy(elist.get(i).getEmployid());
		}
		return "redirect:allcompany.action";
	}
	
	//去修改公司页面
	@RequestMapping("/goupdatecompany")
	public String goUpdateCompany(int cid,HttpServletRequest request)
	{
		Company company = cs.getOneCompanyByCid(cid);
		HttpSession session = request.getSession();
		session.setAttribute("getOneCompanyByCid", company);
		return "company/updatecompany";
	}
	//后台修改公司界面
	@RequestMapping("/updatecompany")
	public String updateCompany(Company company, HttpServletRequest request)
	{
		cs.updateCompany(company);
		return "redirect:allcompany.action";
	}
	//去公司详情页面
	@RequestMapping("/godetailcompany")
	public String godetailconpany(int cid,HttpServletRequest request)
	{
		Company company = cs.getOneCompanyByCid(cid);
		HttpSession session = request.getSession();
		session.setAttribute("getOneCompanyByCid", company);
		return "company/detailcompany";
	}
	
	//去公司详情页面
	@RequestMapping("/godetailcompanybystudent")
	public String godetailconpanybystudent(int cid,HttpServletRequest request)
	{
		Company company = cs.getOneCompanyByCid(cid);
		HttpSession session = request.getSession();
		session.setAttribute("getOneCompanyByCid", company);
		return "company/detailcompanybystudent";
	}
}
