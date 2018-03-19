$(function() {});
// 修改密码
function updatepwd() {
	$('#homeCommon').dialog({
		title : '修改密码',
		width : 512,
		height : 320,
		closed : false,
		cache : false,
		href : getContextPath() + '/console/user/updatePwdUI.do',
		modal : true
	});
}
// 当前用户信息
function msgUser() {
	$('#homeCommon').dialog({
		title : '用户信息',
		width : 512,
		height : 320,
		closed : false,
		cache : false,
		href : getContextPath() + '/console/user/msgUser.do',
		modal : true
	});
}
// 退出系统
function quit() {
	$.messager.confirm('退出系统', '确定要退出系统吗?', function(r) {
		if (r) {
			window.location.href = getContextPath() + '/console/user/quit.do';
		}
	});
};

function changeHomeCenter(url, title){
	if (!url) {
		return false;
	}
	if (!title) {
		title = ' ';
	}
	var centerHeight = $('#homeMainCenter').panel('options').height;
	$("#homeMainCenterDg").dialog({
        href: getContextPath() + url,
        title: title,
        method: 'get',
        fit: false,
        width: '100%',
        height: ((centerHeight - 147)/centerHeight * 100 + '%'),
        modal: true,
        draggable: false,
        cache : false,
        inline: true,
        resizable: false, // 不允许改变大小
        onBeforeClose: function() {
        	$(this).dialog('clear');
        },
        onBeforeLoad: function () {
        	$(this).dialog('move',{left : 0,top : 147});
        }
    });
};
