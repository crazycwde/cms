<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改申请表状态</title>
</head>
<body>
	<form id="updateState">
		<table align="center" style="border-collapse:separate;border-spacing: 10px;">
			<tr>
				<td align="right">申请人姓名：</td>
				<td><input id="name" name="name" class="easyui-textbox" readonly="true" value="${apply.name}" /></td>
			</tr>
			<tr>
				<td align="right">申请人部门：</td>
				<td><input id="department" name="department" class="easyui-textbox" readonly="true" value="${apply.department}" /></td>
			</tr>
			<tr>
				<td align="right">外出目的地：</td>
				<td><input id="destination" name="destination" class="easyui-textbox" readonly="true" value="${apply.destination}" /></td>
			</tr>
			<tr>
				<td align="right">外  出  时  间：</td>
				<td><input id="outtime" name="outtime" class="easyui-datebox" readonly="true" value="${apply.outtime}" /></td>
			</tr>
			<tr>
				<td align="right">外  出  事  由：</td>
				<td><input id="reason" name="reason" class="easyui-textbox" readonly="true" value="${apply.reason}" /></td>
			</tr>
			<tr>
				<td align="right">申  请  状 	态：</td>
				<td><input id="state" name="state" class="easyui-combobox" type="text" /></td>
			</tr>
		</table>
		<table align="center">
			<tr>
				<td align="center"><a id="saveBtn_state" href="javascript:void(0);">确认</a></td>
				<td width="30%"></td>
				<td><a id="cancel_state" href="javascript:void(0);">取消</a></td>
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
		$("#state").combobox({
			required:true,
			valueField : 'id',
			textField : 'text',
			url : getContextPath() + "/console/applyYN/combobox.do",
		});
		
		$("#saveBtn_state").linkbutton({
			iconCls : 'icon-save'
		});
	
		$("#cancel_state").linkbutton({
			iconCls : 'icon-cancel'
		});
		$("#cancel_state").click(function(){
			$("#updateApplyYN").dialog('close');
		});
		$("#saveBtn_state").click(function(){
			$.messager.progress();
			$("#updateState").form('submit', {
				url : getContextPath() + "/console/applyYN/updateApplyYN.do",
				onSubmit : function(param){
					param.id = ${apply.id};
					var isValidate = $(this).form("validate");
					if(!isValidate){
						$.messager.progress('close');
						$.messager.alert("提示", "请按照要求填写表单", "info");
						return false;
					}
				},
				success : function(data){
					$.messager.progress('close');
					if(data == 'success'){
						$.messager.alert("成功", "同意申请", "info");
						$("#updateApplyYN").dialog('close');
						$("#applyYNdatagrid").datagrid('reload');
					}else{
						$.messager.alert("失败", data,"info");
					}
				}
			});
		});
	</script>
</body>
</html>