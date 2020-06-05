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
<title>事务请求界面</title>
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
	<div id="workerpromotion">
	  		<c:if test="${aff.aState=='已同意'}">
	  			 <div class="alert alert-inline alert-success">
      					<i class="icon-times" data-dismiss="alert" onclick="deleteMethod()"></i>
      					<i class="icon-success-bg text-success"></i>
      				<div class="alert-body">
        				<strong>成功</strong>
       				 <p>您于<fmt:formatDate value="${aff.aTime}" pattern="yyyy-MM-dd HH:mm:ss"/>发送的${aff.aType}请求，部门主管已同意!
       				 <c:if test="${aff.aType=='转正'}">
       				 	请尽快完善员工个人信息。
       				 </c:if>
       				 </p>
      					
      				</div>
						
    			</div>
	  		</c:if>
	  		<c:if test="${aff.aState=='不同意'}">
	  		 	<div class="alert alert-warning">
      					<i class="icon-times" data-dismiss="alert" onclick="deleteMethod()"></i>
      					<strong class="text-warning">失败：</strong>
      					<p>您于<fmt:formatDate value="${aff.aTime}" pattern="yyyy-MM-dd HH:mm:ss"/>发送的${aff.aType}请求，部门主管已拒绝!</p>
   				 </div>
	  		</c:if>
	  		<c:if test="${aff.aState=='未审核'}">
	  		 	<div class="alert alert-info">
           				<i class="icon-times" data-dismiss="alert"></i>
      				    <strong class="text-info">未处理：</strong>
      				    <p>您于<fmt:formatDate value="${aff.aTime}" pattern="yyyy-MM-dd HH:mm:ss"/>发送的${aff.aType}请求，部门主管暂未审核</p>
    			</div>
	  		</c:if>
	</div>
	<c:if test="${aff.aWnum==null}">
  <button class="button button-block text-main" data-toggle="modal"
			id="workerandpractice" name="worker"	 data-target="#workerpromoted">+</button></c:if>
  <!-- 员工升职请求模态框 -->
	<div class="modal fade bs-example-modal-lg" id="workerpromoted"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header" style="text-align: center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<h4 class="modal-title" id="myLargeModalLabel">升职请求</h4>
				</div>

				<div class="modal-body">
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">您当前所在部门：</label>
						</div>
						<div class="col-md-6">
							<input id="adddNum" type="text" class="input" disabled="disabled" value="${userDname}" />
						</div>
						<div class="col-md-4" id="d1">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">您当前的职位为：</label>
						</div>
						<div class="col-md-6">
							<input id="adddNum" type="text" class="input" disabled="disabled" value="${userPname}" />
						</div>
						<div class="col-md-4" id="d1">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">可更改的职位有：</label>
						</div>
						<div class="col-md-6" id="pName" style="margin-top:5px">
						</div>
						<div class="col-md-4"  >
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">请输入您的理由：</label>
						</div>
						<div class="col-md-6">
							<textarea id="content" class="input" placeholder="多行输入框"></textarea>
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" id="addbuton" class="btn btn-primary" onclick="addaffairs()" style="pointer-events：auto;">提交</button>
				</div>

			</div>
		</div>
	</div>
<!-- 实习生转正请求模态框 -->
	<div class="modal fade bs-example-modal-lg" id="practicepromoted"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header" style="text-align: center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<h4 class="modal-title" id="myLargeModalLabel">转正请求</h4>
				</div>

				<div class="modal-body">
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">您当前所在部门：</label>
						</div>
						<div class="col-md-6">
							<input id="dNum" type="text" class="input" disabled="disabled" value="${userDname}" />
						</div>
						<div class="col-md-4" id="d1">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">您的实习编号为：</label>
						</div>
						<div class="col-md-6">
							<input id="pNum" type="text" class="input" disabled="disabled" value="${userwNum}" />
						</div>
						<div class="col-md-4" id="d1">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">请输入您的理由：</label>
						</div>
						<div class="col-md-6">
							<textarea id="content2" class="input" placeholder="多行输入框"></textarea>
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" id="addbuton" class="btn btn-primary" onclick="addintoworker()" style="pointer-events：auto;">提交</button>
				</div>

			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
