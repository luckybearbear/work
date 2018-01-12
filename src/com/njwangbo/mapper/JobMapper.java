package com.njwangbo.mapper;

import java.util.List;

import com.njwangbo.po.Job;
import com.njwangbo.vo.JobVo;

public interface JobMapper 
{
	//所有的职业
	public List<Job> showAllJob();
	//添加招聘信息
	public void addJob(Job job);
	//根据jid删除招聘信息
	public void deleteJobByJid(int jid);
	//根据jid修改招聘信息++0000
	public void updateJobByJid(Job job);
	//根据jid获取一条招聘信息
	public Job getOneJobByJid(int jid);
	//模糊查询
	public List<Job> showSomeJobBySome(JobVo jobvo);
	
	public List<JobVo> showSomeJobByJobStatus(JobVo jobvo);
	//通过cid查询
	public List<Job> showSomeJObByCid(int cid);
	
}
