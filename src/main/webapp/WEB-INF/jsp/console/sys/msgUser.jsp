<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>当前用户信息</title>

<style type="text/css">
body {
	margin-right: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

</style>

</head>

<body>
	<table border="0" cellpadding="0" cellspacing="0" style="margin-left: auto;margin-right: auto;width: 100%;">
		<tr>
			<td>
				<table align="center" border="0px" style="border-collapse:separate;border-spacing:15px;margin-top: 15px;">
					<tr>
						<td align="right">员工号：</td>
						<td><input type="text" class="easyui-textbox" size="30" data-options="iconCls: 'icon-lock',readonly:true" style="text-align:center;" value="${sessionScope.loginInfo.ygId}" /></td>
					</tr>
					<tr>
						<td align="right">登录名：</td>
						<td><input type="text" class="easyui-textbox" size="30" data-options="iconCls: 'icon-lock',readonly:true" style="text-align:center;" value="${sessionScope.loginInfo.uname}" /></td>
					</tr>
					<tr>
						<td align="right">角色名：</td>
						<td><input type="text" class="easyui-textbox" size="30" data-options="iconCls: 'icon-lock',readonly:true" style="text-align:center;" value="${sessionScope.loginInfo.name}" /></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><a class="easyui-linkbutton" iconCls="icon-no" onclick="javascript:$('#homeCommon').dialog('close');">关闭</a></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</html>
