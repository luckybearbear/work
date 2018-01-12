package com.njwangbo.service;

import java.util.List;

import com.njwangbo.po.Employ;
import com.njwangbo.vo.EmployVo;

public interface EmployService
{
	public void addEmploy(Employ employ);
	
	public void deleteEmploy(int employid);
	
	public void updateEmploy(Employ employ);
	
	
	public List<Employ> getSomeEmployByStunum(String stunum);
	
	public List<EmployVo> getAllEmploy();
	
	public List<EmployVo> getSomeEmployBySome(EmployVo employvo);
	
	public List<Employ> getSomeEmployByJid(int jid);
	
	public EmployVo getOneEmployByEmployId(int employid);
}
