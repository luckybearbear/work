package com.njwangbo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.njwangbo.mapper.StudentMapper;
import com.njwangbo.po.Student;
import com.njwangbo.service.StudentService;
import com.njwangbo.vo.StudentVo;
@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentMapper studentmapper;
	public void addStudent(Student student) {
		studentmapper.addStudent(student);
	}

	public void deleteStudent(String stunum) {
		studentmapper.deleteStudent(stunum);
	}

	public List<StudentVo> showAllStudent() {
		return studentmapper.showAllStudent();
	}

	public void updateStudent(Student student) {
		studentmapper.updateStudent(student);
	}

	public Student getOneStudentByStunum(String stunum) {
		return studentmapper.getOneStudentByStunum(stunum);
	}

	public List<StudentVo> getSomeStudentBySome(StudentVo studentvo) {
		return studentmapper.getSomeStudentBySome(studentvo);
	}

}
