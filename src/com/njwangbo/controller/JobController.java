package com.njwangbo.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.njwangbo.po.Employ;
import com.njwangbo.po.Job;
import com.njwangbo.service.EmployService;
import com.njwangbo.service.JobService;
import com.njwangbo.vo.JobVo;

@Controller
public class JobController
{
	@Autowired
	private JobService js;
	@Autowired
	private EmployService es;
	//显示所有的招聘信息
	@RequestMapping("/alljob")
	public String showSomeJobBySome(String timemsg,JobVo jobvo,HttpServletRequest request)
	{
		/*获取当前时间，并转换成2017-01的格式*/
		Date date = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM");
		String curdate = df.format(date);
		System.out.println(curdate);
		/*获取当前月份*/
		String[] arr =  curdate.split("-");
		String curYear = arr[0];
		int curYearInt = Integer.parseInt(curYear);
		String  curMonth = arr[1];
		int curMonthInt = Integer.parseInt(curMonth);
		if(timemsg == null||timemsg == "")
		{
			List<Job> jlist = js.showSomeJobBySome(jobvo);
			HttpSession session = request.getSession();
			session.setAttribute("jobs", jlist);
			return "job/alljob";
		}
		else
		{
			if(timemsg.equals("本月"))
			{
				jobvo.setStarttime(curdate);
				List<Job> jlist = js.showSomeJobBySome(jobvo);
				HttpSession session = request.getSession();
				session.setAttribute("jobs", jlist);
				return "job/alljob";
			}
			else if(timemsg.equals("上个月"))
			{
				int m = curMonthInt-1;
				int y = curYearInt-1;
				String s;
				if(m>1&&m<=10)
				{
					 s = arr[0]+"-0"+String.valueOf(m);
					 System.out.println(s);
					 jobvo.setStarttime(s);
				}
				else if(m>10)
				{
					 s = arr[0]+"-"+String.valueOf(m);
					 System.out.println(s);
					 jobvo.setStarttime(s);
				}
				else
				{
					s = String.valueOf(y)+"-12";
					System.out.println(s);
					jobvo.setStarttime(s);
				}
				List<Job> jlist = js.showSomeJobBySome(jobvo);
				HttpSession session = request.getSession();
				session.setAttribute("jobs", jlist);
				return "job/alljob";
			}
			else if(timemsg.equals("近三个月"))
			{
				int y = curYearInt-1;
				if(curMonthInt == 1)
				{
					List<Job> jlist = new ArrayList<Job>();
					String s0 = String.valueOf(curYearInt)+"-01";
					jobvo.setStarttime(s0);
					List<Job> list0 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list0.size();i++)
					{
						jlist.add(list0.get(i));
					}
					String s1 = String.valueOf(y)+"-12";
					jobvo.setStarttime(s1);
					List<Job> list1 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list1.size();i++)
					{
						jlist.add(list1.get(i));
					}
					String s2 = String.valueOf(y)+"-11";
					jobvo.setStarttime(s2);
					List<Job> list2 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list2.size();i++)
					{
						jlist.add(list2.get(i));
					}
					HttpSession session = request.getSession();
					session.setAttribute("jobs", jlist);
					return "job/alljob";
				}
				else if(curMonthInt == 2)
				{
					List<Job> jlist = new ArrayList<Job>();
					String s0 = String.valueOf(curYearInt)+"-02";
					jobvo.setStarttime(s0);
					List<Job> list0 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list0.size();i++)
					{
						jlist.add(list0.get(i));
					}
					String s1 = String.valueOf(curYearInt)+"-01";
					jobvo.setStarttime(s1);
					List<Job> list1 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list1.size();i++)
					{
						jlist.add(list1.get(i));
					}
					String s2 = String.valueOf(y)+"-11";
					jobvo.setStarttime(s2);
					List<Job> list2 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list2.size();i++)
					{
						jlist.add(list2.get(i));
					}
					HttpSession session = request.getSession();
					session.setAttribute("jobs", jlist);
					return "job/alljob";
				}
				else if(curMonthInt == 3)
				{
					List<Job> jlist = new ArrayList<Job>();
					String s0 = String.valueOf(curYearInt)+"-03";
					jobvo.setStarttime(s0);
					List<Job> list0 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list0.size();i++)
					{
						jlist.add(list0.get(i));
					}
					String s1 = String.valueOf(curYearInt)+"-02";
					jobvo.setStarttime(s1);
					List<Job> list1 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list1.size();i++)
					{
						jlist.add(list1.get(i));
					}
					String s2 = String.valueOf(curYearInt)+"-01";
					jobvo.setStarttime(s2);
					List<Job> list2 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list2.size();i++)
					{
						jlist.add(list2.get(i));
					}
					HttpSession session = request.getSession();
					session.setAttribute("jobs", jlist);
					return "job/alljob";
				}
				else if(curMonthInt == 4)
				{
					List<Job> jlist = new ArrayList<Job>();
					String s0 = String.valueOf(curYearInt)+"-04";
					jobvo.setStarttime(s0);
					List<Job> list0 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list0.size();i++)
					{
						jlist.add(list0.get(i));
					}
					String s1 = String.valueOf(curYearInt)+"-03";
					jobvo.setStarttime(s1);
					List<Job> list1 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list1.size();i++)
					{
						jlist.add(list1.get(i));
					}
					String s2 = String.valueOf(curYearInt)+"-02";
					jobvo.setStarttime(s2);
					List<Job> list2 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list2.size();i++)
					{
						jlist.add(list2.get(i));
					}
					HttpSession session = request.getSession();
					session.setAttribute("jobs", jlist);
					return "job/alljob";
				}
				else if(curMonthInt == 5)
				{
					List<Job> jlist = new ArrayList<Job>();
					String s0 = String.valueOf(curYearInt)+"-05";
					jobvo.setStarttime(s0);
					List<Job> list0 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list0.size();i++)
					{
						jlist.add(list0.get(i));
					}
					String s1 = String.valueOf(curYearInt)+"-04";
					jobvo.setStarttime(s1);
					List<Job> list1 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list1.size();i++)
					{
						jlist.add(list1.get(i));
					}
					String s2 = String.valueOf(curYearInt)+"-03";
					jobvo.setStarttime(s2);
					List<Job> list2 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list2.size();i++)
					{
						jlist.add(list2.get(i));
					}
					HttpSession session = request.getSession();
					session.setAttribute("jobs", jlist);
					return "job/alljob";
				}
				else if(curMonthInt == 6)
				{
					List<Job> jlist = new ArrayList<Job>();
					String s0 = String.valueOf(curYearInt)+"-06";
					jobvo.setStarttime(s0);
					List<Job> list0 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list0.size();i++)
					{
						jlist.add(list0.get(i));
					}
					String s1 = String.valueOf(curYearInt)+"-05";
					jobvo.setStarttime(s1);
					List<Job> list1 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list1.size();i++)
					{
						jlist.add(list1.get(i));
					}
					String s2 = String.valueOf(curYearInt)+"-04";
					jobvo.setStarttime(s2);
					List<Job> list2 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list2.size();i++)
					{
						jlist.add(list2.get(i));
					}
					HttpSession session = request.getSession();
					session.setAttribute("jobs", jlist);
					return "job/alljob";
				}
				else if(curMonthInt == 7)
				{
					List<Job> jlist = new ArrayList<Job>();
					String s0 = String.valueOf(curYearInt)+"-07";
					jobvo.setStarttime(s0);
					List<Job> list0 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list0.size();i++)
					{
						jlist.add(list0.get(i));
					}
					String s1 = String.valueOf(curYearInt)+"-06";
					jobvo.setStarttime(s1);
					List<Job> list1 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list1.size();i++)
					{
						jlist.add(list1.get(i));
					}
					String s2 = String.valueOf(curYearInt)+"-05";
					jobvo.setStarttime(s2);
					List<Job> list2 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list2.size();i++)
					{
						jlist.add(list2.get(i));
					}
					HttpSession session = request.getSession();
					session.setAttribute("jobs", jlist);
					return "job/alljob";
				}
				else if(curMonthInt == 8)
				{
					List<Job> jlist = new ArrayList<Job>();
					String s0 = String.valueOf(curYearInt)+"-08";
					jobvo.setStarttime(s0);
					List<Job> list0 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list0.size();i++)
					{
						jlist.add(list0.get(i));
					}
					String s1 = String.valueOf(curYearInt)+"-07";
					jobvo.setStarttime(s1);
					List<Job> list1 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list1.size();i++)
					{
						jlist.add(list1.get(i));
					}
					String s2 = String.valueOf(curYearInt)+"-06";
					jobvo.setStarttime(s2);
					List<Job> list2 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list2.size();i++)
					{
						jlist.add(list2.get(i));
					}
					HttpSession session = request.getSession();
					session.setAttribute("jobs", jlist);
					return "job/alljob";
				}
				else if(curMonthInt == 9)
				{
					List<Job> jlist = new ArrayList<Job>();
					String s0 = String.valueOf(curYearInt)+"-09";
					jobvo.setStarttime(s0);
					List<Job> list0 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list0.size();i++)
					{
						jlist.add(list0.get(i));
					}
					String s1 = String.valueOf(curYearInt)+"-08";
					jobvo.setStarttime(s1);
					List<Job> list1 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list1.size();i++)
					{
						jlist.add(list1.get(i));
					}
					String s2 = String.valueOf(curYearInt)+"-07";
					jobvo.setStarttime(s2);
					List<Job> list2 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list2.size();i++)
					{
						jlist.add(list2.get(i));
					}
					HttpSession session = request.getSession();
					session.setAttribute("jobs", jlist);
					return "job/alljob";
				}
				else if(curMonthInt == 10)
				{
					List<Job> jlist = new ArrayList<Job>();
					String s0 = String.valueOf(curYearInt)+"-10";
					jobvo.setStarttime(s0);
					List<Job> list0 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list0.size();i++)
					{
						jlist.add(list0.get(i));
					}
					String s1 = String.valueOf(curYearInt)+"-9";
					jobvo.setStarttime(s1);
					List<Job> list1 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list1.size();i++)
					{
						jlist.add(list1.get(i));
					}
					String s2 = String.valueOf(curYearInt)+"-8";
					jobvo.setStarttime(s2);
					List<Job> list2 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list2.size();i++)
					{
						jlist.add(list2.get(i));
					}
					HttpSession session = request.getSession();
					session.setAttribute("jobs", jlist);
					return "job/alljob";
				}
				else if(curMonthInt == 11)
				{
					List<Job> jlist = new ArrayList<Job>();
					String s0 = String.valueOf(curYearInt)+"-11";
					jobvo.setStarttime(s0);
					List<Job> list0 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list0.size();i++)
					{
						jlist.add(list0.get(i));
					}
					String s1 = String.valueOf(curYearInt)+"-10";
					jobvo.setStarttime(s1);
					List<Job> list1 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list1.size();i++)
					{
						jlist.add(list1.get(i));
					}
					String s2 = String.valueOf(curYearInt)+"-9";
					jobvo.setStarttime(s2);
					List<Job> list2 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list2.size();i++)
					{
						jlist.add(list2.get(i));
					}
					HttpSession session = request.getSession();
					session.setAttribute("jobs", jlist);
					return "job/alljob";
				}
				else if(curMonthInt == 12)
				{
					List<Job> jlist = new ArrayList<Job>();
					String s0 = String.valueOf(curYearInt)+"-12";
					jobvo.setStarttime(s0);
					List<Job> list0 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list0.size();i++)
					{
						jlist.add(list0.get(i));
					}
					String s1 = String.valueOf(curYearInt)+"-11";
					jobvo.setStarttime(s1);
					List<Job> list1 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list1.size();i++)
					{
						jlist.add(list1.get(i));
					}
					String s2 = String.valueOf(curYearInt)+"-10";
					jobvo.setStarttime(s2);
					List<Job> list2 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list2.size();i++)
					{
						jlist.add(list2.get(i));
					}
					HttpSession session = request.getSession();
					session.setAttribute("jobs", jlist);
					return "job/alljob";
				}
				
			}
		}
		List<Job> jlist = js.showSomeJobBySome(jobvo);
		HttpSession session = request.getSession();
		session.setAttribute("jobs", jlist);
		return "job/alljob";
	}
	//删除招聘信息
	@RequestMapping("/deletejob")
	public String deleteJob(HttpServletRequest request,int jid)
	{
		js.deleteJobByJid(jid);
		List<Employ> elist = es.getSomeEmployByJid(jid);
		for(int i = 0;i<elist.size();i++)
		{
			es.deleteEmploy(elist.get(i).getEmployid());
		}
		
		return "redirect:alljob.action";
	}
	//去修改招聘信息界面
	@RequestMapping("/goupdatejob")
	public String goUpdateJob(HttpServletRequest request,int jid)
	{
		Job job= js.getOneJobByJid(jid);
		HttpSession session = request.getSession();
		session.setAttribute("job", job);
		return "job/updatejob";
	}
	//修改招聘信息
	@RequestMapping("/updatejob")
	public String updateJob(Job job,HttpServletRequest request)
	{
		js.updateJobByJid(job);
		return "redirect:alljob.action";
	}
	//去详情页面
	@RequestMapping("/godetailjob")
	public String goDetailJob(int jid,HttpServletRequest request)
	{
		Job job = js.getOneJobByJid(jid);
		HttpSession session = request.getSession();
		session.setAttribute("detailjob", job);
		return "job/detailjob";
	}
	
	
	
	
	//去公司的所有的招聘信息界面
	@RequestMapping("/gosomejobbycid")
	public String goAllJobBycid(int cid,HttpServletRequest request)
	{
		
		List<Job> jlist = js.showSomeJObByCid(cid);
		HttpSession session = request.getSession();
		session.setAttribute("somejobbycid",jlist );
		session.setAttribute("cid", cid);
		return "job/somejobbycid";
	}
	
	//去添加招聘信息页面
	@RequestMapping("/goaddjobbycompany")
	public String goAddJobByCompany()
	{
		return"job/addjob";
	}
	//公司添加招聘信息
	@RequestMapping("/addjobbycompany")
	public String addjobbycompany(Job job,HttpServletRequest request)
	{
		HttpSession session = request.getSession();
		js.addJob(job);
		session.setAttribute("cid", job.getCid());
		return "redirect:gosomejobbycid.action?cid="+job.getCid();
	}
	//公司修改招聘信息界面
	@RequestMapping("/goupdatejobbycompany")
	public String goupdatejobbycompany(HttpServletRequest request,int jid)
	{
		Job job= js.getOneJobByJid(jid);
		HttpSession session = request.getSession();
		session.setAttribute("job", job);
		session.setAttribute("cid", job.getCid());
		return "job/updatejobbycompany";
	}
	
	//公司修改招聘信息
	@RequestMapping("/updatejobbycompany")
	public String updatejobbycompany(Job job,HttpServletRequest request)
	{
		js.updateJobByJid(job);
		System.out.println(job.getCid()+"!!!!!!!");
		return "redirect:gosomejobbycid.action?cid="+job.getCid();
	}
	//删除招聘信息
	@RequestMapping("/deletejobbycompany")
	public String deletejobbycompany(int cid,HttpServletRequest request,int jid)
	{
		js.deleteJobByJid(jid);
		List<Employ> elist = es.getSomeEmployByJid(jid);
		for(int i = 0;i<elist.size();i++)
		{
			es.deleteEmploy(elist.get(i).getEmployid());
		}
		
		return "redirect:gosomejobbycid.action?cid="+cid;
	}
	
	
	
	
	
	
	
	
	
	
	
	//学生查看招聘信息
	@RequestMapping("/somejobbystudent")
	public String studentgetsomejob(String timemsg,JobVo jobvo,HttpServletRequest request)
	{
		jobvo.setJobstatus("已审核");
		/*获取当前时间，并转换成2017-01的格式*/
		Date date = new Date();
		DateFormat df = new SimpleDateFormat("yyyy-MM");
		String curdate = df.format(date);
		System.out.println(curdate);
		/*获取当前月份*/
		String[] arr =  curdate.split("-");
		String curYear = arr[0];
		int curYearInt = Integer.parseInt(curYear);
		String  curMonth = arr[1];
		int curMonthInt = Integer.parseInt(curMonth);
		if(timemsg == null||timemsg == "")
		{
			List<Job> jlist = js.showSomeJobBySome(jobvo);
			HttpSession session = request.getSession();
			session.setAttribute("jobs", jlist);
			return "job/somejobbystudent";
		}
		else
		{
			if(timemsg.equals("本月"))
			{
				jobvo.setStarttime(curdate);
				List<Job> jlist = js.showSomeJobBySome(jobvo);
				HttpSession session = request.getSession();
				session.setAttribute("jobs", jlist);
				return "job/somejobbystudent";
			}
			else if(timemsg.equals("上个月"))
			{
				int m = curMonthInt-1;
				int y = curYearInt-1;
				String s;
				if(m>1&&m<=10)
				{
					 s = arr[0]+"-0"+String.valueOf(m);
					 System.out.println(s);
					 jobvo.setStarttime(s);
				}
				else if(m>10)
				{
					 s = arr[0]+"-"+String.valueOf(m);
					 System.out.println(s);
					 jobvo.setStarttime(s);
				}
				else
				{
					s = String.valueOf(y)+"-12";
					System.out.println(s);
					jobvo.setStarttime(s);
				}
				List<Job> jlist = js.showSomeJobBySome(jobvo);
				HttpSession session = request.getSession();
				session.setAttribute("jobs", jlist);
				return "job/somejobbystudent";
			}
			else if(timemsg.equals("近三个月"))
			{
				int y = curYearInt-1;
				if(curMonthInt == 1)
				{
					List<Job> jlist = new ArrayList<Job>();
					String s0 = String.valueOf(curYearInt)+"-01";
					jobvo.setStarttime(s0);
					List<Job> list0 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list0.size();i++)
					{
						jlist.add(list0.get(i));
					}
					String s1 = String.valueOf(y)+"-12";
					jobvo.setStarttime(s1);
					List<Job> list1 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list1.size();i++)
					{
						jlist.add(list1.get(i));
					}
					String s2 = String.valueOf(y)+"-11";
					jobvo.setStarttime(s2);
					List<Job> list2 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list2.size();i++)
					{
						jlist.add(list2.get(i));
					}
					HttpSession session = request.getSession();
					session.setAttribute("jobs", jlist);
					return "job/somejobbystudent";
				}
				else if(curMonthInt == 2)
				{
					List<Job> jlist = new ArrayList<Job>();
					String s0 = String.valueOf(curYearInt)+"-02";
					jobvo.setStarttime(s0);
					List<Job> list0 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list0.size();i++)
					{
						jlist.add(list0.get(i));
					}
					String s1 = String.valueOf(curYearInt)+"-01";
					jobvo.setStarttime(s1);
					List<Job> list1 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list1.size();i++)
					{
						jlist.add(list1.get(i));
					}
					String s2 = String.valueOf(y)+"-11";
					jobvo.setStarttime(s2);
					List<Job> list2 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list2.size();i++)
					{
						jlist.add(list2.get(i));
					}
					HttpSession session = request.getSession();
					session.setAttribute("jobs", jlist);
					return "job/somejobbystudent";
				}
				else if(curMonthInt == 3)
				{
					List<Job> jlist = new ArrayList<Job>();
					String s0 = String.valueOf(curYearInt)+"-03";
					jobvo.setStarttime(s0);
					List<Job> list0 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list0.size();i++)
					{
						jlist.add(list0.get(i));
					}
					String s1 = String.valueOf(curYearInt)+"-02";
					jobvo.setStarttime(s1);
					List<Job> list1 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list1.size();i++)
					{
						jlist.add(list1.get(i));
					}
					String s2 = String.valueOf(curYearInt)+"-01";
					jobvo.setStarttime(s2);
					List<Job> list2 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list2.size();i++)
					{
						jlist.add(list2.get(i));
					}
					HttpSession session = request.getSession();
					session.setAttribute("jobs", jlist);
					return "job/somejobbystudent";
				}
				else if(curMonthInt == 4)
				{
					List<Job> jlist = new ArrayList<Job>();
					String s0 = String.valueOf(curYearInt)+"-04";
					jobvo.setStarttime(s0);
					List<Job> list0 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list0.size();i++)
					{
						jlist.add(list0.get(i));
					}
					String s1 = String.valueOf(curYearInt)+"-03";
					jobvo.setStarttime(s1);
					List<Job> list1 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list1.size();i++)
					{
						jlist.add(list1.get(i));
					}
					String s2 = String.valueOf(curYearInt)+"-02";
					jobvo.setStarttime(s2);
					List<Job> list2 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list2.size();i++)
					{
						jlist.add(list2.get(i));
					}
					HttpSession session = request.getSession();
					session.setAttribute("jobs", jlist);
					return "job/somejobbystudent";
				}
				else if(curMonthInt == 5)
				{
					List<Job> jlist = new ArrayList<Job>();
					String s0 = String.valueOf(curYearInt)+"-05";
					jobvo.setStarttime(s0);
					List<Job> list0 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list0.size();i++)
					{
						jlist.add(list0.get(i));
					}
					String s1 = String.valueOf(curYearInt)+"-04";
					jobvo.setStarttime(s1);
					List<Job> list1 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list1.size();i++)
					{
						jlist.add(list1.get(i));
					}
					String s2 = String.valueOf(curYearInt)+"-03";
					jobvo.setStarttime(s2);
					List<Job> list2 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list2.size();i++)
					{
						jlist.add(list2.get(i));
					}
					HttpSession session = request.getSession();
					session.setAttribute("jobs", jlist);
					return "job/somejobbystudent";
				}
				else if(curMonthInt == 6)
				{
					List<Job> jlist = new ArrayList<Job>();
					String s0 = String.valueOf(curYearInt)+"-06";
					jobvo.setStarttime(s0);
					List<Job> list0 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list0.size();i++)
					{
						jlist.add(list0.get(i));
					}
					String s1 = String.valueOf(curYearInt)+"-05";
					jobvo.setStarttime(s1);
					List<Job> list1 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list1.size();i++)
					{
						jlist.add(list1.get(i));
					}
					String s2 = String.valueOf(curYearInt)+"-04";
					jobvo.setStarttime(s2);
					List<Job> list2 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list2.size();i++)
					{
						jlist.add(list2.get(i));
					}
					HttpSession session = request.getSession();
					session.setAttribute("jobs", jlist);
					return "job/somejobbystudent";
				}
				else if(curMonthInt == 7)
				{
					List<Job> jlist = new ArrayList<Job>();
					String s0 = String.valueOf(curYearInt)+"-07";
					jobvo.setStarttime(s0);
					List<Job> list0 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list0.size();i++)
					{
						jlist.add(list0.get(i));
					}
					String s1 = String.valueOf(curYearInt)+"-06";
					jobvo.setStarttime(s1);
					List<Job> list1 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list1.size();i++)
					{
						jlist.add(list1.get(i));
					}
					String s2 = String.valueOf(curYearInt)+"-05";
					jobvo.setStarttime(s2);
					List<Job> list2 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list2.size();i++)
					{
						jlist.add(list2.get(i));
					}
					HttpSession session = request.getSession();
					session.setAttribute("jobs", jlist);
					return "job/somejobbystudent";
				}
				else if(curMonthInt == 8)
				{
					List<Job> jlist = new ArrayList<Job>();
					String s0 = String.valueOf(curYearInt)+"-08";
					jobvo.setStarttime(s0);
					List<Job> list0 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list0.size();i++)
					{
						jlist.add(list0.get(i));
					}
					String s1 = String.valueOf(curYearInt)+"-07";
					jobvo.setStarttime(s1);
					List<Job> list1 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list1.size();i++)
					{
						jlist.add(list1.get(i));
					}
					String s2 = String.valueOf(curYearInt)+"-06";
					jobvo.setStarttime(s2);
					List<Job> list2 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list2.size();i++)
					{
						jlist.add(list2.get(i));
					}
					HttpSession session = request.getSession();
					session.setAttribute("jobs", jlist);
					return "job/somejobbystudent";
				}
				else if(curMonthInt == 9)
				{
					List<Job> jlist = new ArrayList<Job>();
					String s0 = String.valueOf(curYearInt)+"-09";
					jobvo.setStarttime(s0);
					List<Job> list0 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list0.size();i++)
					{
						jlist.add(list0.get(i));
					}
					String s1 = String.valueOf(curYearInt)+"-08";
					jobvo.setStarttime(s1);
					List<Job> list1 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list1.size();i++)
					{
						jlist.add(list1.get(i));
					}
					String s2 = String.valueOf(curYearInt)+"-07";
					jobvo.setStarttime(s2);
					List<Job> list2 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list2.size();i++)
					{
						jlist.add(list2.get(i));
					}
					HttpSession session = request.getSession();
					session.setAttribute("jobs", jlist);
					return "job/somejobbystudent";
				}
				else if(curMonthInt == 10)
				{
					List<Job> jlist = new ArrayList<Job>();
					String s0 = String.valueOf(curYearInt)+"-10";
					jobvo.setStarttime(s0);
					List<Job> list0 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list0.size();i++)
					{
						jlist.add(list0.get(i));
					}
					String s1 = String.valueOf(curYearInt)+"-9";
					jobvo.setStarttime(s1);
					List<Job> list1 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list1.size();i++)
					{
						jlist.add(list1.get(i));
					}
					String s2 = String.valueOf(curYearInt)+"-8";
					jobvo.setStarttime(s2);
					List<Job> list2 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list2.size();i++)
					{
						jlist.add(list2.get(i));
					}
					HttpSession session = request.getSession();
					session.setAttribute("jobs", jlist);
					return "job/somejobbystudent";
				}
				else if(curMonthInt == 11)
				{
					List<Job> jlist = new ArrayList<Job>();
					String s0 = String.valueOf(curYearInt)+"-11";
					jobvo.setStarttime(s0);
					List<Job> list0 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list0.size();i++)
					{
						jlist.add(list0.get(i));
					}
					String s1 = String.valueOf(curYearInt)+"-10";
					jobvo.setStarttime(s1);
					List<Job> list1 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list1.size();i++)
					{
						jlist.add(list1.get(i));
					}
					String s2 = String.valueOf(curYearInt)+"-9";
					jobvo.setStarttime(s2);
					List<Job> list2 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list2.size();i++)
					{
						jlist.add(list2.get(i));
					}
					HttpSession session = request.getSession();
					session.setAttribute("jobs", jlist);
					return "job/somejobbystudent";
				}
				else if(curMonthInt == 12)
				{
					List<Job> jlist = new ArrayList<Job>();
					String s0 = String.valueOf(curYearInt)+"-12";
					jobvo.setStarttime(s0);
					List<Job> list0 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list0.size();i++)
					{
						jlist.add(list0.get(i));
					}
					String s1 = String.valueOf(curYearInt)+"-11";
					jobvo.setStarttime(s1);
					List<Job> list1 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list1.size();i++)
					{
						jlist.add(list1.get(i));
					}
					String s2 = String.valueOf(curYearInt)+"-10";
					jobvo.setStarttime(s2);
					List<Job> list2 = js.showSomeJobBySome(jobvo);
					for(int i = 0;i<list2.size();i++)
					{
						jlist.add(list2.get(i));
					}
					HttpSession session = request.getSession();
					session.setAttribute("jobs", jlist);
					return "job/somejobbystudent";
				}
				
			}
		}
		return "job/somejobbystudent";
	}
	//学生去详情页面
	@RequestMapping("/godetailjobbystudent")
	public String studentgoDetailJob(int jid,HttpServletRequest request)
	{
		Job job = js.getOneJobByJid(jid);
		HttpSession session = request.getSession();
		session.setAttribute("detailjob", job);
		return "job/detailjobbystudent";
	}
	
	
	
	
	
	
	
	
	
}
