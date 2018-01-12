package com.njwangbo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njwangbo.mapper.JobMapper;
import com.njwangbo.po.Job;
import com.njwangbo.service.JobService;
import com.njwangbo.vo.JobVo;
@Service
public class JobServiceImpl implements JobService {
	@Autowired
	private JobMapper jm;
	public void addJob(Job job) {
		jm.addJob(job);
	}

	public void deleteJobByJid(int jid) {
		jm.deleteJobByJid(jid);
	}

	public Job getOneJobByJid(int jid) {
		return jm.getOneJobByJid(jid);
	}

	public List<Job> showAllJob() {
		return jm.showAllJob();
	}

	public void updateJobByJid(Job job) {
		jm.updateJobByJid(job);
	}

	public List<Job> showSomeJobBySome(JobVo jobvo) {
		return jm.showSomeJobBySome(jobvo);
	}

	public List<Job> showSomeJObByCid(int cid) {
		return jm.showSomeJObByCid(cid);
	}

	public List<JobVo> showSomeJobByJobStatus(JobVo jobvo) {
		return jm.showSomeJobByJobStatus(jobvo);
	}

	

}
