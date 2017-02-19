/**
 * 系统共用方法
 */

/**
 * bsWindow("http://www.baidu.com","标题",{buttons:[{name:"关闭",classStyle:"1"},{name:"开始",classStyle:"2"}]});
 * 
 * @param url
 * @param title
 * @param opts
 * @return
 */
function bsWindow(url, title, opts) {
	if (!opts) {
		opts = {};
	}
	var width = opts.width || $(document).width() - 100;
	var height = opts.height || $(document).height() - 250;
	width += "";
	height += "";
	if (width.indexOf("%") != -1) {
		width = width.replace("%", "");
		width = $(document).width() * (parseInt(width) * 0.01);
	}
	if (height.indexOf("%") != -1) {
		height = height.replace("%", "");
		height = parseInt(document.documentElement.clientHeight)
				* (parseInt(height) * 0.01);
	}

	if (!window.BSWINDOW) {
		window.BSWINDOW = $("<div class=\"modal fade\" tabindex=\"-1\" role=\"dialog\" aria-labelledby=\"myModalLabel\" aria-hidden=\"true\" style=\"\"></div>");
		window.BSWINDOW_BS1 = $("<div class=\"modal-dialog\"></div>");
		window.BSWINDOW_BS2 = $("<div class=\"modal-content\"></div>");
		window.BSWINDOW_BS3 = $("<div class=\"modal-header\"></div>");
		window.BSWINDOW_BS4 = $("<button type=\"button\" class=\"close\" data-dismiss=\"modal\" aria-hidden=\"true\">&times;</button>");
		window.BSWINDOW_BS5 = $("<h4 class=\"modal-title\" style=\"font-size:18px;font-family:微软雅黑\" id=\"myModalLabel\"></h4>");
		window.BSWINDOW_BS6 = $("<div class=\"modal-body\" style=\"padding-top:0px;padding-bottom:0px;padding-top:3px;\"><center><img src=\""
				+ systemImagePath + "/other/loading1.gif\" /></center></div>");
		if (url.indexOf("html:") != -1) {// 加载html
			window.BSWINDOW_BS7 = $("<div></div>").append(url.substring(5));
		} else {
			window.BSWINDOW_BS7 = $("<iframe frameborder=0 style=\"width:100%;height:100%\"></iframe>");
		}
		window.BSWINDOW_BS8 = $("<div class=\"modal-footer\" style=\"padding-top:3px;\"></div>");

		window.BSWINDOW.append(window.BSWINDOW_BS1);
		window.BSWINDOW_BS1.append(window.BSWINDOW_BS2);
		window.BSWINDOW_BS2.append(window.BSWINDOW_BS3);
		window.BSWINDOW_BS3.append(window.BSWINDOW_BS4).append(
				window.BSWINDOW_BS5);
		window.BSWINDOW_BS2.append(window.BSWINDOW_BS6);
		window.BSWINDOW_BS6.append(window.BSWINDOW_BS7);
		window.BSWINDOW_BS2.append(window.BSWINDOW_BS8);

		$("body").append(window.BSWINDOW);
	} else {
		window.BSWINDOW_BS7.remove();
		window.BSWINDOW_BS7 = $("<iframe frameborder=0 style=\"width:100%;height:100%\"></iframe>");
		window.BSWINDOW_BS6.append(window.BSWINDOW_BS7);
	}
	window.BSWINDOW_BS7.attr("src", "").hide();
	window.BSWINDOW_BS6.find("img:first").show();
	// 渲染标题
	window.BSWINDOW_BS5.html(title);
	window.BSWINDOW_BS1.css({
		"width" : width
	});
	window.BSWINDOW_BS6.css({
		"height" : height
	});
	setTimeout(function() {
		window.BSWINDOW_BS6.find("img:first").hide();
		window.BSWINDOW_BS7.attr("src", url).show();
	}, 1000);
	window.BSWINDOW_BS8.html("");

	// 渲染按钮
	if (opts.buttons) {
		for (var i = 0; i < opts.buttons.length; i++) {
			var button = opts.buttons[i];
			var classStyle = button.classStyle || "btn btn-default";
			var name = button.name;
			var btn = $("<button class=\"" + classStyle + "\">" + name
					+ "</button>");
			btn.click(function() {
				if (opts.submit) {
					if (opts.submit($(this).html(), window.BSWINDOW_BS7)) {
						window.BSWINDOW.modal("hide");
					}
				}
			});
			btn.appendTo(window.BSWINDOW_BS8);
		}
	} else {
		var close = $(
				"<button class=\"btn btn-default\"  data-dismiss=\"modal\">关闭</button>")
				.appendTo(window.BSWINDOW_BS8);
		var ok = $("<button class=\"btn btn-primary\">确定</button>").click(
				function() {
					if (opts.submit) {
						if (opts.submit("ok", window.BSWINDOW_BS7)) {
							window.BSWINDOW.modal("hide");
						}
					} else {
						window.BSWINDOW.modal("hide");
					}
				}).appendTo(window.BSWINDOW_BS8);

	}

	window.BSWINDOW.modal("show");
}

