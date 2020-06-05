<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录认证</title>
<script src="<%=basePath%>/static/js/jquery.js"></script>
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/css/pintuer.css">
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/css/admin.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/bootstrap.min.css">
<script src="<%=basePath%>/static/js/bootstrap.js"></script>
</head>
<body>

	<div class="bg"></div>
	<div class="container">
		<div class="line bouncein">
			<div class="xs6 xm4 xs3-move xm4-move">
				<div style="height: 150px;"></div>
				<div class="media media-y margin-big-bottom"></div>
				<form action="<%=basePath%>system/login" method="post">
					<div class="panel loginbox">
						<div class="text-center margin-big padding-big-top">
							<h1>HRMS系统</h1>
						</div>
						
						<div class="panel-body"
							style="padding: 30px; padding-bottom: 10px; padding-top: 10px;">
							<div class="form-group">
								<div class="field field-icon-right">
									<input type="text" class="input input-big" name="username"
										placeholder="登录账号" data-validate="required:请填写账号" /> <span
										class="icon icon-user margin-small"></span>
								</div>
							</div>
							<div class="form-group">
								<div class="field field-icon-right">
									<input type="password" class="input input-big" name="password" id="password"
										placeholder="登录密码" data-validate="required:请填写密码" /> <span
									onclick="methodOne()" id="margineye"	class="icon icon-eye-slash margin-small"></span>
								</div>
							</div>
							
							<div class="form-group">
								<div class="field">
									<input type="text" class="input input-big" name="captcha"
										placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码" />
									
								<img width="100px" style="height: 44px;cursor: pointer;"
								class="passcode"
								id="image" alt="加载失败"
								  onclick="changeCode()" src="<%=basePath%>/system/getVerifyCode">

								</div>
							</div>
							<div>
								<div class="col-md-6" style="text-align: left">
								
								</div>
								
								<div class="col-md-6" style="text-align: right">
								<span id="points" style="color: red">${error}</span>
								</div>
							</div>
							
						</div>
						
						<div style="padding: 30px;" class="row" >
							
							<div class="col" style="width:40%;float:left">
							<button type="button" 
							onclick="window.location.href = '<%=basePath%>system/register'" 
								class="button button-block bg-main text-big input-big"
								value="注册">注册 </button>
								<a style="color: green;float:right" href="<%=basePath%>system/gomain">游客登录</a>
							</div>
							<div class="col" style="width:40%;float:right">
							<button type="submit"
								class="button button-block bg-main text-big input-big">登录</button>
								<a style="color: green" href="<%=basePath%>user/getPassword" class="a_post">忘记密码</a>
							</div>
							
						</div>
						
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
<!-- 点击刷新验证码 -->

function changeCode(){
         var src = " getVerifyCode?"+new Date().getTime(); //加时间戳，防止浏览器利用缓存
         $("#image").attr("src",src);      
}
//密码显示和隐藏
function methodOne(){
	var b=$("#password").attr("type")
	if(b=='password'){
		$("#password").attr("type",'text')
		$("#margineye").prop("class",'icon icon-eye margin-small')
	}else{
		$("#password").attr("type",'password')
		$("#margineye").prop("class",'icon icon-eye-slash margin-small')
	}
	
}
$(function(){
	 //当input框改变时会被触发
   $("input").change(function(){
	   document.querySelector("#points").innerHTML="";  
   })
   
   })
</script>
</html>