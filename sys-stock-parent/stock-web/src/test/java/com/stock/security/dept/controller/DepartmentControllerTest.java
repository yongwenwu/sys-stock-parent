package com.stock.security.dept.controller;

import static org.junit.Assert.fail;

import java.util.Date;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;

import com.stock.common.SpringTest;
import com.stock.security.dept.model.Department;
import com.stock.security.dept.service.DepartmentService;

public class DepartmentControllerTest extends SpringTest{
	@Autowired
	ApplicationContext ctx;
	
	
	
	
	@Test
	public void testDeptManage() {
		fail("Not yet implemented");
	}

	@Test
	public void testQueryDeptPage() {
		fail("Not yet implemented");
	}

	@Test
	public void testToAddOrUpdateDept() {
		try {
			DepartmentService service = ctx.getBean(DepartmentService.class);
			Department dept = new Department();
			dept.setDeptName("部门1");
			dept.setCreateTime(new Date());
			dept.setCreateUser(1l);
			dept.setDeptNo(1);
			dept.setParentId(0l);
			dept.setParentIdFull("/0/");
			dept.setRemarks("备注");
			dept.setStatus(Department.STATUS_VALID);
			long id = service.insertDept(dept);
			System.out.println("id:" + id);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testAddOrUpdateDept() {
		fail("Not yet implemented");
	}

	@Test
	public void testShowDeptDetail() {
		fail("Not yet implemented");
	}

	@Test
	public void testDelDeptById() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdateEnableStatus() {
		fail("Not yet implemented");
	}

}
