-- 账户表
CREATE TABLE `t_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) DEFAULT NULL COMMENT '产品id',
  `product_version` bigint(10) DEFAULT NULL COMMENT '产品版本号',
  `org_id` bigint(20) DEFAULT NULL COMMENT '机构id',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `task_id` bigint(11) DEFAULT NULL COMMENT '任务ID',
  `account_type` tinyint(4) DEFAULT NULL COMMENT '账户类型:1：自助学习，2：部门任务，3：岗位任务',
  `status` int(11) DEFAULT NULL COMMENT '产品状态.0：未完成；1完成；2：过期；3：失效',
  `total_knowledge_count` int(11) DEFAULT NULL COMMENT '知识点总数',
  `finish_knowledge_count` int(11) DEFAULT NULL COMMENT '已完成知识点总数',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_user_id` int(11) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_user_id` bigint(11) DEFAULT NULL COMMENT '更新用户',
  `account_category` tinyint(1) DEFAULT NULL COMMENT '账户分类:1 课程 2 直播',
  `expire_time` date DEFAULT NULL COMMENT '过期时间',
  `first_study_time` datetime DEFAULT NULL COMMENT '第一次学习时间',
  `last_study_time` datetime DEFAULT NULL COMMENT '最后一次学习时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5963 DEFAULT CHARSET=utf8 COMMENT='账户';

--学习记录表
CREATE TABLE `t_knowledge` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `name` varchar(60) DEFAULT NULL COMMENT '名称',
  `introduce` varchar(2000) DEFAULT NULL COMMENT '介绍',
  `type` int(2) DEFAULT NULL COMMENT '知识点类型(0:课程类  1：考试类)',
  `resource_id` int(11) DEFAULT NULL COMMENT '课程资源ID',
  `status` int(1) DEFAULT NULL COMMENT '状态(0表示删除，1:新建,2:有效,3:无效,)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `org_id` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `updator` int(11) DEFAULT NULL COMMENT '更新人名称',
  PRIMARY KEY (`id`),
  KEY `knowid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;

