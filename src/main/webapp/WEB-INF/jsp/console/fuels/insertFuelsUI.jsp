<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加油耗信息页面</title>
</head>
<body>
	<form id="insertFuelsForm">
		<table align="center" style="border-collapse:separate;border-spacing: 10px; ">
			<tr>
				<td>车辆  ID：</td>
				<td><input id="carId" class="easyui-numberbox" name="carId"/></td>
			</tr>
			<tr>
				<td>订单  ID：</td>
				<td><input id="exelId" class="easyui-textbox" name="exelId"/></td>
			</tr>
			<tr>
				<td>油耗时间：</td>
				<td><input id="time" class="easyui-datebox" name="time"/></td>
			</tr>
			<tr>
				<td>目 的 地：</td>
				<td><input id="location" class="easyui-textbox" name="location"/></td>
			</tr>
			<tr>
				<td>费      用：</td>
				<td><input id="fee" class="easyui-textbox" name="fee"/></td>
			</tr>
			<tr>
				<td>油耗类型：</td>
				<td><input id="fueltype" class="easyui-textbox" name="fueltype"/></td>
			</tr>
		</table>
		<table align="center">
			<tr>
				<td align="center"><a id="saveBtn_insertFuels" href="javascript:void(0);">确认</a></td>			
				<td width="30%"></td>
				<td><a id="cancel_insertFuels" href="javascript:void(0);">取消</a></td>
			</tr>
		</table>
	</form>
	
	<script type="text/javascript">
		$("#carId").numberbox({
			required : true,
		});
		$("#exelId").textbox({
			required : true,
		});
		$("#time").datebox({
			required : true,
		});
		$("#location").textbox({
			required : true,
		});
		$("#fee").textbox({
			required : true,
		});
		$("#fueltype").textbox({
			required : true,
		});
		$("#saveBtn_insertFuels").linkbutton({
			iconCls : 'icon-save',
		});
		$("#cancel_insertFuels").linkbutton({
			iconCls : 'icon-cancel',
		});
		$("#cancel_insertFuels").click(function(){
			$("#insertFuelsDialog").dialog('close');
		});
		$("#saveBtn_insertFuels").click(function(){
			$.messager.progress();
			$("#insertFuelsForm").form('submit', {
				url : getContextPath() + "/console/fuels/insertFuels.do",
				onSubmit : function(param){
					var isValidate = $(this).form('validate');
					if(!isValidate){
						$.messager.progress('close');
						$.messager.alert("提示", "请按要求填写表单", "info");
						return false;
					};
				},
				success : function(data){
					$.messager.progress('close');
					if(data == 'success'){
						$.messager.alert("提示", "增加油耗信息成功", "info");
						$("#insertFuelsDialog").dialog('close');
						$("#fuelsList").datagrid('reload');
					}else{
						$("#insertFuelsDialog").dialog('close');
						$.messager.alert("提示", data, "info");
					}
				}
			});
		});
	</script>
</body>
</html>