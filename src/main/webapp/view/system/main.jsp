<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page import="java.util.Date"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>人力资源管理系统</title>
<link rel="stylesheet" href="<%=basePath%>static/css/pintuer.css">
<link rel="stylesheet" href="<%=basePath%>static/css/admin.css">
<link rel="shortcut icon" href="#"/>
<script src="<%=basePath%>static/js/jquery.js"></script>
</head>
<body style="background-color: #f2f9fd;">
	<div class="header bg-main">
		<div class="logo margin-big-left fadein-top">
			<h1>
				<img src="<%=basePath%>static/images/rlzy.jpeg" class="radius-circle rotate-hover"
					height="50" alt="" />人力资源管理系统
			</h1>
		</div>
		<div class="head-l">
			<a class="button button-little bg-green" href="<%=basePath%>/system/getInfo" target="right">
				<span class="icon-home"></span> 前台首页</a> &nbsp;&nbsp;
			<a href="javascript:void(0)" onclick="location.reload()" class="button button-little bg-blue" >
			<span class="icon-wrench">
				</span>清除缓存</a> &nbsp;&nbsp;
			<c:if test="${userrole!=null}">
			<a class="button button-little bg-red" href="<%=basePath%>/system/loginout">
				<span class="icon-power-off"></span>退出登录</a>&nbsp;&nbsp;
			<a class="button button-little bg-gray">
				登录时间：${logindate}
			</a>&nbsp;&nbsp;
			<a class="button button-little bg-yellow">
				<span class="icon-spinner" ></span>您已登录：
			   <span id="uptime"></span>
			</a>&nbsp;&nbsp;
			</c:if>
			<c:if test="${userrole==null}">
			<a class="button button-little bg-green" href="<%=basePath%>/system/gologin">
				<span class="icon-group (alias)"></span> 登录 </a>
			</c:if>
			
		</div>
	</div>
	<div class="leftnav">
		<div class="leftnav-title">
			<strong><span class="icon-list"></span>菜单列表</strong>
		</div>
		<!-- 游客登录显示 -->
		<c:if test="${userrole==null}">
		<h2>
			<span class="icon-pencil-square-o"></span>投份简历
		</h2>
		<ul>
		<li><a href="<%=basePath%>/system/gotoCV" target="right"><span
					class="icon-credit-card"></span>简历投递</a></li>
		</ul>
		</c:if>
		<c:if test="${userrole!=null}">
		<h2>
			<span class="icon-pencil-square-o"></span>个人管理
		</h2>
		</c:if>
		<ul>
			
			<!-- 除了实习员工以外都显示 -->
			<c:if test="${userrole<4}">
			<li><a href="<%=basePath%>worker/findWorkerInfoById?wNum=${userwNum}" target="right"><span
					class="icon-male"></span>信息管理</a></li>
			</c:if>
			<!-- 只有普通员工显示 -->
			<c:if test="${userrole==3}">
			<li><a href="<%=basePath%>affairs/selectpracticeByNum?wNum=${userwNum}"
				target="right"><span class="icon-rocket"></span>升职请求</a></li>
			</c:if>
			<!-- 实习员工显示 -->
			<c:if test="${userrole==4}">
			<li><a href="<%=basePath%>practice/intopracticeInfo?pNum=${userwNum}" target="right"><span
					class="icon-male"></span>信息管理</a></li>
			<li><a href="<%=basePath%>affairs/selectpracticeByNum?wNum=${userwNum}"
				target="right"><span class="icon-child"></span>转正请求</a></li>
			</c:if>
			<!-- 所有人显示 -->
			<li><a href="<%=basePath%>user/gotoUserInfo" target="right"><span
					class="icon-user"></span>账号管理</a></li>
				
		</ul>
		<!-- 主管和超级管理员显示 -->
		<c:if test="${userrole<3}">
		<h2>
			<span class="icon-pencil-square-o"></span>员工管理
		</h2>
		<ul>
			<li><a href="<%=basePath%>worker/workerListByNum?wDnum=${userDnum}" target="right"><span
					class="icon-group (alias)"></span>员工管理</a></li>
			<li><a href="<%=basePath%>worker/findWorkerInfoByDnum?wiDnum=${userDnum}&wiNum=${userwNum}"
				target="right"><span class="icon-file"></span>员工信息</a></li>
			<c:if test="${userrole==2}">
			<li><a href="<%=basePath%>practice/findpracticeList?pDnum=${userDnum}"
				target="right"><span class="icon-group (alias)"></span>实习生管理</a></li>
			</c:if>
		</ul>
		</c:if>
		<!-- 超级管理员显示 -->
		<c:if test="${userrole<2}">
		<h2>
			<span class="icon-pencil-square-o"></span>部门管理
		</h2>
		<ul>
			
			<li><a href="<%=basePath%>department/departmentList" target="right"><span
					class="icon-sitemap"></span>部门管理</a></li>
			<li><a href="<%=basePath%>money/findMoneyList" target="right"><span
					class="icon-money"></span>薪资管理</a></li>
		</ul>
		<h2>
			<span class="icon-pencil-square-o"></span>招聘管理
		</h2>
		<ul>
			
			<li><a href="<%=basePath%>practice/findpracticeList?pDnum=${userDnum}"
				target="right"><span class="icon-group (alias)"></span>实习生管理</a></li>
			<li><a href="<%=basePath%>affairs/recruitsList" target="right"><span
					class="icon-list"></span>招聘信息</a></li>
		</ul>
		</c:if>
		<c:if test="${userrole<3}">
		<h2>
			<span class="icon-pencil-square-o"></span>事务管理
		</h2>
		<ul>
			
			<li><a href="<%=basePath%>affairs/departmentnotice?dNum=${userDnum}"
				target="right"><span class="icon-bullhorn"></span>部门公告</a></li>
			<!-- 主管显示 -->
			<c:if test="${userrole==2}">
				<li><a href="<%=basePath%>affairs/bossPromotion?dNum=${userDnum}"
					target="right"><span class="icon-lightbulb-o"></span>员工请求</a></li>
				<li><a href="<%=basePath%>resume/selectresumeBydNum?dNum=${userDnum}"
					target="right"><span class="icon-paste (alias)"></span>简历筛选</a></li>
			</c:if>
		</ul>
		</c:if>
	</div>
	
	<ul class="bread">
		<li><a href="##" id="a_leader_txt" 	target="right">前台首页</a></li>
		<li><b>当前语言：</b><span style="color: red;">中文</span>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;欢迎你:<span style="color: green;">${userDname}${userPname}</span>
			<span style="color: blue; font-size:15px">
			<c:if test="${name==null}">
							 游客
			</c:if>
			<c:if test="${name!=null}">
							${name}
			</c:if>
			
			
			</span></li>
	</ul>
	<div class="admin">
		<iframe scrolling="auto" rameborder="0"
			src="<%=basePath%>/system/getInfo" name="right" width="100%"
			height="100%"></iframe>
	</div>
	<div style="text-align: center;">
		<p>
			来源:<a href="http://www.mycodes.net/" target="_blank">源码之家</a>
		</p>
	</div>
</body>
<script type="text/javascript">
		$(function() {
			$(".leftnav h2").click(function() {
				$(this).next().slideToggle(200);
				$(this).toggleClass("on");
			})
			$(".leftnav ul li a").click(function() {
				$("#a_leader_txt").text($(this).text());
				$("#a_leader_txt").attr("href",$(this).attr("href"));
				$(".leftnav ul li a").removeClass("on");
				$(this).addClass("on");
			})
		});
		//时间设置
		  function currentTime(){ 
			    var d=new Date();
				var lgdate=new Date('${logindate}');
				/*现在的时间减去登录时间*/
				var update=new Date(d-lgdate);
				/*时*/
				var hour=update.getHours()-8;
				/*分*/
				var minute=update.getMinutes();
				/*秒*/
				var s=update.getSeconds();
				if(hour<10){
					hour="0"+hour
				}
				if(minute<10){
					minute="0"+minute
				}
				if(s<10){
					s="0"+s
				}
				return hour+":"+minute+":"+s;
		} 
		//每隔1s执行一次
		setInterval(function(){
			$('#uptime').html(currentTime)
			},1000);
	</script>
</html>