-- 最后一次学习记录,只记录我的课程里面的记录
CREATE TABLE `t_last_study_record` (
  `user_id` bigint(11) NOT NULL,
  `account_id` bigint(11) DEFAULT NULL COMMENT '账号',
  `account_item_id` bigint(11) DEFAULT NULL COMMENT ' 子账户ID,如果是课程对应的是t_product.product_id,如果是任务对应的是t_studytask_structure.id',
  `service_id` bigint(11) DEFAULT NULL COMMENT '课程服务ID、考试服务ID、直播服务ID',
  `knowledge_type` int(1) DEFAULT NULL COMMENT '1:课程 2:考试知识点 3:考试服务',
  `knowledge_id` bigint(11) DEFAULT NULL COMMENT '知识点ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='最后一次学习记录,只记录我的课程里面的记录';
-- 收藏表
CREATE TABLE `t_user_collect` (
   `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
   `user_id` BIGINT(20) DEFAULT NULL,
   `type` INT(11) DEFAULT NULL COMMENT '1:课程 2资源',
   `cid` BIGINT(20) DEFAULT NULL COMMENT 'productId resourceId',
   `create_time` DATETIME DEFAULT NULL,
   `status` TINYINT(4) DEFAULT '1' COMMENT '0无效 1有效',
   PRIMARY KEY (`id`)
 ) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8
-- 资源表
CREATE TABLE `t_resource` (
   `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
   `resource_name` varchar(100) DEFAULT NULL COMMENT '资源名称',
   `file_name` varchar(100) DEFAULT NULL COMMENT '文件名称',
   `resource_type` tinyint(1) DEFAULT NULL COMMENT '1-课件; 2-教案',
   `resource_path` varchar(100) DEFAULT NULL COMMENT '资源最终的地址，当资源类型为MP4，mp3时，这个地址就是上传的地址，如果为PDF和office，那么就是swf的地址。',
   `office_path` varchar(100) DEFAULT NULL COMMENT 'word/excel/ppt路径,当资源类型为视频和MP3类型是，此处为空',
   `swf_path` varchar(100) DEFAULT NULL COMMENT 'swf路径,当资源类型为视频和MP3类型是，此处为空',
   `pdf_path` varchar(100) DEFAULT NULL COMMENT 'pdf路径,当资源类型为视频和MP3类型是，此处为空',
   `m3u8_url` varchar(100) DEFAULT NULL COMMENT 'm3u8路径',
   `m3u8_size` bigint(20) DEFAULT NULL COMMENT 'm3u8文件大小，单位为字节',
   `upload_type` tinyint(1) DEFAULT NULL COMMENT '1：本地资源（swf和pdf必须为此类型），2：服务器资源',
   `file_suffix` varchar(20) DEFAULT NULL COMMENT '媒体格式/文件后缀，如mp4、doc（后缀不需带.）',
   `video_time` decimal(10,2) DEFAULT NULL COMMENT '视频总时长，单位为小时',
   `status` tinyint(1) DEFAULT NULL COMMENT '状态(1-新建,2-有效,3-无效)',
   `remark` varchar(100) DEFAULT NULL COMMENT '资源简介',
   `org_id` bigint(11) DEFAULT NULL COMMENT '机构id',
   `create_user_id` bigint(11) DEFAULT NULL COMMENT '创建人id',
   `create_time` datetime DEFAULT NULL COMMENT '创建时间',
   `update_user_id` bigint(11) DEFAULT NULL COMMENT '修改人',
   `update_time` datetime DEFAULT NULL COMMENT '修改时间',
   PRIMARY KEY (`id`)
 ) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='资源表'


-- 个人中心统计表开始
 CREATE TABLE `t_self_test_report` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` bigint(20) DEFAULT NULL,
  `orgId` int(11) DEFAULT NULL,
  `testValues` int(11) DEFAULT NULL COMMENT '考试数',
  `testNumber` int(11) DEFAULT NULL COMMENT '考试次数',
  `testPassNum` int(11) DEFAULT NULL COMMENT '考试通过数',
  `testPassRate` varchar(11) DEFAULT NULL COMMENT '考试通过率',
  `type` int(11) DEFAULT NULL COMMENT '查询时间类型（1最近7天，2最近30天，3最近一年）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='个人中心学习报告（考试）';


CREATE TABLE `t_self_center` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `org_id` int(11) DEFAULT NULL COMMENT 'org_id',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门id',
  `study_durTime` int(255) DEFAULT '0' COMMENT '学习时长',
  `rank` int(255) DEFAULT NULL COMMENT '排名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `t_self_studytask_statistics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `org_id` int(11) DEFAULT NULL COMMENT '机构id',
  `dept_id` int(255) DEFAULT NULL,
  `finish_task_count` int(255) DEFAULT NULL COMMENT '已学课程',
  `total_study_time` int(11) DEFAULT NULL COMMENT '已学时长',
  `total_study_knowledge` int(255) DEFAULT NULL COMMENT '已学知识点',
  `rank` int(255) DEFAULT NULL COMMENT '排名',
  `type` int(255) DEFAULT NULL COMMENT '类型(1：最近一周，2：最近一个月，3：最近一年)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `t_live_studytask_statistics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) DEFAULT NULL,
  `org_id` int(255) DEFAULT NULL,
  `task_count` int(255) DEFAULT NULL COMMENT '直播总数',
  `take_task_count` int(255) DEFAULT NULL COMMENT '已参加',
  `duration` int(255) DEFAULT NULL COMMENT '总时长',
  `type` int(255) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `t_studytask_statistics` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` int(11) DEFAULT NULL,
  `user_id` bigint(255) DEFAULT NULL,
  `task_count` int(255) DEFAULT NULL COMMENT '任务数',
  `finish_task_count` int(255) DEFAULT NULL COMMENT '已完成任务数',
  `type` int(255) DEFAULT NULL COMMENT '''类型(1：最近一周，2：最近一个月，3：最近一年)'',',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
-- 个人中心统计表结束

-- 学分积分表
DROP TABLE IF EXISTS `t_scorehistory`;
CREATE TABLE `t_scorehistory` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reason` varchar(255) DEFAULT NULL,
  `score` decimal(10,2) DEFAULT NULL COMMENT '获得的学分',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `create_time` datetime DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL COMMENT '账号',
  `account_item_id` bigint(20) DEFAULT NULL COMMENT '子账户ID,如果是课程对应的是t_product.product_id,如果是任务对应的是t_studytask_structure.id',
  `service_id` bigint(20) DEFAULT NULL COMMENT '课程服务ID、考试服务ID、直播服务ID',
  `credits_set` int(255) DEFAULT NULL,
  `knowledge_id` bigint(20) DEFAULT NULL COMMENT '知识点ID',
  `knowledge_type` int(255) DEFAULT NULL,
  `integral_rule_id` int(11) DEFAULT NULL COMMENT '规则id(积分用到)',
  `type` int(255) DEFAULT NULL COMMENT '类型学分0积分1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;



-----学习任务表
 CREATE TABLE `t_studytask` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `name` varchar(255) DEFAULT NULL COMMENT '任务名称',
  `status` int(2) DEFAULT NULL COMMENT '状态1：新建中、2.新建、3.有效、4.无效、5.作废，0.删除（不显示）',
  `description` varchar(1000) DEFAULT NULL COMMENT '描述',
  `assign_time` datetime DEFAULT NULL COMMENT '指派时间',
  `finish_time` datetime DEFAULT NULL COMMENT '要求完成时间',
  `actual_time` datetime DEFAULT NULL COMMENT '任务实际完成时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间，机构的有效时间',
  `create_user_id` bigint(32) DEFAULT NULL COMMENT '创建人ID',
  `enable_time` datetime DEFAULT NULL COMMENT '启用时间',
  `enable_user_id` bigint(32) DEFAULT NULL COMMENT '启用者ID',
  `org_id` bigint(16) DEFAULT NULL COMMENT '创建者所在的机构ID',
  `course_count` int(10) DEFAULT NULL COMMENT '课程数',
  `exam_count` int(10) DEFAULT NULL COMMENT '考试数',
  `total_hours` decimal(10,2) DEFAULT NULL COMMENT '总学时',
  `tatal_credits` decimal(10,2) DEFAULT NULL COMMENT '总学分',
  `credits_set` int(4) DEFAULT NULL COMMENT '学员获得学分设置(0: 学员获得学分设置 1:此任务不需要启用学分。2:学习完成整个任务后才能获得此任务的总学分。3:任务中的考试通过后才能获得此考试前面已学课程的学分，不通过则不能获得相应的学分。对于课程后面没有设置考试的，则每学习一个课程就立即获得相应的学分。)',
  `study_type` int(4) DEFAULT NULL COMMENT '学习任务类型（1：任务学习 2：岗位学习 3：部门学习 4：自主学习）',
  `task_type` int(4) DEFAULT NULL COMMENT '任务类型 （0:课程任务 1：考试任务 2：直播任务）',
  `sys_code` varchar(100) DEFAULT NULL COMMENT '数据来源（所属系统）',
  `update_user_id` bigint(20) DEFAULT NULL COMMENT '更新用户Id',
  `update_time` datetime DEFAULT NULL,
  `dept_id` bigint(64) DEFAULT NULL COMMENT '部门ID',
  `pos_id` bigint(64) DEFAULT NULL COMMENT '岗位ID',
  `pic_url` varchar(500) DEFAULT NULL COMMENT '任务图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='学习任务表';

------学习任务结构表
CREATE TABLE `t_studytask_structure` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `task_id` bigint(64) DEFAULT NULL COMMENT '任务ID',
  `product_version` int(11) DEFAULT NULL COMMENT '产品版本',
  `content_service_id` bigint(64) DEFAULT NULL COMMENT '学习内容的id：课程(其实是产品product)ID,考试ID',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `course_hours` decimal(8,2) DEFAULT NULL COMMENT '课程学时（分钟）',
  `course_score` decimal(8,2) DEFAULT NULL COMMENT '课程学分',
  `elective_required` int(2) DEFAULT NULL COMMENT '选修或者必修（1：必修 2：选修）',
  `deliver_time` datetime DEFAULT NULL COMMENT '指派时间',
  `create_user_id` bigint(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` date DEFAULT NULL COMMENT '更新人',
  `update_user_id` bigint(11) DEFAULT NULL COMMENT '更新者ID',
  `parent_id` bigint(11) DEFAULT NULL COMMENT '父节点id',
  `parent_id_strs` varchar(250) DEFAULT NULL,
  `order_num` int(3) DEFAULT NULL COMMENT '排序',
  `structure_type` int(1) DEFAULT NULL COMMENT '类型，1：课程，2：考试，3：目录',
  `course_from` int(11) DEFAULT NULL COMMENT '课程来源：1-内部，0-外部',
  `finish_knowledge_count` int(11) DEFAULT '0' COMMENT '已学知识点个数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='学习任务结构表';


-----学习任务成员表
CREATE TABLE `t_studytask_user` (
  `id` bigint(64) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint(64) DEFAULT NULL COMMENT '学习人员ID',
  `dept_id` bigint(15) DEFAULT NULL COMMENT '学习人员所在部门ID',
  `pos_id` bigint(15) DEFAULT NULL COMMENT '学习人员岗位ID',
  `task_id` bigint(64) DEFAULT NULL COMMENT '任务ID',
  `study_hours` int(10) DEFAULT NULL COMMENT '学习人员的学时',
  `actual_time` datetime DEFAULT NULL COMMENT '任务实际完成时间',
  `get_score` int(10) DEFAULT NULL COMMENT '学习人员已得到的学分',
  `deduct_score` int(10) DEFAULT NULL COMMENT '学习人员已扣除的学分',
  `delay_days` int(10) DEFAULT NULL COMMENT '任务延期完成的天数',
  `remind_count` int(8) DEFAULT NULL COMMENT '任务提醒的次数',
  `exception_reason` varchar(255) DEFAULT NULL COMMENT '异常原因',
  `status` int(3) DEFAULT NULL COMMENT '任务完成情况（0:删除1：未完成 2：已完成 3：延期完成 4：异常 5：通过 6： 未通过（考试未通过））',
  `create_user_id` bigint(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` date DEFAULT NULL COMMENT '更新人',
  `update_user_id` bigint(11) DEFAULT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='学习任务成员表';

-----产品表
CREATE TABLE `t_product` (
  `product_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `version_id` int(11) DEFAULT NULL,
  `product_name` varchar(20) DEFAULT NULL,
  `create_user_id` bigint(20) DEFAULT NULL,
  `status` int(1) DEFAULT NULL COMMENT '1-新建中，2-新建，3-有效（启用后），4-无效，0-删除',
  `product_type` int(1) DEFAULT NULL COMMENT '1：文档类视频课程，2：文档类office课程，3：文档类PDF课程，4：文档类MP3课程，5-体系课程 ，6五道口创建课程，7：五道口创建的直播类产品，8：套装课程类',
  `product_category_id` bigint(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `introduction` text COMMENT '简介',
  `cover_path` varchar(100) DEFAULT NULL COMMENT '封面',
  `product_code` varchar(50) DEFAULT NULL COMMENT '产品code',
  `class_hour` decimal(5,2) DEFAULT NULL COMMENT '总学时',
  `credit` decimal(5,2) DEFAULT NULL COMMENT '总学分',
  `org_id` bigint(11) DEFAULT NULL,
  `source_product_id` bigint(11) DEFAULT NULL COMMENT '当代创建的课程，分配课程',
  `only_show` int(1) DEFAULT NULL COMMENT '是不是只是展示用课程,0-不显示，1-显示',
  `shared` int(1) DEFAULT NULL COMMENT '是否共享，下面的子部门是否能选课、学习，0-不共享，1-共享',
  `show_product` int(1) DEFAULT NULL COMMENT '是否前台显示，只用于文档类课程',
  `is_inner` int(11) DEFAULT NULL COMMENT '来源：1-内部，0-外部',
  `update_user_id` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `course_introduce` text COMMENT '课程介绍',
  `knowledge_count` int(11) DEFAULT NULL COMMENT '知识点总数',
  `enable_time` datetime DEFAULT NULL COMMENT '启用时间',
  `enable_user_id` bigint(20) DEFAULT NULL COMMENT '启用人主键',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8;

-----产品结构表
CREATE TABLE `t_product_structure` (
  `sturcture_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `product_id` bigint(11) DEFAULT NULL,
  `product_version_id` int(2) DEFAULT NULL,
  `structure_type` int(1) DEFAULT NULL COMMENT '1:课程服务，2：考试服务，3：直播服务，4：目录',
  `order_num` int(3) DEFAULT NULL,
  `status` int(1) DEFAULT NULL COMMENT '//1-新建中，2-新建，3-有效（启用后），4-无效，0-删除',
  `version_id` int(2) DEFAULT NULL,
  `product_service_id` bigint(11) DEFAULT NULL COMMENT '根据type去找对应的课程服务，考试服务或者直播服务',
  `create_user_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_user_id` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`sturcture_id`)
) ENGINE=InnoDB AUTO_INCREMENT=188 DEFAULT CHARSET=utf8 COMMENT='产品结构表';

----课程服务表
CREATE TABLE `t_course_service` (
  `course_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(50) NOT NULL,
  `course_category_id` bigint(11) DEFAULT NULL COMMENT '课程分类',
  `course_code` varchar(50) DEFAULT NULL COMMENT '课程编码',
  `class_hour` decimal(5,2) DEFAULT NULL COMMENT '学时',
  `credit` decimal(5,2) DEFAULT NULL COMMENT '学分',
  `status` int(1) DEFAULT NULL COMMENT '1-新建中，2-新建，3-有效（启用后），4-无效，0-删除',
  `course_knowledge_count` int(3) DEFAULT NULL,
  `exam_knowledge_count` int(3) DEFAULT NULL,
  `org_id` bigint(11) DEFAULT NULL,
  `create_user_id` bigint(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL COMMENT '更新人',
  `update_user_id` bigint(11) DEFAULT NULL COMMENT '更新者ID',
  `enable_time` datetime DEFAULT NULL COMMENT '启用时间',
  `enable_user_id` bigint(11) DEFAULT NULL COMMENT '启用者ID',
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10126 DEFAULT CHARSET=utf8 COMMENT='课程服务表';

-----课程服务结构表
CREATE TABLE `t_course_service_structure` (
  `structure_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `course_service_id` bigint(11) NOT NULL,
  `structure_name` varchar(50) DEFAULT NULL,
  `structure_type` int(1) DEFAULT NULL COMMENT '//类型，1：课程知识点，2：考试知识点，，3：目录',
  `parent_id` bigint(11) DEFAULT NULL,
  `parent_id_str` varchar(250) DEFAULT NULL,
  `knowledge_id` bigint(11) DEFAULT NULL,
  `org_id` bigint(11) DEFAULT NULL,
  `order_num` int(3) DEFAULT NULL,
  `is_audition` int(1) DEFAULT NULL COMMENT '是否试听,0-否，1-是',
  `create_user_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_user_id` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '1-有效，0-无效',
  PRIMARY KEY (`structure_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1617 DEFAULT CHARSET=utf8 COMMENT='课程服务结构表';

----课程资源表
CREATE TABLE `t_course_resouce` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(11) DEFAULT NULL,
  `resource_id` bigint(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL COMMENT '1-有效，0-无效',
  `create_user_id` bigint(20) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_user_id` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COMMENT='课程资源表';

----课程和教师关系表
CREATE TABLE `t_course_teacher` (
   `id` BIGINT(20) NOT NULL AUTO_INCREMENT,
   `course_id` BIGINT(20) DEFAULT NULL,
   `teacher_id` BIGINT(20) DEFAULT NULL,
   `create_user_id` BIGINT(20) DEFAULT NULL,
   `create_time` DATETIME DEFAULT NULL,
   `update_user_id` BIGINT(20) DEFAULT NULL,
   `update_time` DATETIME DEFAULT NULL,
   `status` INT(4) DEFAULT NULL COMMENT ' 0:无效  1:有效',
   PRIMARY KEY (`id`)
 ) ENGINE=INNODB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='课程和教师关系表'

--站内信关联表
CREATE TABLE `t_task_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `msg_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

--知识点表
CREATE TABLE `t_knowledge` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键自增',
  `name` varchar(60) DEFAULT NULL COMMENT '名称',
  `introduce` varchar(2000) DEFAULT NULL COMMENT '介绍',
  `type` int(2) DEFAULT NULL COMMENT '知识点类型(0:课程类  1：考试类)',
  `resource_id` int(11) DEFAULT NULL COMMENT '课程资源ID',
  `status` int(1) DEFAULT NULL COMMENT '状态(0表示删除，1:新建,2:有效,3:无效,)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator` int(11) DEFAULT NULL COMMENT '创建人',
  `org_id` bigint(20) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `updator` int(11) DEFAULT NULL COMMENT '更新人名称',
  PRIMARY KEY (`id`),
  KEY `knowid` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8;


----考试服务表
CREATE TABLE `t_exam_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `exam_id` bigint(20) DEFAULT NULL COMMENT '考试id',
  `create_user_id` bigint(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` date DEFAULT NULL COMMENT '更新人',
  `update_user_id` bigint(11) DEFAULT NULL COMMENT '更新者ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

CREATE TABLE `t_ask` (
  `ask_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `ask_tag` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `programid` bigint(16) DEFAULT NULL,
  `moduleid` bigint(16) DEFAULT NULL,
  `courseid` bigint(16) DEFAULT NULL,
  `knowledgeid` bigint(16) DEFAULT NULL,
  `programtitle` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `moduletitle` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `coursetitle` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `knowledgetitle` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `question_id` bigint(16) DEFAULT NULL,
  `question_content` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `reask_count` int(8) DEFAULT NULL,
  `view_times` int(8) DEFAULT NULL,
  `answer_date` datetime DEFAULT NULL,
  `answer_name` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `answer_id` bigint(16) DEFAULT NULL,
  `is_essence` int(6) DEFAULT NULL,
  `is_top` int(6) DEFAULT NULL,
  `status` int(6) DEFAULT NULL,
  `suitable` int(6) DEFAULT NULL,
  `check_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `ask_type` int(6) NOT NULL DEFAULT '0',
  `class_room_schedule_id` bigint(16) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_user` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `create_user_id` bigint(16) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `ask_attribute` bigint(10) DEFAULT NULL,
  `pro_id` bigint(19) DEFAULT NULL,
  `procode` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `praise_count` bigint(10) DEFAULT NULL,
  `_MODULEID` varchar(255) DEFAULT NULL,
  `statusbak` int(2) NOT NULL DEFAULT '0',
  `syscode` varchar(100) DEFAULT NULL COMMENT '数据来源（所属系统）',
  `organizationId` bigint(16) DEFAULT NULL COMMENT '创建者所在的机构ID',
  `opened` int(2) DEFAULT NULL COMMENT '是否公开',
  `viewtimes` int(22) DEFAULT '0',
  PRIMARY KEY (`ask_id`),
  KEY `idx_answerdate_prgid` (`programid`),
  KEY `idx_answerdate_status` (`status`),
  KEY `idx_ask_anserdate` (`answer_date`),
  KEY `idx_ask_courseid` (`courseid`),
  KEY `idx_ask_moduleid` (`moduleid`),
  KEY `fkfdb9c3e277129781` (`pro_id`),
  KEY `fkfdb9c3e27a56c696` (`question_id`),
  KEY `fkfdb9c3e2a7a0aa2` (`answer_id`),
  KEY `FKFDB9C3E25C765332` (`create_user_id`),
  KEY `FKFDB9C3E2C383D13B` (`class_room_schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `t_ask_question` (
  `ask_question_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET utf8,
  `ask_id` int(16) DEFAULT NULL,
  `teacher_answer` longtext COLLATE utf8_bin,
  `teacher_name` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `teacher_id` bigint(16) DEFAULT NULL,
  `answer_date` datetime DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `is_finish` int(6) DEFAULT NULL,
  `is_reask` int(6) DEFAULT NULL,
  `satisfy_count` bigint(16) DEFAULT NULL,
  `dissatisfy_count` bigint(16) DEFAULT NULL,
  PRIMARY KEY (`ask_question_id`),
  KEY `idx_askquestion_askid` (`ask_id`),
  KEY `fkeaf4d7a35e675bfe` (`teacher_id`),
  KEY `FKEAF4D7A374356E8F` (`ask_id`)
) ENGINE=InnoDB AUTO_INCREMENT=449 DEFAULT CHARSET=utf8 COLLATE=utf8_bin CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;


CREATE TABLE `t_teacherproductevaluation` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `userId` bigint(11) DEFAULT NULL,
  `accountId` bigint(11) DEFAULT NULL,
  `accountItemId` bigint(11) DEFAULT NULL COMMENT '产品ID',
  `createTime` datetime DEFAULT NULL COMMENT '评价时间',
  `teacherid` bigint(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL COMMENT '内容把握（原老师分数）',
  `evaluation` varchar(2000) DEFAULT NULL COMMENT '评价',
  `teachingskills` int(11) DEFAULT '0' COMMENT '授课技巧',
  `communicationexpression` int(11) DEFAULT '0' COMMENT '沟通表达',
  `teachingimage` int(11) DEFAULT '0' COMMENT '授课形象',
  `timegrasp` int(11) DEFAULT '0' COMMENT '时间把握',
  `productId` bigint(20) DEFAULT NULL,
  `orgId` bigint(20) DEFAULT NULL,
  `teachinginfection` int(11) DEFAULT '0' COMMENT '讲授感染力',
  `scoresum` int(11) DEFAULT NULL COMMENT '几项评价总分数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户对老师所教产品的评价表';

CREATE TABLE `t_topic_answer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(16) DEFAULT NULL COMMENT '课程id',
  `pid` bigint(16) DEFAULT NULL,
  `pname` varchar(50) DEFAULT NULL,
  `course_name` varchar(50) DEFAULT NULL COMMENT '课程名',
  `user_id` bigint(16) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `user_code` varchar(50) DEFAULT NULL COMMENT '用户code',
  `user_dept` varchar(50) DEFAULT NULL COMMENT '用户部门',
  `text` text COMMENT '内容',
  `topic_ask_id` bigint(16) DEFAULT NULL COMMENT '问题id',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `syscode` varchar(100) DEFAULT NULL COMMENT '数据来源（所属系统）',
  `organizationId` bigint(16) DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `account_item_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;


CREATE TABLE `t_topic_ask` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cid` bigint(16) DEFAULT NULL,
  `pid` bigint(16) DEFAULT NULL,
  `pname` varchar(50) DEFAULT NULL,
  `course_id` bigint(16) DEFAULT NULL COMMENT '课程id',
  `course_name` varchar(50) DEFAULT NULL COMMENT '课程名',
  `user_id` bigint(16) DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `user_code` varchar(50) DEFAULT NULL COMMENT '用户code',
  `user_dept` varchar(50) DEFAULT NULL COMMENT '用户部门',
  `text` text COMMENT '内容',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `syscode` varchar(100) DEFAULT NULL COMMENT '数据来源（所属系统）',
  `organizationId` bigint(16) DEFAULT NULL,
  `account_id` bigint(20) DEFAULT NULL,
  `account_item_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8;


CREATE TABLE `t_userproductevaluation` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `userId` bigint(11) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL,
  `productname` varchar(100) NOT NULL COMMENT '课程名称',
  `productid` bigint(11) DEFAULT NULL COMMENT '课程ID',
  `coursecode` varchar(50) DEFAULT NULL COMMENT '产品编码',
  `evaluatetime` datetime DEFAULT NULL COMMENT '评价时间',
  `contentscore` int(11) DEFAULT NULL COMMENT '课程内容实用性（原课程内容）',
  `qualityscore` int(11) DEFAULT NULL COMMENT '逻辑结构合理性（原课件质量）',
  `teacherqualityscore` int(11) DEFAULT NULL COMMENT '课程设计趣味性（原老师素质）',
  `evaluation` varchar(2000) DEFAULT NULL COMMENT '评价',
  `schedule` int(11) DEFAULT NULL COMMENT '学习进度',
  `pid` bigint(11) DEFAULT NULL,
  `learningTaskId` bigint(11) DEFAULT '0' COMMENT '学习任务id',
  `coursedurationscore` int(11) DEFAULT '0' COMMENT '课程时长适中性',
  `courseproductionscore` int(11) DEFAULT '0' COMMENT '课程制作精致度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户对产品的评价表';

-- 学习记录表
CREATE TABLE `t_video_recording` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `start_time` bigint(50) DEFAULT NULL COMMENT '播放开始时间,单位秒',
  `max_time` bigint(50) DEFAULT NULL COMMENT '已播放最大进度,单位秒',
  `total_time` bigint(50) DEFAULT NULL COMMENT '文件总时长,单位秒',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `record_source` tinyint(1) DEFAULT NULL COMMENT '记录来源 1:PC 2:IOS 3:安卓 4:其他',
  `account_id` bigint(11) DEFAULT NULL COMMENT '账户ID',
  `account_item_id` bigint(11) DEFAULT NULL COMMENT ' 子账户ID,如果是课程对应的是t_product.product_id,如果是任务对应的是t_studytask_structure.id',
  `org_id` bigint(11) DEFAULT NULL COMMENT '机构id',
  `user_id` bigint(11) DEFAULT NULL COMMENT '用户ID',
  `service_id` bigint(11) DEFAULT NULL COMMENT '对应的服务ID',
  `knowledge_id` bigint(11) DEFAULT NULL COMMENT '知识点ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='学习记录表,相同课程知识点只记录一次';

-- 学习时间记录表
CREATE TABLE `t_video_recording_his` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `learn_time` bigint(50) DEFAULT NULL COMMENT '学习时长,单位秒',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `record_source` tinyint(1) DEFAULT NULL COMMENT '记录来源 1:PC 2:IOS 3:安卓 4:其他',
  `account_id` bigint(11) DEFAULT NULL COMMENT '账户ID',
  `account_item_id` bigint(11) DEFAULT NULL COMMENT ' 子账户ID,如果是课程对应的是t_product.product_id,如果是任务对应的是t_studytask_structure.id',
  `org_id` bigint(11) DEFAULT NULL COMMENT '机构id',
  `user_id` bigint(11) DEFAULT NULL COMMENT '用户ID',
  `service_id` bigint(11) DEFAULT NULL COMMENT '对应的服务ID',
  `knowledge_id` bigint(11) DEFAULT NULL COMMENT '知识点ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='学习时间记录表,每学习一次增加一条记录';

---默认学时学分为0
ALTER TABLE `t_course_service`
MODIFY COLUMN `class_hour`  decimal(5,2) NULL DEFAULT 0 COMMENT '学时' AFTER `course_code`,
MODIFY COLUMN `credit`  decimal(5,2) NULL DEFAULT 0 COMMENT '学分' AFTER `class_hour`;

ALTER TABLE `t_product`
MODIFY COLUMN `class_hour`  decimal(5,2) NULL DEFAULT 0 COMMENT '总学时' AFTER `product_code`,
MODIFY COLUMN `credit`  decimal(5,2) NULL DEFAULT 0 COMMENT '总学分' AFTER `class_hour`;

ALTER TABLE `t_studytask`
MODIFY COLUMN `total_hours`  decimal(10,2) NULL DEFAULT 0 COMMENT '总学时' AFTER `exam_count`,
MODIFY COLUMN `tatal_credits`  decimal(10,2) NULL DEFAULT 0 COMMENT '总学分' AFTER `total_hours`;


-- 首页栏目设置表
DROP TABLE IF EXISTS `t_column_config`;
CREATE TABLE `t_column_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `column_name` varchar(50) DEFAULT NULL COMMENT '栏目名称',
  `category_id` int(11) DEFAULT NULL COMMENT '课程分类id,dpt_product.db_product_category表的id',
  `org_id` int(11) DEFAULT NULL COMMENT '机构id',
  `column_type` int(1) DEFAULT NULL COMMENT '栏目类型 1-栏目1;2-栏目2',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator_id` int(11) DEFAULT NULL COMMENT '创建人Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `t_column_course`;
CREATE TABLE `t_column_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id',
  `column_id` int(11) DEFAULT NULL COMMENT '栏目id,外键，对应t_column_info表的id',
  `course_id` int(11) DEFAULT NULL COMMENT '课程id',
  `category_id` int(11) DEFAULT NULL COMMENT '课程分类id,dpt_product.db_product_category表的id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `creator_id` int(11) DEFAULT NULL COMMENT '创建人Id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- 首页栏目设置表结束

-- 课程笔记表
CREATE TABLE `t_course_note` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `text` varchar(5000) DEFAULT NULL COMMENT '笔记内容',
  `account_id` bigint(11) DEFAULT NULL COMMENT '账户Id',
  `account_item_id` bigint(11) DEFAULT NULL COMMENT '子账户Id',
  `knowledge_id` bigint(11) DEFAULT NULL COMMENT '知识点id',
  `service_id` bigint(11) DEFAULT NULL COMMENT '服务id',
  `org_id` bigint(11) DEFAULT NULL COMMENT '机构id',
  `create_user_id` bigint(11) DEFAULT NULL COMMENT '创建者id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='课程笔记';

-- 学员端首页教师排行中间表
CREATE TABLE `t_teacher_rankinglist` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `teacher_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `evaluation_num` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--学习中心学习里程碑表
CREATE TABLE `t_timeaxis` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL,
  `type` int(11) DEFAULT NULL COMMENT '1:普通课程学习  2：任务学习类的课程   3：课程服务类的课程   4：通过了考试   5：通过了培训  6：通过了认证',
  `action_id` bigint(20) DEFAULT NULL COMMENT '事件id',
  `action_name` varchar(1000) DEFAULT NULL COMMENT '事件名称',
  `action_time` datetime DEFAULT NULL COMMENT '事件时间',
  `score` double DEFAULT NULL COMMENT '获得学分',
  `status` int(11) DEFAULT NULL COMMENT '状态1有效0无效',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户id',
  `org_id` bigint(20) DEFAULT NULL COMMENT '机构id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

CREATE TABLE `t_teacher` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `teacher_code` varchar(20) DEFAULT NULL COMMENT '教师编号',
  `teacher_name` varchar(250) DEFAULT NULL COMMENT '教师姓名',
  `gender` int(1) DEFAULT NULL COMMENT '教师性别:1、男，2、女',
  `org_id` bigint(11) DEFAULT NULL COMMENT '织结构组',
  `description` varchar(500) DEFAULT NULL COMMENT '师教简介',
  `content` varchar(11000) DEFAULT NULL COMMENT '教师介绍',
  `status` int(2) DEFAULT NULL COMMENT '教师状态 1:待启用 2:有效 3无效 4新建',
  `photo_url` varchar(500) DEFAULT NULL COMMENT '存储教师图片路径只存储url',
  `create_user` bigint(11) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='教师信息';




-----导数据相关
ALTER TABLE `t_studytask`
ADD COLUMN `old_key_id`  bigint NULL COMMENT '旧数据主键Id' AFTER `pic_url`;

ALTER TABLE `t_studytask_structure`
ADD COLUMN `old_key_id`  varchar(64) NULL COMMENT '旧数据的id，可能是stage_studytask的id或者stage_course的id' AFTER `finish_knowledge_count`;

ALTER TABLE `t_studytask_user`
ADD COLUMN `old_key_id`  varchar(64) NULL COMMENT '旧数据的主键Id' AFTER `update_user_id`;

ALTER TABLE `t_teacherproductevaluation`
ADD COLUMN `old_key_id`  varchar(64) NULL COMMENT '旧数据主键id' AFTER `scoresum`;



ALTER TABLE t_resource  ADD COLUMN  old_id   INT(11) NULL  COMMENT '旧的资源id';  
ALTER TABLE t_product  ADD COLUMN  old_code   INT(11) NULL  COMMENT '旧的产品id'; 
ALTER TABLE t_course_service_structure ADD COLUMN old_code  BIGINT (11) NULL  COMMENT '旧的产品id'; 
ALTER TABLE t_course_service_structure ADD COLUMN old_codek BIGINT(11) NULL COMMENT '旧的知识点';
ALTER TABLE t_course_service_structure ADD COLUMN old_codec  BIGINT(11) NULL  COMMENT '旧的课程';
ALTER TABLE t_course_service ADD COLUMN old_code BIGINT(11) NULL  COMMENT '旧的课程id'; 
ALTER TABLE t_exam_service  ADD COLUMN  old_code   BIGINT(11) NULL  COMMENT '旧的考试id';
ALTER TABLE t_knowledge  ADD COLUMN  old_code   INT(11) NULL  COMMENT '旧的课程知识点';
ALTER TABLE t_knowledge  ADD COLUMN  old_codee   INT(11) NULL  COMMENT '旧的考试服务';


ALTER TABLE elp_product.t_course_resouce  ADD COLUMN  old_id   INT(11) NULL COMMENT '旧的课程资源id';   --  旧的课程资源id
ALTER TABLE elp_product.t_resource  ADD COLUMN  old_base_id   INT(11) NULL COMMENT '旧的资源id';   --  旧的资源id 
-- ALTER TABLE elp_product.t_resource  ADD COLUMN  old_kr_id   INT(11) NULL COMMENT '旧的知识点附件资源id';   --  旧的知识点附件资源id
-- ALTER TABLE elp_product.t_knowledge_resource   ADD COLUMN  old_id   INT(11) NULL COMMENT '旧的知识点附件资源id';   --  旧的知识点附件资源id
ALTER TABLE elp_product.t_category  ADD COLUMN  old_id   INT(11) NULL COMMENT '旧的知识点附件资源id';   --  旧的知识点附件资源id
ALTER TABLE elp_product.t_course_teacher  ADD COLUMN  old_id   INT(11) NULL COMMENT '旧的课程老师id';   --  旧的课程老师id
ALTER TABLE elp_product.t_teacher  ADD COLUMN  old_id   INT(11) NULL COMMENT '旧的老师id';   --  旧的老师id






