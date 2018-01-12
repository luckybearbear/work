package com.njwangbo.mapper;

import java.util.List;

import com.njwangbo.po.Company;
import com.njwangbo.vo.CompanyVo;

public interface CompanyMapper {
	//所有的公司信息
	public List<CompanyVo> showAllCompany();
	//添加公司信息
	public void addCompanyByCompany(Company company);
	//根据id删除公司
	public void deleteCompany(int cid);
	//修改公司信息
	public void updateCompany(Company company);
	//通过cid获取公司信息
	public Company getOneCompanyByCid(int  cid);
	//多条件查询公司信息
	public List<CompanyVo> getSomeCompanyBySome(CompanyVo companyvo);
	//通过cloginname 查询公司信息 用来验证登录账号是否正确
	public Company getOneCompanyByCloginname(String cloginname);
}
