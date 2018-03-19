<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车辆申请信息填写页</title>

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
	<form id="applyForm">
		<table align="center" style="border-collapse:separate;border-spacing:10px;">
			<tr>
				<td align="right">申请人姓名：</td>
				<td><input id="name"  class="easyui-textbox" data-options="iconCls:'icon-man'" size="20" name="name"/></td>
				<td></td>
			</tr>
			<tr>
				<td align="right">申请人部门：</td>
				<td><input id="department"  class="easyui-textbox"  size="20" name="department" /></td>
				<td></td>
			</tr>
			<tr>
				<td align="right">外出时间：</td>
				<td><input id="outtime" name="outtime" class="easyui-datebox" size="20" /></td>
			</tr>
			<tr>
				<td align="right">外出事由：</td>
				<td><input id="reason" name="reason" class="easyui-textbox" size="20" /></td>
			</tr>
			<tr>
				<td align="right">外出目的地：</td>
				<td><input id="destination" name="destination" class="easyui-textbox" size="20" /></td>
			</tr>
		</table>
		<br>
		<br>
		<table align="center">
			<tr>
				<td align="center"><a id="saveBtn_apply" href="javascript:void(0);">确认</a></td>
				<td width="50%"></td>
				<td><a id="cancel_apply" href="javascript:void(0);">取消</a></td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
		$("#name").textbox({
			required:true,
		});
		$("#department").textbox({
			required:true,
		});
		$("#reason").textbox({
			required:true,
		});
		
		$("#outtime").datebox({
			required:true,
			editable: true,
		});
		$("#destination").textbox({
			required:true,
		});
		
		$("#saveBtn_apply").linkbutton({
			iconCls : 'icon-save'
		});

		$("#cancel_apply").linkbutton({
			iconCls : 'icon-cancel'
		});

		$("#cancel_apply").click(function() {
			$("#homeMainCenterDg").dialog("close");
		});

		$("#saveBtn_apply").click(function() {
			$.messager.progress();
			$("#applyForm").form("submit", {
				url : getContextPath() + "/console/apply/carapply.do", //表单提交地址
				onSubmit : function(param) {
					var isvalidate = $(this).form("validate");
					if (!isvalidate) {
						$.messager.progress('close');
						$.messager.alert("提示", "请按照要求填写表单！", "info");
						return false;
					}
					return isvalidate;
				},
				success : function(data) {
					$.messager.progress('close');
					if(data == 'success'){
						$.messager.alert("成功", "申请用车成功，等待审核通过", "info");
					} else {
						$.messager.alert("错误", data, "warning");
					}
				}
			});
		});
	</script>
</body>
</html>