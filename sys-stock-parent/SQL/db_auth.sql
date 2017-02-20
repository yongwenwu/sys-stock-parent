CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户编号，自增',
  `login_name` varchar(20) DEFAULT NULL COMMENT '用户登录账号,唯一',
  `password` varchar(100) DEFAULT NULL COMMENT '用户密码',
  `user_type` int(2) unsigned zerofill DEFAULT NULL COMMENT '用户类型；1-超级系统管理员2-系统管理员3-普通用户',
  `employee_number` varchar(100) DEFAULT NULL COMMENT '员工编号',
  `nickname` varchar(50) DEFAULT NULL COMMENT '用户名昵称',
  `true_name` varchar(20) DEFAULT NULL COMMENT '真实姓名',
  `sex` int(1) DEFAULT NULL COMMENT '性别,1-男；2-女',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '所属部门',
  `position` varchar(20) DEFAULT NULL COMMENT '职务',
  `position_desc` varchar(100) DEFAULT NULL COMMENT '职务说明',
  `mobile_phone` varchar(50) DEFAULT NULL COMMENT '手机号',
  `office_telephone` varchar(50) DEFAULT NULL COMMENT '办公室电话',
  `home_telephone` varchar(50) DEFAULT NULL COMMENT '家庭电话',
  `email` varchar(50) DEFAULT NULL COMMENT '电子邮件',
  `head_img_url` varchar(255) DEFAULT NULL,
  `remarks` varchar(100) DEFAULT NULL COMMENT '备注',
  `status` int(1) DEFAULT NULL COMMENT '状态；1-启用；2-停用；3-删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user` bigint(20) DEFAULT NULL COMMENT '创建人Id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user` bigint(20) DEFAULT NULL COMMENT '更新人Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='用户表';


CREATE TABLE `t_department` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '部门id，自增',
  `dept_name` varchar(100) DEFAULT NULL COMMENT '部门名称',
  `dept_no` int(11) DEFAULT '0' COMMENT '部门排序号',
  `parent_id` bigint(11) DEFAULT '0' COMMENT '上级部门id',
  `parent_id_full` varchar(500) DEFAULT NULL COMMENT '部门全路径id',
  `dept_name_full` varchar(500) DEFAULT NULL COMMENT '部门全路径名称',
  `remarks` varchar(500) DEFAULT NULL COMMENT '备注',
  `status` int(2) DEFAULT NULL COMMENT '状态；1-启用；2-停用；3-删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='部门表';






















