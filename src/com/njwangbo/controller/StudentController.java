package com.njwangbo.controller;

import java.io.IOException;
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
import com.njwangbo.po.Employ;
import com.njwangbo.po.Job;
import com.njwangbo.po.Resuem;
import com.njwangbo.po.Student;
import com.njwangbo.service.EmployService;
import com.njwangbo.service.JobService;
import com.njwangbo.service.ResuemService;
import com.njwangbo.service.StudentService;
import com.njwangbo.vo.JobVo;
import com.njwangbo.vo.StudentVo;
@Controller
public class StudentController {
	@Autowired
	private StudentService studentservice;
	@Autowired
	private ResuemService rs;
	@Autowired
	private JobService js;
	@Autowired
	private EmployService es;
	
	//所有的学生信息
	@RequestMapping("/allstudent")
	public String showAllStudent(HttpSession session ,StudentVo studentvo)
	{
		session.removeAttribute("stuname");
		session.removeAttribute("stunum");
		session.removeAttribute("emplstatus");
		List<StudentVo> list = studentservice.showAllStudent();
		int maxpagenum = 0;
        if(list.size()%Constraint.PAGE_SIZE==0){
            maxpagenum =list.size()/Constraint.PAGE_SIZE;
        }
        else{
            maxpagenum =list.size()/Constraint.PAGE_SIZE+1;
        }
        int page=studentvo.getPagenum();
         if(page>=maxpagenum){
            page=maxpagenum;
          }
          if(page<=1){
            page=1;
          }
        List<StudentVo> slist = new ArrayList<StudentVo>();
        for(int i=(page-1)*Constraint.PAGE_SIZE;i<page*Constraint.PAGE_SIZE;i++){
            if(list.size()>i){
            	slist.add(list.get(i));
            }
        }
		session.setAttribute("curPage", page);
		session.setAttribute("maxPage", maxpagenum);
		session.setAttribute("showAllStudent", slist);
		return "student/allstudent";
	}
	//根据多条件查询学生信息
	@RequestMapping("/getsomestudentbysome")
	public String getSomeStudentBySome(HttpSession session ,StudentVo studentvo)
	{
		if(studentvo.getStunum() != null)
		{
			session.setAttribute("stunum",studentvo.getStunum());
		}
		if(session.getAttribute("stunum") != null)
		{
			studentvo.setStunum(session.getAttribute("stunum").toString());
		}
		
		if(studentvo.getStuname() != null)
		{
			session.setAttribute("stuname", studentvo.getStuname() );
		}
		if(session.getAttribute("stuname") != null)
		{
			studentvo.setStuname(session.getAttribute("stuname").toString());
		}
		
		if(studentvo.getEmplstatus() !=null)
		{
			session.setAttribute("emplstatus", studentvo.getEmplstatus());
		}
		if(session.getAttribute("emplstatus") != null)
		{
			studentvo.setEmplstatus(session.getAttribute("emplstatus").toString());
		}
		List<StudentVo> list = studentservice.getSomeStudentBySome(studentvo);
		int maxpagenum = 0;
        if(list.size()%Constraint.PAGE_SIZE==0){
            maxpagenum =list.size()/Constraint.PAGE_SIZE;
        }
        else{
            maxpagenum =list.size()/Constraint.PAGE_SIZE+1;
        }
        int page=studentvo.getPagenum();
         if(page>=maxpagenum){
            page=maxpagenum;
          }
          if(page<=1){
            page=1;
          }
        List<StudentVo> slist = new ArrayList<StudentVo>();
        for(int i=(page-1)*Constraint.PAGE_SIZE;i<page*Constraint.PAGE_SIZE;i++){
            if(list.size()>i){
            	slist.add(list.get(i));
            }
        }
    
		session.setAttribute("curPage", page);
		session.setAttribute("maxPage", maxpagenum);
		session.setAttribute("showAllStudent", slist);
		return "student/allstudent";
	}
	
	
	//去添加学生信息页面
	@RequestMapping("/goaddstudent")
	public String goAddStudent()
	{
		return "student/addstudent";
	}
	//添加学生信息
	@RequestMapping("/addstudent")
	public String AddStudent(Student student,HttpServletRequest request)
	{
		Resuem resuem =new Resuem();
		String stunum = student.getStunum();
		resuem.setRid(stunum);
		resuem.setStunum(stunum);
		rs.addResume(resuem);
		studentservice.addStudent(student);
		return "redirect:allstudent.action";
	}
	
