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
	<script type="text/javascript">
	$("#reparisList").datagrid(
			{
				fit : true,
				pagination : true,
				striped : true,
				singleSelect : true,
				nowrap : false,
				pageSize : 25,
				toolbar : '#table3Toolbar',
				pageList : [ 15, 20, 25 ],
				url : getContextPath() + '/console/query/reparis.do',
				 columns: [[
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
							title: '维修时间',
							align: 'center',
							width: '20%',
							formatter: function(value,row,index){
								var dt = new Date(value);
								return dt.getFullYear()+"-"+dt.getMonth()+"-"+dt.getDate();
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
							title: '维修地点',
							align: 'center',
							width: '20%',
						}]
                    ]
			})
	</script>
</body>
</html>