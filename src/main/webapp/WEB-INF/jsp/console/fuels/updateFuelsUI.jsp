<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>油耗信息修改</title>
</head>
<body>
	<form id="updateFuelsForm">
		<table align="center" style="border-collapse:separate;border-spacing: 10px;">
			<tr>
				<td align="right">车辆ID：</td>
				<td><input id="carId" name="carId" class="easyui-numberbox"  value="${fuels.carId}" /></td>
			</tr>
			<tr>
				<td align="right">订单ID：</td>
				<td><input id="exelId" name="exelId" class="easyui-numberbox"  value="${fuels.exelId}" /></td>
			</tr>
			<tr>
				<td align="right">订单时间：</td>
				<td><input id="time" name="time" class="easyui-datebox"  value="${fuels.time}" /></td>
			</tr>
			<tr>
				<td align="right">目的地：</td>
				<td><input id="location" name="location" class="easyui-textbox" readonly="true" value="${fuels.location}" /></td>
			</tr>
			<tr>
				<td align="right">费用：</td>
				<td><input id="fee" name="fee" class="easyui-numberbox"  value="${fuels.fee}" /></td>
			</tr>
			<tr>
				<td align="right">状态类型：</td>
				<td><input id="fueltype" name="fueltype" class="easyui-textbox" value="${fuels.fueltype}" /></td>
			</tr>
		</table>
		<table align="center">
			<tr>
				<td align="center"><a id="saveBtn_updateFuels" href="javascript:void(0);">确认</a></td>
				<td width="30%"></td>
				<td><a id="cancel_updateFuels" href="javascript:void(0);">取消</a></td>
			</tr>
		</table>
	</form>
	<script type="text/javascript">
	$("#carId").numberbox({
		required : true,
	});
	$("#exelId").numberbox({
		required : true,
	});
	$("#time").datebox({
		required : true,
	});
	$("#location").textbox({
		required : true,
	});
	$("#fee").numberbox({
		required : true,
	});
	$("#fueltype").textbox({
		required : true,
	});
	$("#saveBtn_updateFuels").linkbutton({
		iconCls : 'icon-save'
	});

	$("#cancel_updateFuels").linkbutton({
		iconCls : 'icon-cancel'
	});
	$("#cancel_updateFuels").click(function(){
		$("#updateFuelsDialog").dialog('close');
	});
	$("#saveBtn_updateFuels").click(function(){
		$.messager.progress();
		$("#updateFuelsForm").form('submit', {
			url	: getContextPath() + '/console/fuels/updateFuels.do',
			onSubmit : function(param){
				param.id = ${fuels.id};
				var isValidate = $(this).form('validate');
				if(!isValidate){
					$.messager.progress('close');
					$.messager.alert("提示", "请按要求填写表单", "info");
					return false;
				}
			},
			success : function(data){
				$.messager.progress('close');
				if(data == 'success'){
					$.messager.alert("提示", "修改油耗信息成功", "info");
					$("#updateFuelsDialog").dialog('close');
					$("#fuelsList").datagrid('reload');
				}else{
					$.messager.alert("提示", data, "info");
				}
			}
		});
	});
	</script>
</body>
</html>