/**
 * 全屏幕打开窗口
 * 
 * @param actionUrl
 * @param title
 * @returns
 */
function openFullWindow(actionUrl, title) {
	var winParam = "menubar=0,toolbar=0,status=0";
	winParam += ",scrollbars=1,resizable=1";
	var left = 0;
	var top = 0;
	var width = window.screen.availWidth;
	var height = window.screen.availHeight;
	// if($.browser.webkit){
	// height = parseInt(height)-60;
	// }
	height = parseInt(height) - 80;
	winParam += ",width=" + width;
	winParam += ",height=" + height;
	winParam += ",top=" + top;
	winParam += ",left=" + left;
	winParam += ",location=no";

	if (window.external && window.external.IM_OA) {
		window.external.IM_OpenNavigation(title, actionUrl.replace(contextPath,
				""), 0, 0);
		return;
	}

	return window.open(actionUrl, new Date().getTime() + "", winParam);
}

/**
 * 模态窗口（全屏）
 * 
 * @param actionUrl
 * @param title
 * @returns
 */
function openFullDialog(actionUrl, title) {
	var winParam = "menubar=0,toolbar=0,status=0";
	winParam += ",scrollbars=1,resizable=1";
	var left = 0;
	var top = 0;
	var width = window.screen.availWidth;
	var height = window.screen.availHeight;
	// if($.browser.webkit){
	// height = parseInt(height)-60;
	// }
	height = parseInt(height) - 80;
	var width = window.screen.availWidth;
	var height = window.screen.availHeight;
	var attrs = null;

	attrs = "status:no;directories:yes;scroll:yes;Resizable=no;";
	attrs += "dialogWidth:" + width + "px;";
	attrs += "dialogHeight:" + height + "px;";
	attrs += "dialogLeft:" + left + "px;";
	attrs += "dialogTop:" + top + "px;";
	return window.showModalDialog(actionUrl, self, attrs);
}

/**
 * 读取cookie
 * 
 * @param name
 *            名称
 */
function getCookie(name) {
	var arr = document.cookie
			.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
	if (arr != null) {
		return unescape(arr[2]);
	} else {
		return null;
	}
	return null;
}

/**
 * 设置cookie
 * 
 * @param name
 *            名称
 * @param value
 *            值
 * @param Days
 *            时间
 */
function setCookie(name, value, Days) {
	var exp = new Date();
	exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);// 天数
	document.cookie = name + "=" + escape(value) + ";path=/;expires="
			+ exp.toGMTString();
}

/**
 * 消息提示
 * 
 * @param msrg
 * @param cntrlId
 *            绑定消息的控件
 * @param type
 *            消息类型[info|error||warning|forbidden|stop|blank] 默认为info
 * @param width
 *            宽度
 * @return
 */
function messageMsg(msrg, cntrlId, type, width) {
	if (!width) {
		width = 320;
	}
	var msrgDom = "<table class=\"MessageBox\" align=\"center\"  style=\"width:"
			+ width + "px\">";
	if (!type) {
		type = "info";
	}
	msrgDom += " <tr>  <td class=\"msg " + type + "\">";
	msrgDom += "<div class=\"\" style=\"\">" + msrg + "</div>"
			+ " </td> </tr> </table>";
	$("#" + cntrlId).html(msrgDom);
}

/**
 * 显示加载中
 * 
 * @param container
 */
function startLoading(container) {
	var loadingPic = $("<center><img style='margin-top:40px;' src='"
			+ systemImagePath + "/other/loading1.gif' /></center>");
	$(container).append(loadingPic);
}
/**
 * 取消加载中
 * 
 * @param container
 */
function endLoading(container) {
	$(container).html("");
}

/**
 * 转换日期字符串
 * 
 * @param time
 *            时间戳 --时间为空则为系统当前时间
 * @param format
 *            日期转换格式
 */
function getFormatDateStr(time, format) {
	var timeStr = "";
	if (time) {
		var timeDate = new Date(parseInt(time, 10));
		timeStr = new Date(timeDate).pattern(format);
	} else {
		timeStr = new Date(new Date()).pattern(format);
	}
	return timeStr;
}

