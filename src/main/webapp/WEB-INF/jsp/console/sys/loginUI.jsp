<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>车辆管理系统</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath}/style/bootstrap/bootstrap-3.3.7/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath}/style/bootstrap/bootstrap-3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.servletContext.contextPath}/style/bootstrap/css/htmleaf-demo.css">
<style type="text/css">
.form-bg {
	background: #00b4ef;
}

.form-horizontal {
	background: #fff;
	padding-bottom: 40px;
	border-radius: 15px;
	text-align: center;
}

.form-horizontal .heading {
	display: block;
	font-size: 35px;
	font-weight: 700;
	padding: 35px 0;
	border-bottom: 1px solid #f0f0f0;
	margin-bottom: 30px;
}

.form-horizontal .form-group {
	padding: 0 40px;
	margin: 0 0 25px 0;
	position: relative;
}

.form-horizontal .form-control {
	background: #f0f0f0;
	border: none;
	border-radius: 20px;
	box-shadow: none;
	padding: 0 20px 0 45px;
	height: 40px;
	transition: all 0.3s ease 0s;
}

.form-horizontal .form-control:focus {
	background: #e0e0e0;
	box-shadow: none;
	outline: 0 none;
}

.form-horizontal .form-group i {
	position: absolute;
	top: 12px;
	left: 60px;
	font-size: 17px;
	color: #c8c8c8;
	transition: all 0.5s ease 0s;
}

.form-horizontal .form-control:focus+i {
	color: #00b4ef;
}

.form-horizontal .fa-question-circle {
	display: inline-block;
	position: absolute;
	top: 12px;
	right: 60px;
	font-size: 20px;
	color: #808080;
	transition: all 0.5s ease 0s;
}

.form-horizontal .fa-question-circle:hover {
	color: #000;
}

.form-horizontal .main-checkbox {
	float: left;
	width: 20px;
	height: 20px;
	background: #11a3fc;
	border-radius: 50%;
	position: relative;
	margin: 5px 0 0 5px;
	border: 1px solid #11a3fc;
}

.form-horizontal .main-checkbox label {
	width: 20px;
	height: 20px;
	position: absolute;
	top: 0;
	left: 0;
	cursor: pointer;
}

.form-horizontal .main-checkbox label:after {
	content: "";
	width: 10px;
	height: 5px;
	position: absolute;
	top: 5px;
	left: 4px;
	border: 3px solid #fff;
	border-top: none;
	border-right: none;
	background: transparent;
	opacity: 0;
	-webkit-transform: rotate(-45deg);
	transform: rotate(-45deg);
}

.form-horizontal .main-checkbox input[type=checkbox] {
	visibility: hidden;
}

.form-horizontal .main-checkbox input[type=checkbox]:checked+label:after {
	opacity: 1;
}

.form-horizontal .text {
	float: left;
	margin-left: 7px;
	line-height: 20px;
	padding-top: 5px;
	text-transform: capitalize;
}

.form-horizontal .btn {
	float: right;
	font-size: 14px;
	color: #fff;
	background: #00b4ef;
	border-radius: 30px;
	padding: 10px 25px;
	border: none;
	text-transform: capitalize;
	transition: all 0.5s ease 0s;
}

@media only screen and (max-width: 479px) {
	.form-horizontal .form-group {
		padding: 0 25px;
	}
	.form-horizontal .form-group i {
		left: 45px;
	}
	.form-horizontal .btn {
		padding: 10px 20px;
	}
}
</style>
<!--[if IE]>
		<script src="${pageContext.servletContext.contextPath}/style/bootstrap/js/html5shiv.min.js"></script>
	<![endif]-->

</head>
<body>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/sweetalert/sweetalert.min.js"></script>
	<script type="text/javascript" src="${pageContext.servletContext.contextPath}/style/bootstrap/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.servletContext.contextPath}/style/bootstrap/bootstrap-3.3.7/js/bootstrap.min.js"></script>
	<div class="htmleaf-container" style="width: 100%;height: 100%">
		<header class="htmleaf-header">
			<h1>
				<span style="font-weight: bolder;">车辆管理系统</span>
			</h1>
			<div class="htmleaf-links"></div>
		</header>
		<div class="demo form-bg" style="padding: 20px 0;height: 600px;padding-top: 85px;">
			<div class="container">
				<div class="row">
					<div class="col-md-offset-3 col-md-6">
						<form class="form-horizontal">
							<span class="heading">用户登录</span>
							<div class="form-group">
								<input id="unameInput" type="text" class="form-control" placeholder="用户账号" autofocus> <i class="fa fa-user"></i>
							</div>
							<div class="form-group help">
								<input id="upwInput" type="password" class="form-control" placeholder="密　码" > <i class="fa fa-lock"></i>
							</div>
							<div class="form-group">
								<button type="button" id="loginButton" autocomplete="off" class="btn btn-default" data-loading-text="登录中..."
									onclick="doLogin();">&nbsp;登 &nbsp;&nbsp;录&nbsp;</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var loginFlag = true;
		function doLogin() {
			loginFlag = false;
			var btn = $("#loginButton");
			btn.button('loading');
			var unameVal = $.trim($('#unameInput').val());
			if (!unameVal) {
				btn.button('reset');
				swal('用户账号不能为空');
				$("#unameInput").select();
				loginFlag = true;
				return false;
			}
			var upwVal = $.trim($('#upwInput').val());
			if (!upwVal) {
				btn.button('reset');
				swal('密码不能为空');
				$("#upwInput").select();
				loginFlag = true;
				return false;
			}
			var params = {
				uname : unameVal,
				upw : upwVal
			};
			$.ajax({
				type : "POST",
				dataType : "text",
				url : '${pageContext.servletContext.contextPath}/console/user/login.do',
				cache : true,
				async : true,
				data : params,
				success : function(data) {
					loginFlag = true;
					btn.button('reset');
					if (data == 'success') {
						//验证通过，跳转页面
						window.location.href = '${pageContext.servletContext.contextPath }/console/home.do';
					} else if (data == 'Lingdao') {
						//验证通过，跳转页面
						window.location.href = '${pageContext.servletContext.contextPath }/console/home1.do';
					} else {
						swal("登录失败： " + data);
						$("#unameInput").select();
						return false;
					}
				},
				error : function() {
					loginFlag = true;
					btn.button('reset');
					swal("登录失败");
				}
			});
		}
	
		// 回车直接提交
		document.onkeydown = function(e) {
			var event = window.event || e; //兼容火狐浏览器
			if (event.keyCode == 13 && loginFlag) {
				doLogin();
			}
		};
	</script>
</body>
</html>