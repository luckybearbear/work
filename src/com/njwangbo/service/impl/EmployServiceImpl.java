package com.njwangbo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njwangbo.mapper.EmployMapper;
import com.njwangbo.po.Employ;
import com.njwangbo.service.EmployService;
import com.njwangbo.vo.EmployVo;
@Service
public class EmployServiceImpl implements EmployService {
	@Autowired
	private EmployMapper em;
	public void addEmploy(Employ employ) {
		em.addEmploy(employ);
	}
	public List<Employ> getSomeEmployByStunum(String stunum) {
		return em.getSomeEmployByStunum(stunum);
	}
	public void deleteEmploy(int employid) {
		em.deleteEmploy(employid);
	}
	public List<EmployVo> getAllEmploy() {
		return em.getAllEmploy();
	}
	public EmployVo getOneEmployByEmployId(int employid) {
		return em.getOneEmployByEmployId(employid);
	}
	public List<Employ> getSomeEmployByJid(int jid) {
		return em.getSomeEmployByJid(jid);
	}
	public List<EmployVo> getSomeEmployBySome(EmployVo employvo) {
		return em.getSomeEmployBySome(employvo);
	}
	public void updateEmploy(Employ employ) {
		em.updateEmploy(employ);
	}

}
