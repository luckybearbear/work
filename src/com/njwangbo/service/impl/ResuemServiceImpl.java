package com.njwangbo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njwangbo.mapper.ResuemMapper;
import com.njwangbo.po.Resuem;
import com.njwangbo.service.ResuemService;
@Service
public class ResuemServiceImpl implements ResuemService {
	@Autowired
	private ResuemMapper rm;
	public void addResume(Resuem resuem) {
		rm.addResume(resuem);
	}

	public void deleteResuem(String stunum) {
		rm.deleteResuem(stunum);
	}

	public Resuem getOneResuemByRid(String rid) {
		
		return rm.getOneResuemByRid(rid);
	}

	public List<Resuem> showAllResuem() {
		return rm.showAllResuem();
	}

	public void updateResuem(Resuem resuem) {
		rm.updateResuem(resuem);
	}

	public Resuem getOneResuemByStunum(String stunum) {
		return rm.getOneResuemByStunum(stunum);
	}

	public List<Resuem> getAllRusuemByStunum(String stunum) {
		return rm.getAllRusuemByStunum(stunum);
	}

	public void updateimg(Resuem resuem) {
		rm.updateimg(resuem);
		
	}

}