function deleteMethod(){
	var wNum='${userwNum}'
	$.ajax({
		 url:"<%=basePath%>/affairs/deletepracticeByNum",
		 type:"post",
		 data:{
			 wNum:wNum
		 },
		 success:function(data){
			if(data>0){
				alert("该条记录已被删除")
				window.location.reload();
			}
			 
			 
		 },
		 error:function(data){
			 alert("查询请求失败");
		 }
	 })
}

		/*提交升职请求*/
		//显示可选择职位
		$(document).on('click',"button[name='worker']",function(){
			var dNum='${userDnum}'
			var pName='${userPname}'
			var p=document.querySelector("#pName");
			$.ajax({
				 url:"<%=basePath%>/department/selectpNameByNum",
				 type:"post",
				 data:{
					 dNum:dNum
				 },
				 success:function(data){
					 p.innerHTML=''
					for(var i=0;i<data.length;i++){
						if(data[i]!=pName && data[i]!='主管'){
						p.innerHTML+="<input type='radio' name='departName' value="+data[i]+">"+data[i]+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp";
						}
					}
					 
					 
				 },
				 error:function(data){
					 alert("查询请求失败");
				 }
			 })
	
		})
		//提交
		function addaffairs(){
			var wNum='${aff.aWnum}';
			if(wNum!=''){
				alert("您已经申请过升职，请静待回复！")
				return;
			}
			var type="升职"
			var dNum='${userDnum}'
			var wNum='${userwNum}'
			var wName='${name}'
			var countent=$("#content").val()
			var pName=$("input[type='radio'][name='departName']:checked").val();
			$.ajax({
				 url:"<%=basePath%>/affairs/addAffairs",
				 type:"post",
				 data:{
					 aType:type,
					 aDnum:dNum,
					 aWnum:wNum,
					 aWname:wName,
					 aContent:countent,
					 aPname:pName,
					 aState:"未审核"
				 },
				 success:function(data){
						if(data>0){
							alert("提交成功")
							window.location.reload();
						}else{
							alert("提交失败")
						}
					 
					 
				 },
				 error:function(data){
					 alert("提交失败！！！");
				 }
			 })
		}
	/*提交转正请求*/
	function addintoworker(){
		var wNum='${aff.aWnum}';
		if(wNum!=''){
			alert("您已经申请过转正，请静待回复！")
			return;
		}
		var dNum='${userDnum}'
		var type="转正"
		var wNum='${userwNum}'
		var wName='${name}'
		var countent=$("#content2").val()
		$.ajax({
			 url:"<%=basePath%>/affairs/addAffairs",
			 type:"post",
			 data:{
				 aType:type,
				 aDnum:dNum,
				 aWname:wName,
				 aWnum:wNum,
				 aContent:countent,
				 aState:"未审核"
			 },
			 success:function(data){
					if(data>0){
						alert("提交成功")
						window.location.reload();
					}else{
						alert("提交失败")
					}
				 
				 
			 },
			 error:function(data){
				 alert("提交失败！！！");
			 }
		 })
	}
	
	//页面加载完执行的方法
	$(document).ready(function(){ 
	var roleId=${userrole};
	var wNum='${aff.aWnum}';
	if(wNum==''){
		if(roleId==3){
			document.querySelector("#workerpromotion").innerHTML="<h2 style='text-align: center'>您还未有过申请升职</h2>";
		}else{
			document.querySelector("#workerpromotion").innerHTML="<h2 style='text-align: center'>您还未申请转正</h2>";
			$("#workerandpractice").attr("data-target","#practicepromoted")
		}
	}else if(roleId==4){
		$("#workerandpractice").attr("data-target","#practicepromoted")
	}
	})
</script>
</html>