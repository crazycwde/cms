<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table id="reparisList"></table>
	<div id="reparisToolBar">
		<table>
			<tr>
				<td><a id="insertReparis" href="#" class="easyui-linkbutton"
				plain="true" iconCls="icon-add" onclick="reparisOpt.insert();">增加</a></td>
				<td><a id="updateReparis" href="#" class="easyui-linkbutton"
				plain="true" iconCls="icon-edit" onclick="reparisOpt.update();">编辑</a></td>
				<td><a id="delReparis" href="#" class="easyui-linkbutton"
				plain="true" iconCls="icon-del" onclick="reparisOpt.del();">删除</a></td>
			</tr>
		</table>
	</div>
	<script type="text/javascript">
	var reparisOpt = {
			newDialog : function(dialogId, url, title, param){
				//var dialogOpt = "<div id='" + dialogId + "'></div>";
				//这样是不对的，appendTo()函数是对JQuery对象的操作而不是字符串
				var dialogOpt = $("<div id='" + dialogId + "'></div>");
				dialogOpt.appendTo("body");
				$("#"+dialogId).dialog({
						title: title,    
					    width: 512,    
					    height: 320,    
					    closed: false,    
					    cache: false,  
					    queryParams : param,	//传递参数到控制器
					    href: getContextPath() + url,    
					    modal: true ,
					    inline : true,
					    draggable : true,		//允许拖拽窗口
				});
			},
			insert : function(){
				reparisOpt.newDialog('insertReparisDialog', '/console/reparis/insertReparisUI.do', "增加维修信息", {});
			}, 
			update : function(){
				var reparis = $("#reparisList").datagrid('getChecked');
				if(reparis.length == 0){
					$.messager.alert("提示", "请选择一条信息", "info");
					return false;
				}else if(reparis.length > 1){
					$.messager.alert("提示", "只能选择一条信息", "info");
					return false;
				}
				reparisOpt.newDialog("updateReparisDialog", '/console/reparis/updateReparisUI.do', "修改维修信息", {"exelId" : reparis[0].exelId});
			},
			del : function(){
				var reparis = $("#reparisList").datagrid('getChecked');
				if(reparis.length == 0){
					$.messager.alert("提示", "请至少选择一条信息", "info");
					return false;
				}
				var arr = new Array();
				for(var i = 0;i<reparis.length; i++){
					arr.push(reparis[i].exelId);
				}
				url = getContextPath() + '/console/reparis/delReparis.do';
				$.messager.confirm("确认对话框", "你想要删除这" + reparis.length + "条信息吗", function(r){
					if(r){
						//JQuery的AJAX函数，使用HTTP GET来加载远程数据，还有其他几种加载方式
						$.get(url, {exelId: arr}, function(data){
							if(data == 'success'){
								$.messager.alert("提示", "删除成功", "info");
								$("#reparisList").datagrid('reload');
								$("#reparisList").datagrid('uncheckAll');
							}else{
								$.messager.alert("提示", data,"error", function(r){
									$("#reparisList").datagrid('reload');
								});
							}
						})
					}
				});
			}
				
	}
	$("#reparisList").datagrid(
			{
				fit : true,
				pagination : true,
				striped : true,
				nowrap : false,
				pageSize : 25,
				toolbar : '#reparisToolBar',
				pageList : [ 15, 20, 25 ],
				url : getContextPath() + '/console/query/reparis.do',
				 columns: [[
					 	{
					 		field: "checkbox",
							title: '',
							align: 'center',
							checkbox : true,
					 	},
                    	{
							field: "carname",
							title: '车辆名称',
							align: 'center',
							width: '16%',
						},
						{
							field: "exelId",
							title: '订单号',
							align: 'center',
							width: '16%',
						},
						{
							field: "time",
							title: '维修时间',
							align: 'center',
							width: '16%',
							formatter: function(value,row,index){
								var dt = new Date(value);
								var i = dt.getMonth() + 1;
								return dt.getFullYear()+"-"+i +"-"+dt.getDate();
							}
						},
						{
							field: "fee",
							title: '费用',
							align: 'center',
							width: '16%',
						},
						{
							field: "location",
							title: '维修地点',
							align: 'center',
							width: '16%',
						},
						{
							field: "type",
							title: '类型',
							align: 'center',
							width: '16%',
						}]
                    ]
			})
	</script>
</body>
</html>