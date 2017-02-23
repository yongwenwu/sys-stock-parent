package com.stock.security.dept.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.stock.common.exception.SYSException;
import com.stock.common.httpmodel.DataGridJson;
import com.stock.common.httpmodel.DataGridModel;
import com.stock.common.httpmodel.JsonResult;
import com.stock.security.dept.model.Department;
import com.stock.security.dept.model.DepartmentCondition;
import com.stock.security.dept.model.DepartmentView;
import com.stock.security.dept.service.DepartmentService;

/**
 * 部门请求处理
 * @author wyw
 * @date:2016年10月3日 下午11:00:46
 */
@Controller
@RequestMapping("/manage/dept")
public class DepartmentController {
	private Logger logger = Logger.getLogger(DepartmentController.class) ;
			
	@Autowired
	private DepartmentService departmentService;
	
	/**
	 * 返回部门管理页面
	 * @author wyw
	 * @date:2016年10月3日 下午11:05:23
	 * @param modelAndView
	 * @return
	 */
	@RequestMapping("/deptManage.do")
	public ModelAndView deptManage(ModelAndView modelAndView){
		modelAndView.setViewName("/security/dept/deptManage");
		
		return modelAndView;
	}
	
	/**
	 * 获取部门信息分页列表
	 * @author wyw
	 * @date:2016年10月7日 下午3:49:20
	 * @param dataGridModel
	 * @param condition
	 * @return
	 */
	@RequestMapping("/queryDeptPage.do")
	@ResponseBody
	public DataGridJson queryDeptPage(DataGridModel dataGridModel, DepartmentCondition condition) {
		DataGridJson dataGridJson = new DataGridJson();
		
		try {
			dataGridJson.setTotal(departmentService.queryDeptPageCountByCondition(condition));
			condition.setDataGridModel(dataGridModel);
			List<DepartmentView> list = departmentService.queryDeptPageByCondition(condition);
			dataGridJson.setRows(list);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dataGridJson;
	}
	
	/**
	 * 新建、编辑部门页面
	 * @author wyw
	 * @date:2016年10月6日 下午10:38:07
	 * @param modelAndView
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/toAddOrUpdateDept.do")
	public ModelAndView toAddOrUpdateDept(ModelAndView modelAndView,DepartmentCondition condition) throws Exception{
		modelAndView.setViewName("/security/dept/addOrUpdateDept");
		Department dept = null;
		try {
			if(condition.getId() != null && condition.getId()>0){
				dept = departmentService.queryDeptById(condition.getId());
			}
		} catch (Exception e) {
			logger.error(e);
			e.printStackTrace();
			throw e;
		}
		modelAndView.addObject("dept", dept);
		return modelAndView;
	}
	
	/**
	 * 新建或编辑部门信息
	 * @author wyw
	 * @date:2016年10月7日 下午6:53:41
	 * @param dept
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/addOrUpdateDept.do")
	@ResponseBody
	public JsonResult addOrUpdateDept(Department dept) throws Exception{
		JsonResult result = new JsonResult(); 
		try {
			if(dept.getId() != null && dept.getId()>0){//编辑
				departmentService.updateDeptById(dept, dept.getId());
			}else{//新建
				dept.setCreateTime(new Date());
				dept.setCreateUser(1L);
				dept.setStatus(Department.STATUS_VALID);
				dept.setParentId(0L);
				departmentService.insertDept(dept);
			}
		} catch (Exception e) {
			result.failed("新建或更新异常！" + e);
			logger.error(e);
			e.printStackTrace();
			throw e;
		}
		return result;
	}
	
	
	
	/**
	 * 部门详情
	 * @author wyw
	 * @date:2016年10月6日 下午10:38:07
	 * @param modelAndView
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/showDeptDetail.do")
	public ModelAndView showDeptDetail(ModelAndView modelAndView,DepartmentCondition condition) throws Exception{
		modelAndView.setViewName("/security/dept/showDeptDetail");
		Department dept = null;
		try {
			if(condition.getId() != null && condition.getId()>0){
				dept = departmentService.queryDeptById(condition.getId());
			}
		} catch (Exception e) {
			logger.error(e);
			e.printStackTrace();
			throw e;
		}
		modelAndView.addObject("dept", dept);
		return modelAndView;
	}
	
	
	/**
	 * 删除试题
	 * 
	 * @Title: delQuestionById
	 * @Description:
	 * @param request
	 * @return result
	 * @author: mazy
	 * @throws SYSException
	 * @date: 2016年8月15日
	 */
	@RequestMapping("/delDeptById.do")
	@ResponseBody
	public JsonResult delDeptById(ModelAndView modelAndView,DepartmentCondition condition) throws SYSException {
		JsonResult result = new JsonResult();
		Map<String, Object> map = new HashMap<String, Object>();
		int flag = 1;
		if (StringUtils.isBlank(condition.getIds())) {
			map.put("flag", 2);
			result.setData(map);
			return result;
		}
		try {
			List<Long> idList = new ArrayList<Long>();
			if(condition.getIds() != null && condition.getIds().length()>0){
				String[] idArray = condition.getIds().split(",");
				for(String id:idArray){
					idList.add(new Long(id));
				}
			}
			departmentService.delDeptByIdList(idList, 1L);
		} catch (Exception e) {
			logger.error("操作删除部门时出现异常!", e);
			result.failed(e.getMessage());
		}
		map.put("flag", flag);
		result.setData(map);
		return result;
	}
	
	/**
	 * 更新启用或停用状态
	 * @author wyw
	 * @date:2016年10月10日 下午1:31:56
	 * @param modelAndView
	 * @param condition
	 * @return
	 * @throws SYSException
	 */
	@RequestMapping("/updateEnableStatus.do")
	@ResponseBody
	public JsonResult updateEnableStatus(ModelAndView modelAndView,DepartmentCondition condition) throws SYSException {
		JsonResult result = new JsonResult();
		Map<String, Object> map = new HashMap<String, Object>();
		int flag = 1;
		if (StringUtils.isBlank(condition.getIds()) && condition.getStatus() == null ) {
			map.put("flag", 2);
			result.setData(map);
			return result;
		}
		try {
			List<Long> idList = new ArrayList<Long>();
			if(condition.getIds() != null && condition.getIds().length()>0){
				String[] idArray = condition.getIds().split(",");
				for(String id:idArray){
					idList.add(new Long(id));
				}
			}
			departmentService.updateEnableStatusByIdList(idList, condition.getStatus(), 1L);
		} catch (Exception e) {
			logger.error("操作删除部门时出现异常!", e);
			result.failed("操作删除部门时出现异常!"+e);
		}
		map.put("flag", flag);
		result.setData(map);
		return result;
	}
	
	
	
	

}
