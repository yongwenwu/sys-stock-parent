// 封装常用的方法
//封装ajax请求，统一处理请求失败、网络异常等情况
elpAjax=function(opt){
	
	$.ajax({
		url			: opt.url,
		type		: opt.type,
		dataType 	: opt.dataType,
		data		: opt.data,
		async		: opt.async,
		success		: function(data){
			//2 表示服务器返回状态为失败
			if(data.status == 2){
				alert(data.msg);
			}else{
				opt.success(data);
			}
		},
	    error		: function(XMLHttpRequest, textStatus, errorThrown) {
	    	
	    	var sessionStatus = XMLHttpRequest.getResponseHeader('sessionstatus');
			if (sessionStatus == 'timeout') {
				var top = window;
				var url = top.location.href;
				while (top != top.parent) {
					top = top.parent;
				}
				
				var yes = confirm('由于您长时间没有操作,请重新登录.');
				if (yes) {
					logoutnow();
				}
			}else{
				//alert(textStatus);
			}
	    }
	});    	
}

