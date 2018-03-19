	﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>车辆管理系统</title>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/ui/gdian/css/common.css">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/ui/gdian/css/main.css">

<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath }/js/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath }/js/easyui/themes/icon.css">


<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/easyui/jquery.min.js"></script>
<!--<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/msgTX/js/easyui/jquery-1.11.0.min.js"></script>
  -->
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/swh_admin.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/highcharts/highcharts.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/highcharts/highcharts-3d.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/highcharts/exporting.js"></script>
<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/highcharts/highcharts-zh_CN.js"></script>

<link rel="stylesheet" href="${pageContext.servletContext.contextPath }/js/msgTX/css/iziToast.min.css">
<script type="text/javascript">
$(function (){
	$(".trigger-warning").on('click', function (event) {
	    event.preventDefault();
		
	    $.ajax({
			url:getContextPath() + "/console/txmsg/txMsgList.do",
			dataType: "json",
			success: function(data) {
				for(var o in data) {
					if(o=='dltx'){
						iziToast.warning({
					        title: '',
					        message: data[o],
					        position: 'bottomCenter',
					        transitionIn: 'flipInX',
					        transitionOut: 'flipOutX',
					    });
					}
					if(o=='zskg'){
						console.log(data[o]);
						iziToast.warning({
					        title: '',
					        message: data[o],
					        position: 'bottomCenter',
					        transitionIn: 'flipInX',
					        transitionOut: 'flipOutX',
					    });
					}
					if(o=='empty'){
						iziToast.warning({
					        title: '',
					        message: data[o],
					        position: 'bottomCenter',
					        transitionIn: 'flipInX',
					        transitionOut: 'flipOutX',
					    });
					}
				}
			},
		}); 
	}); 
});
</script>
</head>

<body>
	<div class="easyui-layout wrap" data-options="fit:true">
		<div id="header">
			<div class="top-outer">
				<div class="topbar clearfix">
					<div class="logo">
						<img src="${pageContext.servletContext.contextPath}/ui/gdian/images/logo.png" alt="">
					</div>
					<div class="head-nav">
						<div class="manger">
							<div class="pic">
								<img src="${pageContext.servletContext.contextPath}/ui/gdian/images/avatar.jpg" alt="">
							</div>
							<div class="text">
								<p class="m-name">
									<span class="n1">${sessionScope.loginInfo.name}</span> <span class="icon icon1"></span>
								</p>
								<p class="m-pos">${sessionScope.loginInfo.uname}</p>
							</div>
							<!-- 隐藏列表 -->
							<div class="n-pop">
								<ul>
									<li><a href="#" onclick="updatepwd();">修改密码</a></li>
									<li><a href="#" onclick="msgUser();">用户信息</a></li>
								</ul>
							</div>
						</div>
						<%-- --%>
						<div class="infro exit">
							<a href="#" onclick="quit();"> <i class="icon icon3"></i> <span>退出</span>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>


		<div id="homeMainCenter" data-options="region:'center',border:false" style="margin-top: 120px;">
			<div id="homeMainCenterDg" style="display: none;"></div>
			<div id="homeCommon" style="display: none;"></div>
			<div class="container">
				<div class="man-group">
					<p class="tit">申请</p>
					<ul>
						<li><a href="#" onclick="changeHomeCenter('/console/apply/carapplyUI.do', '车辆申请')"> <img 
								src="${pageContext.servletContext.contextPath}/ui/gdian/images/ser01.png" alt="" />
								<p>用车申请</p>
						</a></li>
						
					</ul>
				</div>
				<div class="man-group">
					<p class="tit">信息查询</p>
					<ul>
						<li><a href="#" onclick="changeHomeCenter('/console/query/fuelsUI.do', '油耗信息管理')"> <img src="${pageContext.servletContext.contextPath}/ui/gdian/images/per01.png" alt="">
								<p>油耗信息</p>
						</a></li>
						<li><a href="#" onclick="changeHomeCenter('/console/query/reparisUI.do', '维修信息管理')"> <img src="${pageContext.servletContext.contextPath}/ui/gdian/images/per02.png" alt="">
								<p>维修信息</p>
						</a></li>
						
					</ul>
				</div>
				<div class="man-group">
					<p class="tit">申请决策</p>
					<ul>
						<li><a href="#" onclick="changeHomeCenter('/console/applyYN/applyYNUI.do', '未处理申请表')"> <img src="${pageContext.servletContext.contextPath}/ui/gdian/images/dan01.png" alt="">
								<p>未处理申请表</p>
						</a></li>
						<li><a href="#" onclick="changeHomeCenter('/console/applyYN/applyYUI.do', '已处理申请表')"> <img src="${pageContext.servletContext.contextPath}/ui/gdian/images/dan02.png" alt="">
								<p>已处理申请表</p>
						</a></li>
					</ul>
				</div>
				<div class="man-group">
					<p class="tit">系统管理</p>
					<ul>
						<li><a href="#" onclick="changeHomeCenter('/console/user/userListUI.do', '用户维护')"> <img src="${pageContext.servletContext.contextPath}/ui/gdian/images/xt01.png" alt="">
								<p>用户维护</p>
						</a></li>
						<li><a href="#" onclick="changeHomeCenter('/console/role/roleListUI.do', '角色维护')"> <img src="${pageContext.servletContext.contextPath}/ui/gdian/images/xt02.png" alt="">
								<p>角色维护</p>
						</a></li>
						<li><a href="#" onclick="changeHomeCenter('/console/sys/envListUI.do', '系统环境设置')"> <img src="${pageContext.servletContext.contextPath}/ui/gdian/images/xt03.png" alt="">
								<p>系统环境设置</p>
						</a></li>
						<%-- 
						<li><a href="#" onclick="changeHomeCenter('/console/sys/dwczrListUI.do', '单位人事信息操作员设置')"> <img src="${pageContext.servletContext.contextPath}/ui/gdian/images/xt04.png" alt="">
								<p>单位人事信息操作员设置</p>
						</a></li>--%>
					</ul>
				</div>
			</div>
		</div>

	</div>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/ui/gdian/js/main.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath }/js/admin/home.js"></script>
	<script src="${pageContext.servletContext.contextPath }/js/msgTX/js/iziToast.min.js" type="text/javascript"></script>
</body>
</html>