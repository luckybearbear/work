package com.njwangbo.service;

import java.util.List;

import com.njwangbo.po.Student;
import com.njwangbo.vo.StudentVo;

public interface StudentService {
	//显示所有学生基本信息
	public List<StudentVo> showAllStudent();
	//添加学生信息
	public void addStudent(Student student);
	//根据id删除学生
	public void deleteStudent(String stunum);
	//修改学生信息
	public void updateStudent(Student student);
	//通过stunum获取学生信息
	public Student getOneStudentByStunum(String stunum);
	
	//多条件模糊查询学生信息
	public List<StudentVo> getSomeStudentBySome(StudentVo studentvo);
}
