<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/jsp/common/common.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<LINK href="<context:context/>/images/login/User_Login.css" type=text/css rel=stylesheet />
<script type="text/javascript">
	function login1() {
		location.href = "<context:context/>/home/home.do";
	}
	function checkForm() {
		if (!$("#userId").val()) {
			$("#remindStr").text("请输入用户名！");
			$("#userId").focus();
			return ;
		}
		/* 
		if (!$("#password").val()) {
			$("#remindStr").text("请输入密码！");
			$("#password").focus();
			return ;
		}
		 */
		return true;
	}

	function login() {
		if (checkForm()) {
			//$("#form1").submit();
			var url = "<context:context/>/home/login.do";
			var param = tools.formToJson($("#form1"));
			var json = tools.requestJsonRs(url, param);
			if (json.status == 1) {
				if(json.data.loginStatus == 1){
					location.href = "<context:context/>/home/home.do";
				}else if(json.data.loginStatus == 2){
					$("#remindStr").text("请输入用户名！");
				}else if(json.data.loginStatus == 3){
					$("#remindStr").text("请输入密码！");
				}else if(json.data.loginStatus == 4){
					$("#remindStr").text("用户名或密码错误！");
				}
				
			} else {
				top.$.jBox.tip(json.msg, "error");
			}
			 
		}

	}
</script>
</head>
<BODY id=userlogin_body>
	<form action="<context:context/>/login.do" id="form1" name="form1" method="post"  onsubmit="return false"  >
		<DIV></DIV>

		<DIV id=user_login>
			<DL>
				<DD id=user_top>
					<UL>
						<LI class=user_top_l></LI>
						<LI class=user_top_c></LI>
						<LI class=user_top_r></LI>
					</UL>
				<DD id=user_main>
					<UL>
						<LI class=user_main_l></LI>
						<LI class=user_main_c>
							<DIV class=user_main_box style="padding-top: 13px;">
								<UL>
									<LI class=user_main_text>用户名：</LI>
									<LI class=user_main_input><INPUT class="TxtUserNameCssClass" id="userId" name="userId" maxLength="20"></LI>
								</UL>
								<UL>
									<LI class=user_main_text>密 码：</LI>
									<LI class=user_main_input><INPUT class="TxtPasswordCssClass" id="password" type="password" name="password" maxlength="40"></LI>
								</UL>
							<UL>
							</UL>
							<span> <font color="red" id="remindStr" ></font> </span>
								<%-- 
							<UL>
								<LI class=user_main_text>Cookie：</LI>
								<LI class=user_main_input><SELECT id=DropExpiration name=DropExpiration>
										<OPTION value=None selected>不保存</OPTION>
										<OPTION value=Day>保存一天</OPTION>
										<OPTION value=Month>保存一月</OPTION>
										<OPTION value=Year>保存一年</OPTION>
								</SELECT></LI>
							</UL>
							 --%>
							</DIV>
						</LI>
						<LI class=user_main_r>
							<INPUT class=IbtnEnterCssClass id="IbtnEnter"
							style="BORDER-TOP-WIDTH: 0px; BORDER-LEFT-WIDTH: 0px; BORDER-BOTTOM-WIDTH: 0px; BORDER-RIGHT-WIDTH: 0px" onclick='login();' type="image"
							src="<context:context/>/images/login/user_botton.gif" name="IbtnEnter">
						</LI>
					</UL>
				<DD id=user_bottom>
					<UL>
						<LI class=user_bottom_l></LI>
						<LI class=user_bottom_c><SPAN style="MARGIN-TOP: 40px"> </SPAN></LI>
						<LI class=user_bottom_r></LI>
					</UL>
				</DD>
			</DL>
		</DIV>

		<DIV></DIV>

	</form>
</BODY>
</html>