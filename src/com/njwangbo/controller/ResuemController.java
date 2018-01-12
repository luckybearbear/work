package com.njwangbo.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.njwangbo.po.Resuem;
import com.njwangbo.service.ResuemService;

@Controller
public class ResuemController
{
	@Autowired
	private ResuemService rs;
	//去编辑学生个人简历
	@RequestMapping("/goupdateresume")
	public String goupdateresume(String stunum,HttpServletRequest request) 
	{
		Resuem resuem = rs.getOneResuemByStunum(stunum);
		HttpSession session = request.getSession();
		session.setAttribute("resuem", resuem);
		return "resuem/updateresume";
	}
	//去上传照片界面
	@RequestMapping("/goaddimg")
	public String goaddimg()
	{
		return "resuem/addimg";
	}
	//添加照片
	@RequestMapping("/addimg")
	public String addimg(String stunum,HttpServletRequest request,MultipartFile image) throws IllegalStateException, IOException
	{
		String basePath = "E:/upload/";
		String fileName = UUID.randomUUID()+image.getOriginalFilename().substring(image.getOriginalFilename().lastIndexOf("."));
		String path = basePath+fileName;
		image.transferTo(new File(path));
		Resuem resuem = rs.getOneResuemByStunum(stunum);
		resuem.setImg(fileName);
		rs.updateimg(resuem);
		HttpSession session = request.getSession();
		session.setAttribute("resuem", resuem);
		return "redirect:getresuem.action?stunum="+resuem.getStunum();
	}
	//编辑个人简历
	@RequestMapping("/updateresuem")
	public String updateresuem(Resuem resuem,HttpServletRequest request)  
	{
		rs.updateResuem(resuem);
		HttpSession session = request.getSession();
		session.setAttribute("resuem", resuem);
			
		return "redirect:getresuem.action?stunum="+resuem.getStunum();
	}
	
	//查看个人简历
	@RequestMapping("/getresuem")
	public String getresuen(String stunum,HttpServletRequest request)
	{
		Resuem resuem = rs.getOneResuemByStunum(stunum);
		HttpSession session = request.getSession();
		session.setAttribute("resuem", resuem);
		return "resuem/resuem";
	}
}
