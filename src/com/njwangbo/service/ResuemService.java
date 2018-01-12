package com.njwangbo.service;

import java.util.List;

import com.njwangbo.po.Resuem;

public interface ResuemService
{
	public void addResume(Resuem resuem); 
	
	public void deleteResuem(String stunum);
	
	public Resuem getOneResuemByRid(String rid);
	
	public void updateResuem(Resuem resuem);
	
	public List<Resuem> showAllResuem();
	
	public List<Resuem> getAllRusuemByStunum(String stunum);

	
	public Resuem getOneResuemByStunum(String stunum);
	
	public void updateimg(Resuem resuem);
}
