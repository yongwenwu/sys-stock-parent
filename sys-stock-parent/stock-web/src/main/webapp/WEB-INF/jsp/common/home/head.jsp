<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/common.jsp" %>
<script type="text/javascript">
function logout(){
	location.href = "<context:context/>/home/logout.do";
}
</script>
<div class="default-main-layout indextop">
		<div class="titletext">
			<span class="lltitle"></span>库存商品管理系统
		</div>
		<ul class="logoul">
			<li>
				<span class="numtel"><div class="userpic">
						<img src="<context:context/>/images/default.jpg">
					</div>${user.userId }张三
				</span>
				<p class="information">
					<i class="triangle1"></i> <i class="changeskin">用户</i> <span>姓名：<i id="user_name">${user.trueName }</i></span><br /> <span>岗位：<i id="user_position">${user.position }</i></span>
				</p>
			</li>
			<li class="okclick"><span class="click" title="时间"></span>
				<div class="dem">
					<i class="triangle1"></i> <i class="changeskin">时间</i>
					<p class="timeclick"></p>
				</div></li>
			<li><span class="cancellation" title="注销" onclick="logout();" ></span></li>
		</ul>

	</div>