package com.njwangbo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baison.constraint.Constraint;
import com.njwangbo.po.User;
import com.njwangbo.service.JobService;
import com.njwangbo.service.UserService;
import com.njwangbo.vo.JobVo;

@Controller
public class UserController {
	@Autowired
	private JobService js;
	@Autowired
	private UserService userService;
	
	
	//登录首页
	@RequestMapping("/home")
	public String gohome(HttpServletRequest request,String timemsg,JobVo jobvo)
	{
		jobvo.setJobstatus("已审核");
		HttpSession session = request.getSession();
		List<JobVo> list = js.showSomeJobByJobStatus(jobvo);
		int maxpagenum = 0;
        if(list.size()%Constraint.PAGE_SIZE==0){
            maxpagenum =list.size()/Constraint.PAGE_SIZE;
        }
        else{
            maxpagenum =list.size()/Constraint.PAGE_SIZE+1;
        }
        int page=jobvo.getPagenum();
         if(page>=maxpagenum){
            page=maxpagenum;
          }
          if(page<=1){
            page=1;
          }
        List<JobVo> joblist = new ArrayList<JobVo>();
        for(int i=(page-1)*Constraint.PAGE_SIZE;i<page*Constraint.PAGE_SIZE;i++){
            if(list.size()>i){
            	joblist.add(list.get(i));
            }
        }

		session.setAttribute("curPage", page);
		session.setAttribute("maxPage", maxpagenum);
		session.setAttribute("jobs", joblist);
		return "home";
	}
	
	//管理员登录界面
	@RequestMapping("/login")
	public String login()
	{
		
		return "adminlogin";
	}
	//去后台
	@RequestMapping("/goback")
	public String goback(User user,HttpServletRequest request)
	{
		User u = userService.getOneUserByUserName(user.getUsername());
		if(null != u)
		{
			if(u.getPassword().equals(user.getPassword()))
			{
				String error = "";
				HttpSession session = request.getSession();
				session.setAttribute("error",error);
				return "back";
			}
			else
			{
				String error = "密码错误";
				HttpSession session = request.getSession();
				session.setAttribute("error", error);
				return "adminlogin";
			}
		}
		else
		{
			String error = "账号不存在";
			HttpSession session = request.getSession();
			session.setAttribute("error", error);
			return "adminlogin";
		}
	}
}
