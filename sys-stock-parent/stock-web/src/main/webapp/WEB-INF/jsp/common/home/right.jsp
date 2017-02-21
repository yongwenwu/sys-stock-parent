<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="context" uri="/WEB-INF/tag/context.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页展示</title>
<link rel="stylesheet" type="text/css" href="<context:context/>/css/reset.css" />
<link rel="stylesheet" type="text/css" href="<context:context/>/css/state.css"/>
</head>
<body>
		<div class="wrap">
			<ul class="cont">
				<li>
					<a href="javascript:void(0)"><div class="shoppic"><img src="<context:context/>/images/pic_dnzt.png"></div>
					<p>店内状态</p>
					</a>
				</li>
				<li>
					<a href="javascript:void(0)"><div class="shoppic"><img src="<context:context/>/images/pic_khyy.png"></div>
					<p>客户预约</p>
					</a>
				</li>
				<li>
					<a href="javascript:void(0)"><div class="shoppic"><img src="<context:context/>/images/pic_yyjl.png"></div>
					<p>预约记录</p>
					</a>
				</li>
				<li>
					<a href="javascript:void(0)"><div class="shoppic"><img src="<context:context/>/images/pic_dqpx.png"></div>
					<p>当前排序</p>
					</a>
				</li>
				<li>
					<a href="javascript:void(0)"><div class="shoppic"><img src="<context:context/>/images/pic_hyzl.png"></div>
					<p>会员资料</p>
					</a>
				</li>
				<li>
					<a href="javascript:void(0)"><div class="shoppic"><img src="<context:context/>/images/pic_hyzl.png"></div>
					<p>开卡续费</p>
					</a>
				</li>
				<li>
					<a href="javascript:void(0)"><div class="shoppic"><img src="<context:context/>/images/pic_yyls.png"></div>
					<p>营业流水</p>
					</a>
				</li>
				<li>
					<a href="javascript:void(0)"><div class="shoppic"><img src="<context:context/>/images/pic_bzjls.png"></div>
					<p>保证金流水</p>
					</a>
				</li>
				<li>
					<a href="javascript:void(0)"><div class="shoppic"><img src="<context:context/>/images/pic_xxtzgl.png"></div>
					<p>消息通知管理</p>
					</a>
				</li>
				<li>
					<a href="javascript:void(0)"><div class="shoppic"><img src="<context:context/>/images/pic_hyzl.png"></div>
					<p>APP会员绑定</p>
					</a>
				</li>
				<li>
					<a href="javascript:void(0)"><div class="shoppic"><img src="<context:context/>/images/pic_yggzqd.png"></div>
					<p>员工工作清单</p>
					</a>
				</li>
				<li>
					<a href="javascript:void(0)"><div class="shoppic"><img src="<context:context/>/images/pic_khlytj.png"></div>
					<p>客户来源统计</p>
					</a>
				</li>
				<li>
					<a href="javascript:void(0)"><div class="shoppic"><img src="<context:context/>/images/pic_hykdxfmx.png"></div>
					<p>会员跨店消费明细</p>
					</a>
				</li>
				<li>
					<a href="javascript:void(0)"><div class="shoppic"><img src="<context:context/>/images/pic_bzjcz.png"></div>
					<p>保证金充值</p>
					</a>
				</li>
				<li>
					<a href="javascript:void(0)"><div class="shoppic"><img src="<context:context/>/images/pic_bzjtx.png"></div>
					<p>保证金提现</p>
					</a>
				</li>
			</ul>
		</div>
	</body>
	<script src="js/jquery.min.js"></script>
	<script>
		var arry=new Array();
		arry = ['#d9edf7','#f2dede','#dff0d8','#fcf8e3','#eeeef2','#eeeef2','#fcf8e3','#f2dede','#d9edf7','#d5f2ef','#d9edf7','#f2dede','#dff0d8','#fcf8e3','#eeeef2'];
		arryone = ["#5096b6",'#ef847f','#64b881','#f0c682','#a39b9b','#a39b9b','#efc27a','#ef847f','#5096b6','#42c1ba','#5096b6','#ef847f','#64b881','#efc27a','#a39b9b']
		var myli =$(".cont li");
		var mytext = $(".cont li p");
		myli.each(
			function(){
				for(var i=0;i<arry.length;i++) {
				myli.eq(i).css("background",arry[i]);
				}
				for (var j=0;j<arryone.length;j++) {
				mytext.eq(j).css("color",arryone[j]);	
				}
			}
		)
	</script>
</html>