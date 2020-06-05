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
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
<meta name="renderer" content="webkit">
<title>事务管理界面</title>
<script src="<%=basePath%>/static/js/jquery.js"></script>
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/pintuer2.0/pintuer-2.0.css">
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/css/admin.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/My97DatePicker/skin/WdatePicker.css">
<script src="<%=basePath%>/static/js/bootstrap.js"></script>
<script src="<%=basePath%>/static/pintuer2.0/pintuer-2.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
					
<div id="vo">
	
  	<div class="fold fold-arrow" id="folddemo">
  		<c:forEach items="${as}" var="a" >
      		<div class="fold-item">
      			<c:if test="${a.aType=='升职'}">
      			 	<div class="fold-head" style="background-color:#FF8800">
      			</c:if>
      			<c:if test="${a.aType!='升职'}">
      			 	<div class="fold-head" style="background-color:#ffffdd">
      			</c:if>
        			<fmt:formatDate value="${a.aTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
        			由${a.aWname}发送的${a.aType}请求
        			
        		</div>
        		<div class="fold-body">
        			<c:if test="${a.aType=='升职'}">
        			<P>申请职位：${a.aPname}</P>
        			</c:if>
        			<p>陈述内容：${a.aContent}</p>
        			
							<button class="button bg-danger size-small" onclick="noargeeMethod('${a.aWnum}')">拒绝</button>
							
							<c:if test="${a.aType=='升职'}">
							<button class="button bg-success size-small" onclick="upMethod('${a.aWnum}','${a.aPname}')">同意</button>
							</c:if>
							<c:if test="${a.aType=='转正'}">
							<button class="button bg-success size-small" onclick="toworkerMethod('${a.aWnum}')">同意</button>
							</c:if>
        			
        		</div>
      		</div>
      	</c:forEach>
     		 
    </div>
 </div>
</body>
<script type="text/javascript">
	//升职请求同意
	function upMethod(wNum,pName){
		if(confirm("确认同意？")){
		$.ajax({
			 url:"<%=basePath%>/ssm/worker/updateworker",
			 type:"post",
			 data:{
				 wNum:wNum,
				 wPname:pName,
			 },
			 success:function(data){
				 if(data>0){
					 //该员工职位修改成功，调用修改事务表的方法
					 argeeMethod(wNum);
					
				 
				 }else{
					 alert("修改失败");
				 }
				 
			 },
			 error:function(data){
				 alert("修改请求失败");
			 }
		 })
		 }
	}
	//转正请求同意
	function toworkerMethod(wNum){
		if(confirm("确认转正该员工？")){
			$.ajax({
				 url:"<%=basePath%>/ssm/practice/insertpracticeToworker",
				 type:"post",
				 async: false,
				 data:{
					 pNum:wNum
				 },
				 success:function(data){
					//该员工职位修改成功，调用修改事务表的方法
					 argeeMethod(wNum);
					 
				 },
				 error:function(data){
					 alert("修改请求失败");
				 }
			})
		}
		
	}
	//同意请求
	function argeeMethod(wNum){
		$.ajax({
			 url:"<%=basePath%>/ssm/affairs/argeePromotion",
			 type:"post",
			 data:{
				 wNum:wNum,
			 },
			 success:function(data){
				 if(data>0){
					alert("已同意该职员请求！！")
					window.location.reload();
				 
				 }else{
					 alert("修改失败");
				 }
				 
			 },
			 error:function(data){
				 alert("修改请求失败");
			 }
		 })
	}
	//拒绝请求
	function noargeeMethod(wNum){
		if(confirm("确认拒绝？")){
			$.ajax({
				 url:"<%=basePath%>/ssm/affairs/noargeePromotion",
				 type:"post",
				 data:{
					 wNum:wNum,
				 },
				 success:function(data){
					 if(data>0){
						alert("已拒绝该职员请求！！")
						window.location.reload();
					 
					 }else{
						 alert("修改失败");
					 }
					 
				 },
				 error:function(data){
					 alert("修改请求失败");
				 }
			 })
		}
		
	}
$(function(){
    $('#folddemo').fold({
      "toggle":"#folddemo>.fold-item>.fold-head",
      "target":"#folddemo>.fold-item>.fold-body",
      "open":2,
      "show":1
    });
  });
	//页面加载完执行的方法
	$(document).ready(function(){ 
		var num='${fn:length(as)}';
		if(num==0){
			 document.querySelector("#vo").innerHTML="<center>暂无新的事务提交</center>";
		}
	})
</script>
</html>