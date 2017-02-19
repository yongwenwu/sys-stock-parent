var days=new  Array ("日", "一", "二", "三", "四", "五", "六");
function showDT() {
	var currentDT = new Date();
	var y,m,date,day,hs,ms,ss,theDateStr;
	y = currentDT.getFullYear(); //四位整数表示的年份
	if(y<1900) y = y+1900;
	m = currentDT.getMonth()+1; //月
	if(m<10) m = '0' + m;
	date = currentDT.getDate(); //日
	if(date<10) date = '0' + date;
//day = currentDT.getDay(); //星期  
	hs = currentDT.getHours(); //时
	if(hs<10) hs = '0' + hs;
	ms = currentDT.getMinutes(); //分
	if(ms<10) ms = '0' + ms;
	ss = currentDT.getSeconds(); //秒
	if(ss<10) ss = '0' + ss;
	theDateStr = y+"/"+  m +"/"+date+"/"+" "+hs+":"+ms+":"+ss;
//document.getElementById("timeclick"). innerHTML =theDateStr;  
	$(".timeclick").text(theDateStr)
	// setTimeout 在执行时,是在载入后延迟指定时间后,去执行一次表达式,仅执行一次
	window.setTimeout( showDT, 1000);
}
 $(".navigationleft li p").click(function(){
    if($(this).find(".updown").hasClass("on")){
        $(this).find(".updown").removeClass("on");
    }else{
        $(this).find(".updown").addClass("on").parents().siblings().find(".updown").removeClass("on");
    }
    if($(this).find("i").hasClass("on")){
        $(this).find("i").removeClass("on");
    }else{
        $(this).find("i").addClass("on").parents().siblings().find("i").removeClass("on");
    }
    if($(this).parent().hasClass("on")){
    	 $(this).parent().removeClass("on");
    }else{
        $(this).parent().addClass("on").siblings().removeClass("on");
    }
    $(this).find("a").addClass("on").parents("li").siblings().find("a").removeClass("on");
     $(this).next().slideToggle().parent().siblings().find("ol").slideUp();
     $(this).parent().siblings().find(".updown").removeClass("on").parents("p").next().slideUp();
});
$(".nextol li a").click(function(){
        $(this).addClass("on").parent().siblings().find("a").removeClass("on");
});
   $("#shopSpan").click(function(){
	$(".xzdp").css({"width":($(this).outerWidth())+ "px"});
	$(".triangle4").css({"left":($(this).outerWidth()/2)+ "px"})
	$(".xzdp").slideToggle();
});
$(".xzdp li").click(function(){
	$(this).addClass("on").siblings().removeClass("on");
});
$(".numtel").mouseover(function(){
	$(".triangle1").css({"left":($(".information").outerWidth()/2-14)+"px"})
	$(".information").show();
});
$(".numtel").mouseleave(function(){
	$(".information").hide();
})
$(".okclick").mouseover(function(){
	$(".dem").show();
	$(".triangle1").css({"left":($(".dem").outerWidth()/2-14)+"px"})
});
$(".okclick").mouseleave(function(){
	$(".dem").hide();
});
$(".closeshop").mouseover(function(){
	$(".ztjl").show();
	$(".triangle1").css({"left":($(".ztjl").outerWidth()/2 -12)+ "px"})
})
$(".closeshop").mouseleave(function(){
	$(".ztjl").hide();
});
$(".yf").click(function(e){
	e.stopPropagation();
	$(".skin").removeClass("on");
});
$(document).click(function(){
	if(!$(".skin").hasClass("on")){
		$(".skin").addClass("on");
	}
	if(!$(".shop").hasClass("on")){
		$(".shop").addClass("on");
	}
});
var  iframe = document.getElementById('indexiframe');
if(iframe.contentWindow)
{
	iframe.contentWindow.document.onclick=function(){
		if(!$(".skin").hasClass("on")){
			$(".skin").addClass("on");
		}
		if(!$(".shop").hasClass("on")){
			$(".shop").addClass("on");
		}
	}
}else  if(iframe.contentDocument)
{

	iframe.contentDocument.onclick=function(){

		if(!$(".skin").hasClass("on")){
			$(".skin").addClass("on");
		}
		if(!$(".shop").hasClass("on")){
			$(".shop").addClass("on");
		}
	}

}
var expiresDate= new Date();
expiresDate.setTime(expiresDate.getTime() + (60 * 60 * 1000));

/*cookie 储存样式皮肤*/
function initStyle(myStyle){
	var $span =$(".skin span");
	$span.click(function(){
		switchSkin(this.id ,1);
		$(".skin").hasClass("on");
	});

	var cookie_skin =  $.cookie( "MyCssSkin"); ;
	if(!cookie_skin){
		cookie_skin =	myStyle
	}
	if (cookie_skin) {
		switchSkin( cookie_skin,0 );
	}
};
function switchSkin(skinName,isFirst){
	$("#"+skinName).addClass("selected").siblings().removeClass("selected"); //去掉其它同辈元素的选中
	$("#cssfile").attr("href", "css/" + skinName + ".css"); //设置不同皮肤
	$.cookie( "MyCssSkin" , skinName , { path: '/', expires:expiresDate });
	
}
