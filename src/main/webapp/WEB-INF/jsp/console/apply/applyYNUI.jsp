<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>车辆申请决策显示页</title>
</head>
<body>
	<table id="applyYNdatagrid"></table>、
	<div id="applyYNToolBar" width="100%">
		<table >
			<tr>
				<td>
					<a id="applyYN" href="#" class="easyui-linkbutton" 
					plain="true" iconCls="icon-add" onclick="applyYNOpt.update();">编辑</a>
				</td>
			</tr>
		</table>
	</div>
	<script type="text/javascript">
	$(function(){
		var uname = '<%=(String)session.getAttribute("uname")%>';
		if(uname == 'wx'){
			$("#applyYN").hide();
		}
	});
		var applyYNOpt = {
			newDialog : function(dialogId, url, title, param){
				var dialogObj = $('<div id="' + dialogId + '"></div>');
				dialogObj.appendTo("body");
				$("#" + dialogId).dialog({
					href : getContextPath() + url, 
					title : title,
					queryParams : param,
					width : 512,
					height : 350,
					modal : true,
					draggable : true,
					inline : true,
					onClose : function(){
						dialogObj.remove();
					}
				});
			},
			update : function(index){
				var applyUpdate = $("#applyYNdatagrid").datagrid("getChecked");
				if(applyUpdate.length == 0){
					$.messager.alert("提示","请选择一条信息","info");
					return false;
				}else if(applyUpdate.length > 1){
					$.messager.alert("提示","最多选择一条信息","info");
					return false;
				}
				applyYNOpt.newDialog("updateApplyYN",'/console/applyYN/updateApplyYNUI.do',"申请编辑框",{"id" : applyUpdate[0].id})
			}
		}
		$(function(){
			$("#applyYNdatagrid").datagrid({
				fit : true,
				checkOnSelect : true,
				striped : true,
				singleSelect : true,
				nowrap : false,
				pagination : true,
				pageSize : 25,
				pageList : [ 15, 20, 25 ],
				toolbar : "#applyYNToolBar",
				url : getContextPath() + '/console/applyYN/apply.do',
				columns:[[
					{
						field:'checkbox',
						title: '',
						align:'center',
						width:'3%',
						checkbox : true,
					},
					{
						field:'name',
						title:'姓名',
						width:'15%',
						align:'center',	
					},
					{
						field:'department',
						title:'部门',
						width:'15%',
						align:'center',
					},
					{
						field:'destination',
						title:'目的地',
						width:'15%',
						align:'center',
					},
					{
						field:'outtime',
						title:'外出时间',
						width:'15%',
						align:'center',
						formatter: function(value,row,index){
							var dt = new Date(value);
							var i = dt.getMonth() + 1;
							return dt.getFullYear()+"-"+ i +"-"+dt.getDate();
						}
					},
					{
						field:'reason',
						title:'事由',
						width:'15%',
						align:'center',
					},
					{
						field:'state',
						title:'状态',
						width:'15%',
						align:'center',
					},
					{
						field:'driver',
						title:'司机',
						width:'10%',
						align:'center',
					},
				]]
			});
		});
	</script>
</body>
</html>