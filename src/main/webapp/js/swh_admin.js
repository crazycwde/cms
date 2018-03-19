$.ajaxSetup({
	error : function(XMLHttpRequest, textStatus, errorThrown) {
		if (XMLHttpRequest.status == 403) {
			alert('您没有权限访问此资源或进行此操作');
			return false;
		}
	},

	complete : function(XMLHttpRequest, textStatus) {
		var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus"); // 通过XMLHttpRequest取得响应头,sessionstatus，
		if (sessionstatus == 'timeout') {
			// 如果超时就处理 ，指定要跳转的页面
			var top = getTopWinow(); // 获取当前页面的顶层窗口对象
			alert('登录超时, 请重新登录.');
			// 获取绝对路径

			top.location.href = getContextPath() + "/console/user/loginUI.do"; // 跳转到登陆页面
		}
	}
});

/**
 * 在页面中任何嵌套层次的窗口中获取顶层窗口
 * 
 * @return 当前页面的顶层窗口对象
 */  
function getTopWinow() {
	var p = window;
	while (p != p.parent) {
		p = p.parent;
	}
	return p;
};

function getContextPath() {
	var localObj = window.location;
	var contextPath = localObj.pathname.split("/")[1];
	return localObj.protocol + "//" + localObj.host + "/" + contextPath;
};

//传入一个JSON字符串和一个newValue值，会根据value值来获得相应的数据
//在combobox的Onchange事件调用
function getPYMList(info,newValue) {
	var json = new Array();
	if(newValue!=''&&newValue!=null){
			var value=newValue.trim();
			for(var i=0,j=0;i<info.length;i++){
				 var pym=info[i].pym;
				 if(pym!=null&&pym.indexOf(value)==0){
						json[j++]=info[i];
				 }
			}
			return json;
		}else{
			return info;
		}
};

//传入URL获取JSON数据
function getJson(url) {
	 var info='';
	 $.ajax({
	    	  url: url,
		      dataType: 'json',
		      async:false,
		  cache:false,					     
		      success: function( data ) {
		    	  info=data;
				},
			});
	return info;
};

//格式化时间
function formatTime(time, fmt) {
	if (!fmt) {
		fmt = 'YYYY-MM-DD HH:mm:ss';
	}
	if (time && fmt) {
		var date = new Date()
		date.setTime(time)
		var o = {
			'M+' : date.getMonth() + 1,
			'D+' : date.getDate(),
			'h+' : date.getHours() % 12 === 0 ? 12 : date
					.getHours() % 12,
			'H+' : date.getHours(),
			'm+' : date.getMinutes(),
			's+' : date.getSeconds(),
			'q+' : Math.floor((date.getMonth() + 3) / 3),
			'S' : date.getMilliseconds()
		}
		var week = {
			'0' : '\u65e5',
			'1' : '\u4e00',
			'2' : '\u4e8c',
			'3' : '\u4e09',
			'4' : '\u56db',
			'5' : '\u4e94',
			'6' : '\u516d'
		}
		if (/(Y+)/.test(fmt)) {
			fmt = fmt.replace(RegExp.$1, (date.getFullYear() + '')
					.substr(4 - RegExp.$1.length))
		}
		if (/(E+)/.test(fmt)) {
			fmt = fmt
					.replace(
							RegExp.$1,
							((RegExp.$1.length > 1) ? (RegExp.$1.length > 2 ? '\u661f\u671f'
									: '\u5468')
									: '')
									+ week[date.getDay() + ''])
		}
		for ( var k in o) {
			if (new RegExp('(' + k + ')').test(fmt)) {
				fmt = fmt
						.replace(
								RegExp.$1,
								(RegExp.$1.length === 1) ? (o[k])
										: (('00' + o[k])
												.substr(('' + o[k]).length)))
			}
		}
		return fmt
	}
}

