<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table id="applyYdatagrid"></table>
	<script type="text/javascript">
	$(function(){
		$("#applyYdatagrid").datagrid({
			fit : true,
			striped : true,
			nowrap : false,
			pagination : true,
			pageSize : 25,
			pageList : [ 15, 20, 25 ],
			url : getContextPath() + '/console/applyYN/applyY.do',
			columns : [[
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
	})
		
	</script>
</body>
</html>