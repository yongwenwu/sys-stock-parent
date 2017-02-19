<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
<title>库存商品管理系统</title>
<link rel="stylesheet" type="text/css" href="<context:context/>/css/reset.css" />
<link rel="stylesheet" type="text/css" href="<context:context/>/css/default.css" id="cssfile" />
</head>
<body onload="showDT();" style="overflow: hidden;">
	<%-- <%@ include file="/WEB-INF/jsp/common/home/head.jsp" %>  --%>
	<%-- <c:import url="<context:context/>/head.do" /> --%>
	<jsp:include page="/home/head.do"></jsp:include>
	<div class="default-main-layout indexleft">
		<ul class="navigationleft">
			<li>
				<p>
					<a href="javascript:void(0)"><i class="pic_dnzt_hui"></i>基础信息管理<span class="updown"></span></a>
				</p>
				<ol class="nextol">
					<!-- <li><a href="javascript:void(0)">客户信息管理管理</a></li> -->
					<li><a href="javascript:void(0)" onclick="gotoPage('/manage/product/productManage.do');">商品信息管理</a></li>
					<!-- <li><a href="javascript:void(0)">供应商管理</a></li> -->
					<li><a href="javascript:void(0)" onclick="gotoPage('/manage/warehouse/warehouseManage.do');">仓库信息管理</a></li>
				</ol>
			</li>
			<li>
				<p>
					<a href="javascript:void(0)"><i class="pic_dnzt_hui"></i>仓库管理<span class="updown"></span></a>
				</p>
				<ol class="nextol">
					<li><a href="javascript:void(0)" onclick="openOrder('/manage/order/receiveOrder.do','1');" >商品入库</a></li>
					<li><a href="javascript:void(0)" onclick="openOrder('/manage/order/sendOrder.do','2');" >商品出库</a></li>
				</ol>
			</li>
			<li>
				<p>
					<a href="javascript:void(0)"><i class="pic_dnzt_hui"></i>库存管理<span class="updown"></span></a>
				</p>
				<ol class="nextol">
					<!-- <li><a href="javascript:void(0)">库存盘点</a></li> -->
					<li><a href="javascript:void(0)" onclick="gotoPage('/manage/checkStock/checkStockManage.do');" >库存查询</a></li>
					<li><a href="javascript:void(0)" onclick="gotoPage('/manage/checkStock/stockOrderManage.do');" >库存进出明细</a></li>
				</ol>
			</li>
			<%-- 
			<li>
				<p>
					<a href="javascript:void(0)"><i class="pic_yygl_hui"></i>采购管理<span class="updown"></span></a>
				</p>
				<ol class="nextol">
					<li><a href="javascript:void(0)">进货单管理</a></li>
					<li><a href="javascript:void(0)">进货入库</a></li>
					<li><a href="javascript:void(0)">退货出库</a></li>
				</ol>
			</li>
			 --%>
			<li>
				<p>
					<a href="javascript:void(0)"><i class="pic_jsgl_hui"></i>查询统计<span class="updown"></span></a>
				</p>
				<ol class="nextol">
					<!-- <li><a href="javascript:void(0)">客户查询</a></li> -->
					<li><a href="javascript:void(0)" onclick="gotoPage('/manage/queryStatistics/queryProductManage.do');" >商品查询</a></li>
					<li><a href="javascript:void(0)" onclick="gotoPage('/manage/user/toUpdateOeselfInfo.do');" >修改个人信息</a></li>
					<li><a href="javascript:void(0)" onclick="gotoPage('/manage/user/toUpdatePassword.do');" >修改密码</a></li>
					<!-- <li><a href="javascript:void(0)">供应商查询</a></li> -->
					<!-- <li><a href="javascript:void(0)">入库查询</a></li> -->
					<!-- <li><a href="javascript:void(0)">入库退货查询</a></li> -->
				</ol>
			</li>
			<c:if test="${user.userType == 1 or user.userType == 2}">
				<li>
				<p>
					<a href="javascript:void(0)"><i class="pic_clsz_hui"></i>系统管理<span class="updown"></span></a>
				</p>
				<ol class="nextol">
					<li><a href="javascript:void(0)" onclick="gotoPage('/manage/dept/deptManage.do');" >部门管理</a></li>
					<li><a href="javascript:void(0)" onclick="gotoPage('/manage/user/userManage.do');" >用户管理</a></li>
					<li><a href="javascript:void(0)" onclick="gotoPage('/manage/dept/deptManage.do');" >角色管理</a></li>
					<!-- <li><a href="javascript:void(0)" onclick="gotoPage('/manage/dept/deptManage.do');" >用户权限管理</a></li> -->
				</ol>
			</li>
			</c:if>
			
		</ul>
	</div>
	<div class="default-main-layout indexcon">
		<iframe name="indexiframe" id="indexiframe" class="indexiframe" frameborder=0 src="<context:context/>/home/right.do"></iframe>
	</div>
</body>
<script src="<context:context/>/js/new_index.js"></script>
<script type="text/javascript">
function gotoPage(url){
	if(url){
		url = "<context:context/>" + url
		$("#indexiframe").attr("src", url);
	}
}

function openOrder(actionUrl,type){
	var title = "";
	if(type == 1){
		title = "入库单";
	}else if(type == 1){
		title = "出库单";
	}
	openFullDialog(actionUrl, title)
}


</script>
</html>