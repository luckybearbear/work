package com.njwangbo.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.baison.constraint.Constraint;
import com.njwangbo.po.Employ;
import com.njwangbo.service.EmployService;
import com.njwangbo.vo.EmployVo;

@Controller
public class EmployController 
{
	@Autowired
	private EmployService es;
	/*学生*/
	@RequestMapping("/addemploy")
	public String addemploy(Employ employ, HttpServletRequest request)
	{
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String now = sdf.format(date);
		employ.setEmploytime(now);
		es.addEmploy(employ);
		return "redirect:someemploybystunum.action?stunum="+employ.getStunum();
	}
	@RequestMapping("/someemploybystunum")
	public String getSomeEmployByStunum(String stunum,HttpServletRequest request)
	{
		List <Employ> list = es.getSomeEmployByStunum(stunum);
		HttpSession session = request.getSession();
		session.setAttribute("employ", list);
		return "employ/someemploybystunum";
	}
	
	@RequestMapping("/deleteemploy")
	public String deleteemploy(String stunum ,int employid,HttpServletRequest request)
	{
		es.deleteEmploy(employid);
		return "redirect:someemploybystunum.action?stunum="+stunum;
		
	}
	@RequestMapping("/getsomebyemploystatus")
	public String getsomebyemploystatus(EmployVo employvo,HttpServletRequest request)
	{
		List <EmployVo> list = es.getSomeEmployBySome(employvo);
		HttpSession session = request.getSession();
		session.setAttribute("employ", list);
		return "employ/someemploybystunum";
	}
	/*公司*/
	@RequestMapping("/gosomeemploybycid")
	public String gosomeemploybycid(EmployVo employvo ,HttpServletRequest request)
	{
		List<EmployVo> list = es.getSomeEmployBySome(employvo);
		HttpSession session = request.getSession();
		session.setAttribute("employ", list);
		return "employ/someemploybycid";
	}
	@RequestMapping("/deleteemploybycompany")
	public String deleteemploybycompany(int cid,int employid,HttpServletRequest request)
	{
		es.deleteEmploy(employid);
		return "redirect:gosomeemploybycid.action?cid="+cid;
	}
	
