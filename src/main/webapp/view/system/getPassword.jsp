<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, customer-scalable=no" />
<meta name="renderer" content="webkit">
<title>密码找回</title>
<script src="<%=basePath%>/static/js/jquery.js"></script>
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/css/pintuer.css">
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/css/admin.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/bootstrap.min.css">
<script src="<%=basePath%>/static/js/bootstrap.js"></script>
<script src="<%=basePath%>/static/js/pintuer.js"></script>
<script src="<%=basePath%>static/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<div>
				<div  style="text-align: center; margin-top:20px">
					<h4 >密码找回</h4>
			    </div>
				<div class="row" style="margin-top:20px">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">员工编号：</label>
						</div>
						<div class="col-md-6">
							<input id="wNum" type="text" placeholder="请输入员工编号" class="input" name="wNum" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
					<div class="row" style="margin-top:20px">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">姓名：</label>
						</div>
						<div class="col-md-6">
							<input id="wName" placeholder="请输入姓名" type="text" class="input" name="wName" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
					<div class="row" style="margin-top:20px">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">用户名：</label>
						</div>
						<div class="col-md-6">
							<input id="userName" placeholder="请输入账号用户名" type="text" class="input" name="userName" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
						<div class="row" style="margin-top:20px">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">密码：</label>
						</div>
						<div class="col-md-6">
							<input id="password" placeholder="请输入新密码" type="password" class="input" name="password" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
					<div class="row" style="margin-top:20px">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">确认密码：</label>
						</div>
						<div class="col-md-6">
							<input id="password2" placeholder="请确认新密码" type="password" class="input" name="password2" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
					<div class="row" style="margin-top:20px">
						<div class="col-md-2" style="text-align: right">
						</div>
						<div class="col-md-6" style="text-align: right">
							<button class="button win-back text-red icon-arrow-left">
								后退</button>
							<button type="button" class="btn btn-primary" id="addbuton"
						         onclick="pushData()">提交</button>
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
</div>
</body>
	<script type="text/javascript">
			function pushData(){
				var wNum=$("#wNum").val();
				var wName=$("#wName").val();
				var username=$("#userName").val();
				var password=$("#password").val();
				var password2=$("#password2").val();
				if(password!=password2){
				alert("输入的两次密码不一致！")
				return;
				}
				$.ajax({
					 url:"<%=basePath%>/user/getNewPassword",
					 type:"post",
					 data:{
						 wNum:wNum,
						 username:username,
						 wName:wName,
						 newPassword:password
					 },
					 success:function(data){
						 if(data>0){
							 alert("密码修改成功");
							 window.location.href="<%=basePath%>/system/gologin";
						 }else{
							 alert("姓名或用户名错误！！");
							
						 }
						 
					 },
					 error:function(data){
						 alert("员工编号不存在！！");
						 
					 }
					
				})
				
			}
	</script>
</html>