/**
 * 转换日期字符串
 * 
 * @param time
 *            时间戳
 * @param format
 *            日期转换格式
 */
function getFormatDateTimeStr(time, format) {
	var timeStr = "";
	if (time) {
		var timeDate = new Date(parseInt(time, 10));
		timeStr = new Date(timeDate).pattern(format);
	} else {
		// timeStr = new Date(new Date()).pattern(format);
	}
	return timeStr;
}

/**
 * 是否是有效的文件文件名 特殊字符串
 * 
 * @param str
 * @returns 存在特殊字符返回true
 */
function isValidateFilePath(str) {
	var re = /["\/\\:*?"<>|]/;
	return str.match(re);
}

/**
 * Select 生成 option方便方法
 * 
 * 
 */
function setOptions(el, aOption, value) {
	for (var i = 0; i < aOption.length; i++) {
		var _option = document.createElement("option");
		_option.value = aOption[i].value;
		if (aOption[i].value == value) {
			_option.selected = true;
		}
		_option.appendChild(document.createTextNode(aOption[i].text));
		el.appendChild(_option);
	}

}

/**
 * 判断是否是数据类型，包括小数点
 * 
 * 
 */
function isNumber(aValue) {
	if (aValue == null) {
		return false;
	}
	var reg = /^([+-]?)\d*\.?\d+$/;
	return reg.test(aValue);
}
/**
 * 判断是否是整数
 * 
 * 
 */
function isInteger(aValue) {
	if (aValue == null) {
		return false;
	}
	var reg = /^[-+]?[1-9][0-9]*$/;
	return reg.test(aValue);
}

/**
 * 判断是否是整数+ 0
 * 
 * 
 */
function isIntegeOrZero(aValue) {
	if (aValue == null) {
		return false;
	}
	var reg = /^\d+$/;
	return reg.test(aValue);
}
/**
 * 判断是否是正整数
 */
function isPositivInteger(aValue) {
	if (aValue == null) {
		return false;
	}
	var reg = /^[1-9][0-9]*$/;
	return reg.test(aValue);
}

/**
 * 判断日期是否有效
 */
function isValidDate(year, month, day) {
	// alert(year + " " + month + " " + day);
	return isValidDateStr(year + "-" + month + "-" + day);
}

/**
 * 判断是否为合法的日期串
 * 
 * 
 * 
 * @str 日期串
 * 
 * 
 */
function isValidDateStr(str) {
	if (!str) {
		return;
	}
	var r = str.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);
	if (r == null) {
		return false;
	}
	if (parseInt(r[1]) > 9999 || parseInt(r[1]) < 1753) {
		return false;
	}
	var d = new Date(r[1], r[3] - 1, r[4]);
	return (d.getFullYear() == r[1] && (d.getMonth() + 1) == r[3] && d
			.getDate() == r[4]);
}

/**
 * 判断是否为合法的时间串
 * 
 * 
 * @param str
 * @return
 */
function isValidTimeStr(str) {
	if (!str) {
		return;
	}
	var r = str.match(/^(\d{1,2}):(\d{1,2}):(\d{1,2})$/);
	if (r == null) {
		return false;
	}
	if (parseInt(r[1]) > 59 || parseInt(r[1]) < 0) {
		return false;
	}
	if (parseInt(r[2]) > 59 || parseInt(r[2]) < 0) {
		return false;
	}
	if (parseInt(r[3]) > 59 || parseInt(r[3]) < 0) {
		return false;
	}
	return true;
}

/**
 * 判断是否为合法的日期时间串
 * 
 * 
 * @param str
 * @return
 */
function isValidateTimeStr(str) {
	if (!str) {
		return;
	}
	var r = str
			.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})\s(\d{1,2}):(\d{1,2}):(\d{1,2})$/);
	if (r == null) {
		return false;
	}
	if (parseInt(r[1]) > 9999 || parseInt(r[1]) < 1753) {
		return false;
	}
	var d = new Date(r[1], r[3] - 1, r[4]);
	if (!(d.getFullYear() == r[1] && (d.getMonth() + 1) == r[3] && d.getDate() == r[4])) {
		return false;
	}
	if (parseInt(r[5]) > 59 || parseInt(r[5]) < 0) {
		return false;
	}
	if (parseInt(r[6]) > 59 || parseInt(r[6]) < 0) {
		return false;
	}
	if (parseInt(r[7]) > 59 || parseInt(r[7]) < 0) {
		return false;
	}
	return true;
}
