package com.njwangbo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njwangbo.mapper.CompanyMapper;
import com.njwangbo.po.Company;
import com.njwangbo.service.CompanyService;
import com.njwangbo.vo.CompanyVo;
@Service
public class CompanyServiceImpl implements CompanyService {
	@Autowired
	private CompanyMapper cm;
	public void addCompanyByCompany(Company company) {
		cm.addCompanyByCompany(company);
	}

	public void deleteCompany(int cid) {
		cm.deleteCompany(cid);
	}

	public Company getOneCompanyByCid(int cid) {
		return cm.getOneCompanyByCid(cid);
	}

	public List<CompanyVo> showAllCompany() {
		return cm.showAllCompany();
	}

	public void updateCompany(Company company) {
		cm.updateCompany(company);
	}

	public List<CompanyVo> getSomeCompanyBySome(CompanyVo companyvo) {
		return cm.getSomeCompanyBySome(companyvo);
	}

	public Company getOneCompanyByCloginname(String cloginname) {
		return cm.getOneCompanyByCloginname(cloginname);
	}

}