	@RequestMapping("/getsomestudentbystunum")
	public void getSomeStudentBystunum(HttpServletResponse response) throws IOException
	{
		List<StudentVo> stulist = studentservice.showAllStudent();
		StringBuffer str = new StringBuffer();
		for(int i = 0;i<stulist.size();i++)
		{
			str.append(stulist.get(i).getStunum()+",");

		}
			String s = str.toString();
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			System.out.println(s);
			out.print(s);
	        out.flush();
	        out.close();
	}
	
	//删除学生信息
	@RequestMapping("/deletestudent")
	public String DeleteStudent(String stunum,HttpServletRequest request)
	{
		studentservice.deleteStudent(stunum);
		rs.deleteResuem(stunum);
		List<Employ> list = es.getSomeEmployByStunum(stunum);
		for(int i = 0;i<list.size();i++)
		{
			es.deleteEmploy(list.get(i).getEmployid());
		}
		
		return "redirect:allstudent.action";
	}
	//去修改学生页面
	@RequestMapping("/goupdatestudent")
	public String goUpdateStudent(String stunum,HttpServletRequest request)
	{
		Student student = studentservice.getOneStudentByStunum(stunum);
		HttpSession session = request.getSession();
		session.setAttribute("getOneStudentByStunum", student);
		return "student/updatestudent";
	}
	//修改学生界面
	@RequestMapping("/updatestudent")
	public String UpdateStudent(Student student, HttpServletRequest request)
	{
		studentservice.updateStudent(student);
		return "redirect:allstudent.action";
	}
	//学生详情界面
	@RequestMapping("/godetailstudent")
	public String goDetailStudent(String stunum, HttpServletRequest request)
	{
		Student student = studentservice.getOneStudentByStunum(stunum);
		HttpSession session = request.getSession();
		session.setAttribute("getOneStudentByStunum", student);
		return "student/detailstudent";
	}
	
	
	//去学生登录界面
	@RequestMapping("/gostudentlogin")
	public String goStudentLogin(JobVo jobvo,HttpServletRequest request)
	{
		List<Job> list = js.showSomeJobBySome(jobvo);
		HttpSession session = request.getSession();
		session.setAttribute("jobs", list);
		return "student/studentlogin";
	}
	
	//去studenycontroller界面
	@RequestMapping("/gostudentcontroller")
	public String goStudentCintroller(HttpServletRequest request,StudentVo studentvo)
	{
		Student student = studentservice.getOneStudentByStunum(studentvo.getStunum());
		Resuem resuem = rs.getOneResuemByStunum(studentvo.getStunum());
		if(student != null)
		{
				if(studentvo.getStuloginpwd().equals(student.getStuloginpwd()))
				{
					String error = "";
					HttpSession session = request.getSession();
					session.setAttribute("error", error);
					session.setAttribute("student", student);
					session.setAttribute("resuem", resuem);
					session.setAttribute("stunum", studentvo.getStunum());
					return "student/studentcontroller";
				}
				else
				{
					String error = "密码错误";
					HttpSession session = request.getSession();
					session.setAttribute("error", error);
					return "student/studentlogin";
				}
			
		}
		else
		{
			String error = "用户不存在";
			HttpSession session = request.getSession();
			session.setAttribute("error", error);
			return "student/studentlogin";
		}
	}
	//学生查看个人信息
	@RequestMapping("/godetailstudentbystudent")
	public String studentGoDetailStudent(HttpServletRequest request)
	{
		return "student/detailstudentbystudent";
	}
	//学生去修改学生页面
	@RequestMapping("/goupdatestudentbystudent")
	public String studentgoUpdateStudent(String stunum,HttpServletRequest request)
	{
		return "student/updatestudentbystudent";
	}
	//修改学生界面
	@RequestMapping("/updatestudentbystudent")
	public String studentUpdateStudent(Student student, HttpServletRequest request)
	{
		studentservice.updateStudent(student);
		Student s = studentservice.getOneStudentByStunum(student.getStunum());
		HttpSession session = request.getSession();
		session.setAttribute("student", s);
		return "redirect:godetailstudentbystudent.action";
	}
	

	
	
	
}
