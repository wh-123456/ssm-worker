<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>权限不够</title>
<script src="<%=basePath%>/static/js/jquery.js"></script>
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/css/pintuer.css">
<script src="<%=basePath%>/static/js/pintuer.js"></script>
</head>
<body>
<div class="container">
	<div class="panel margin-big-top">
	<div class="text-center">
			<br>
			<h2  class="padding-top">
				<stong>404错误！抱歉您要找的页面已被劫持</stong>
			</h2>
			<div class="">
			<div class="float-left">
				<img src="<%=basePath%>/static/images/骚包.gif">
				<div class="alert">
					卧槽！页面不见了！
				</div>
			</div>
			<div class="float-right">
				<img src="<%=basePath%>/static/images/莫激动，兄弟.png" width="260">
			</div>
			</div>
			<div class="padding-big">
				<a href="javascript:history.back(-1)" class="button bg-yellow">返回首页</a>
				<a onclick="methodOne()" class="button">打死管理员</a>
			</div>
	</div>
	</div>
</div>
</body>
<script type="text/javascript">
	function methodOne(){
		alert("管理员已潜逃，求放过！")
	}
</script>
</html>