package com.stock.security.dept.controller;

import static org.junit.Assert.fail;

import java.util.Date;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;

import com.stock.common.SpringTest;
import com.stock.security.dept.model.Department;
import com.stock.security.dept.model.DepartmentCondition;
import com.stock.security.dept.model.DepartmentView;
import com.stock.security.dept.service.DepartmentService;

public class DepartmentControllerTest extends SpringTest{
	@Autowired
	ApplicationContext ctx;
	
	
	
	
	@Test
	public void testDeptManage() {
		try {
			DepartmentService service = ctx.getBean(DepartmentService.class);
			DepartmentCondition condition = new DepartmentCondition();
			condition.setDeptName("部门");
			condition.setDeptNo(2);
			List<DepartmentView> list =  service.queryDeptPageByCondition(condition);
			for(DepartmentView view:list){
				System.out.println("id:" + view.getId() + "  name:" + view.getDeptName() + "  deptNo:" + view.getDeptNo());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Test
	public void testQueryDeptPage() {
		fail("Not yet implemented");
	}

	@Test
	public void testToAddOrUpdateDept() {
		fail("Not yet implemented");
	}

	@Test
	public void testAddOrUpdateDept() {
		try {
			long id = 1;
			if(id == 0){
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
				long deptId = service.insertDept(dept);
				System.out.println("id:" + deptId);
			}else{
				DepartmentService service = ctx.getBean(DepartmentService.class);
				Department dept = new Department();
				dept.setDeptName("部门122");
				dept.setCreateTime(new Date());
				dept.setCreateUser(122l);
				dept.setDeptNo(2);
				dept.setParentId(2l);
				dept.setParentIdFull("/2/2");
				dept.setRemarks("备注2");
				dept.setStatus(Department.STATUS_DELETE);
				service.updateDeptById(dept, id);
				System.out.println("更新成功" + id);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
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
