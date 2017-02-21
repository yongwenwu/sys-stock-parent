<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="context" uri="/WEB-INF/tag/context.tld"%>
<%
String contextPath = request.getContextPath();
%>
<%-- jquery库 --%>
<script type="text/javascript" src="<context:context/>/js/jquery.min.js"></script>


<%-- 判断浏览器类型（使用jquery插件报错：$.browser is undefined的解决方法） --%>
<script type="text/javascript" >
$.browser = {};
$.browser.mozilla = /firefox/.test(navigator.userAgent.toLowerCase());
$.browser.webkit = /webkit/.test(navigator.userAgent.toLowerCase());
$.browser.opera = /opera/.test(navigator.userAgent.toLowerCase());
$.browser.msie = /msie/.test(navigator.userAgent.toLowerCase());
</script>


<%-- 引用系统共用方法 --%>
<script type="text/javascript" src="<context:context/>/js/common/system.js"></script>
<script type="text/javascript" src="<context:context/>/js/common/tools.js"></script>
<script type="text/javascript" src="<context:context/>/js/common/elp.js"></script>

<%--  引用bootstrap、bootstrap-table --%>
<script type="text/javascript" src="<context:context/>/js/bootstrap/bootstrap-table/bootstrap.min.js"></script>
<script type="text/javascript" src="<context:context/>/js/bootstrap/bootstrap-table/bootstrap-table.js"></script>
<script type="text/javascript" src="<context:context/>/js/bootstrap/bootstrap-table/bootstrap-table-zh-CN.js"></script>
<link rel="stylesheet" type="text/css" href="<context:context/>/js/bootstrap/bootstrap-table/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="<context:context/>/js/bootstrap/bootstrap-table/css/bootstrap-table.css" />

<%-- 引用JBOX通用UI组件 --%>
<script type="text/javascript" src="<context:context/>/js/jbox-v2.3/jBox/jquery.jBox-2.3.min.js"></script>
<script type="text/javascript" src="<context:context/>/js/jbox-v2.3/jBox/i18n/jquery.jBox-zh-CN.js"></script>
<link rel="stylesheet" type="text/css" href="<context:context/>/js/jbox-v2.3/jBox/Skins/Blue/jbox.css" />



<script type="text/javascript">
var contextPath = "<%=contextPath%>";
var systemImagePath = "<context:context/>/images/";
var xparent;
if(window.dialogArguments){
	xparent = window.dialogArguments;
}else if(window.opener){
	xparent = opener;
}else{
	xparent = window;
}

</script>