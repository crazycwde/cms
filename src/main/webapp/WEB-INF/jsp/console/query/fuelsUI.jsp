<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>油耗查询</title>
</head>
<body>
	<table id="fuelsList"></table>
	<div id="fuelsToolbar">
		<table>
			<tr>
				<td>
					<a id="insertFuels" href="#" class="easyui-linkbutton"
					plain="true" iconCls="icon-add" onclick="fuelsOpt.insert();">增加</a>
					<!-- plain 为true时显示简洁效果。 linkbutton按钮属性 -->
					<a id="updateFuels" href="#" class="easyui-linkbutton"
					plain="true" iconCls="icon-edit" onclick="fuelsOpt.updateFuels();">修改</a>
					<a id="deletFuels" href="#" class="easyui-linkbutton"
					plain="true" iconCls="icon-del" onclick="fuelsOpt.del();">删除</a>
				</td>			
			</tr>
		</table>
	</div>
	<script type="text/javascript">
	$(function(){
		var uname = '<%=(String)session.getAttribute("uname")%>';
		if(uname == 'wx'){
			$("#updateFuels").hide();
			$("#deletFuels").hide();
		}
	});
	$("#insertFuels").linkbutton({
		iconCls : "icon-add",
	});
	$("#updateFuels").linkbutton({
		iconCls : "icon-edit",
	});
	$("#deletFuels").linkbutton({
		iconCls : "icon-del",
	});
	var fuelsOpt = {
		newdialog : function(dialogId, title, url, param){
			var dialogOpt = $('<div id="'+dialogId+'"></div>');
			dialogOpt.appendTo("body");
			$("#"+dialogId).dialog({
				title : title,
				href : getContextPath() + url,
				queryParams : param,    //传递参数
				modal : true,           //定义将窗体定义为模式化窗口
				draggable : true,       //定义能够拖动窗口
				width : 512,
				height : 320,
				inline : true,          //设置为true，窗口将显示在它的父容器中，否则将显示在所有的元素上。
				onClose :function(){
					dialogOpt.remove();
				}
			});
		},
		insert : function(){
			fuelsOpt.newdialog("insertFuelsDialog", "增加车辆油耗信息", '/console/fuels/insertFuelsUI.do', {});
		},
		updateFuels : function(index){
			var fuels = $("#fuelsList").datagrid('getChecked');
			if(fuels.length > 1){
				$.messager.alert("提示","只能选择一条信息", "info");
				return false;
			}else if(fuels.length ==0){
				$.messager.alert("提示", "请选择一条信息", "info");
				return false;
			}
			fuelsOpt.newdialog("updateFuelsDialog", "修改车辆油耗信息", '/console/fuels/updateFuelsUI.do', {"exelId" : fuels[0].exelId});
		},
		del : function(index){
			var delFuels = $("#fuelsList").datagrid("getChecked");
			if(delFuels.length > 0){
			var arrID = new Array();
				for(var i=0; i<delFuels.length; i++){
					//exelId 不能写错，否则传递不了参数
					arrID.push(delFuels[i].exelId);
				}
			}
			var url = getContextPath() + '/console/fuels/delFuels.do';
			$.messager.confirm("确认对话框" , "你想要删除这" + delFuels.length + "条信息吗", function(r){
				if(r){
					//JQuery的AJAX函数，使用HTTP GET来加载远程数据，还有其他几种加载方式
					$.get(url, {exelId: arrID}, function(data){
						if(data == 'success'){
							$.messager.alert("提示", "删除成功", "info");
							$("#fuelsList").datagrid('reload');
							$("#fuelsList").datagrid('uncheckAll');
						}else{
							$.messager.alert("提示", data,"error", function(r){
								$("#fuelsList").datagrid('reload');
							});
						}
					})
				}
			});
		}
		
	}
	$(function(){
		$("#fuelsList").datagrid(
				{
					fit : true,
					checkOnSelect : true,  //为true，当用户点击行的时候被选中或取消，
											//为false，当用户点击该复选框的时候才会被选中或取消
					pagination : true,
					striped : true,
					//singleSelect : true,  单条选中，在删除时不用，可以删除多条信息
					nowrap : false,
					pageSize : 25,
					toolbar : '#fuelsToolbar',
					pageList : [ 15, 20, 25 ],
					url : getContextPath() + '/console/query/fuels.do',
					 columns: [[
						 	{
								field: "checkbox",
								title: '',
								align: 'center',
								width: '3%',
								checkbox : true
							},
	                    	{
								field: "carname",
								title: '车辆名称',
								align: 'center',
								width: '20%',
							},
							{
								field: "exelId",
								title: '订单号',
								align: 'center',
								width: '20%',
							},
							{
								field: "time",
								title: '油耗时间',
								align: 'center',
								width: '20%',
								formatter: function(value,row,index){
									var dt = new Date(value);
									var i = dt.getMonth() + 1;
									return dt.getFullYear()+"-"+ i +"-"+dt.getDate();
								}
							},
							{
								field: "fee",
								title: '费用',
								align: 'center',
								width: '20%',
							},
							{
								field: "location",
								title: '目的地',
								align: 'center',
								width: '16%',
							}]
	                    ]
				})
	});
	</script>
</body>
</html>