	@RequestMapping("/getsomebyemploystatusbycompany")
	public String getsomebyemploystatusbycompany(EmployVo employvo,HttpServletRequest request)
	{
		List <EmployVo> list = es.getSomeEmployBySome(employvo);
		HttpSession session = request.getSession();
		session.setAttribute("employ", list);
		return "employ/someemploybycid";
	}
	@RequestMapping("/goupdateemploy")
	public String goupdateemploy(int employid,HttpServletRequest request)
	{
		EmployVo employ = es.getOneEmployByEmployId(employid);
		HttpSession session = request.getSession();
		session.setAttribute("e", employ);
		return "employ/updateemploy";
	}
	@RequestMapping("/updateemploy")
	public String updateemploy(Employ employ,HttpServletRequest request)
	{
		es.updateEmploy(employ);
		return "redirect:gosomeemploybycid.action?cid="+employ.getCid();
	}
	/*back*/
	@RequestMapping("/allemploy")
	public String getallemploy(HttpSession session,EmployVo employvo,HttpServletRequest request)
	{
		List<EmployVo> list = es.getAllEmploy();
		session.removeAttribute("cname");
		session.removeAttribute("stuname");
		session.removeAttribute("jobname");
		int maxpagenum = 0;
        if(list.size()%Constraint.PAGE_SIZE==0)
        {
            maxpagenum =list.size()/Constraint.PAGE_SIZE;
        }
        else
        {
            maxpagenum =list.size()/Constraint.PAGE_SIZE+1;
        }
        int page=employvo.getPagenum();
         if(page>=maxpagenum){
            page=maxpagenum;
          }
          if(page<=1){
            page=1;
          }
        List<EmployVo> employlist = new ArrayList<EmployVo>();
        for(int i=(page-1)*Constraint.PAGE_SIZE;i<page*Constraint.PAGE_SIZE;i++){
            if(list.size()>i){
            	employlist.add(list.get(i));
            }
        }
		session.setAttribute("curPage", page);
		session.setAttribute("maxPage", maxpagenum);
		session.setAttribute("employ",employlist);
		return "employ/someemploybyback";
	}
	@RequestMapping("/getsomeemploybysome")
	public String getsomeemploybysome(HttpSession session,EmployVo employvo,HttpServletRequest request)
	{
		if(employvo.getCname() != null)
		{
			session.setAttribute("cname",employvo.getCname());
		}
		if(session.getAttribute("cname") != null)
		{
			employvo.setCname(session.getAttribute("cname").toString());
		}
		
		if(employvo.getStuname() != null)
		{
			session.setAttribute("stuname", employvo.getStuname() );
		}
		if(session.getAttribute("stuname") != null)
		{
			employvo.setStuname(session.getAttribute("stuname").toString());
		}
		
		if(employvo.getJobname() !=null)
		{
			session.setAttribute("jobname", employvo.getJobname());
		}
		if(session.getAttribute("jobname") != null)
		{
			employvo.setJobname(session.getAttribute("jobname").toString());
		}
		//employstatus
		if(employvo.getEmploystatus() !=null)
		{
			session.setAttribute("employstatus", employvo.getEmploystatus());
		}
		if(session.getAttribute("employstatus") != null)
		{
			employvo.setEmploystatus(session.getAttribute("employstatus").toString());
		}
		List<EmployVo> list = es.getSomeEmployBySome(employvo);
		int maxpagenum = 0;
        if(list.size()%Constraint.PAGE_SIZE==0){
            maxpagenum =list.size()/Constraint.PAGE_SIZE;
        }
        else{
            maxpagenum =list.size()/Constraint.PAGE_SIZE+1;
        }
        int page=employvo.getPagenum();
         if(page>=maxpagenum){
            page=maxpagenum;
          }
          if(page<=1){
            page=1;
          }
        List<EmployVo> employlist = new ArrayList<EmployVo>();
        for(int i=(page-1)*Constraint.PAGE_SIZE;i<page*Constraint.PAGE_SIZE;i++){
            if(list.size()>i){
            	employlist.add(list.get(i));
            }
        }

		session.setAttribute("curPage", page);
		session.setAttribute("maxPage", maxpagenum);
		session.setAttribute("employ",employlist);
		return "employ/someemploybyback";
	}
	
/*导出Excel文件*/
	@RequestMapping("/exportExcel")
	public void export(EmployVo employvo,HttpServletResponse response) throws IOException{
		List<EmployVo> list = es.getSomeEmployBySome(employvo);
        // 只是让浏览器知道要保存为什么文件而已，真正的文件还是在流里面的数据，你设定一个下载类型并不会去改变流里的内容。
        //而实际上只要你的内容正确，文件后缀名之类可以随便改，就算你指定是下载excel文件，下载时我也可以把他改成pdf等。
        
        response.setContentType("application/vnd.ms-excel");
        // 传递中文参数编码
        String codedFileName = java.net.URLEncoder.encode("学生就业信息表","UTF-8");
        response.setHeader("content-disposition", "attachment;filename=" + codedFileName + ".xls");
        // 定义一个工作薄
        Workbook workbook = new HSSFWorkbook();
        // 创建一个sheet页
        Sheet sheet = workbook.createSheet("学生就业信息");
        // 创建一行
        Row row = sheet.createRow(0);
        // 在本行赋值 以0开始
        row.createCell(0).setCellValue("编号");
        row.createCell(1).setCellValue("姓名");
        row.createCell(2).setCellValue("学号");
        row.createCell(3).setCellValue("职业");
        row.createCell(4).setCellValue("公司");
        row.createCell(5).setCellValue("公司地址");
        row.createCell(6).setCellValue("公司联系方式");
        row.createCell(7).setCellValue("审核状态");
        // 定义样式
        CellStyle cellStyle = workbook.createCellStyle();
       
        // 遍历输出
        for (int i = 1; i <= list.size(); i++) {
            EmployVo ev = list.get(i-1);
            row = sheet.createRow(i);
            row.createCell(0).setCellValue(ev.getEmployid());
            row.createCell(1).setCellValue(ev.getStudent().getStuname());
            row.createCell(2).setCellValue(ev.getStudent().getStunum());
            row.createCell(3).setCellValue(ev.getJob().getJobname());
            row.createCell(4).setCellValue(ev.getCompany().getCname());
            row.createCell(5).setCellValue(ev.getCompany().getLocation());
            row.createCell(6).setCellValue(ev.getCompany().getCcontact());
            row.createCell(7).setCellValue(ev.getEmploystatus());
            }
        OutputStream  fOut = response.getOutputStream();
        workbook.write(fOut); 
        fOut.flush();  
        fOut.close(); 
    }
	
	
}
