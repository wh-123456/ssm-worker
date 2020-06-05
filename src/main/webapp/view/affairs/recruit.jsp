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
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, customer-scalable=no" />
<meta name="renderer" content="webkit">
<title>招聘信息管理</title>
<script src="<%=basePath%>/static/js/jquery.js"></script>
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/pintuer2.0/pintuer-2.0.css">
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/css/admin.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/fontawesome4.7.0.css">
<script src="<%=basePath%>/static/js/bootstrap.js"></script>
<script src="<%=basePath%>/static/pintuer2.0/pintuer-2.0.min.js"></script>
</head>
<body>
		<div class="padding border-bottom">
					<li><button type="button" name="add"
							class="button border-main " data-toggle="modal"
							data-target="#addrecruit">+新增招聘信息</button></li>
				
			</div>
      <div class="fold" id="fold">
      		<c:forEach items="${affs}" var="rs" >
      		<div class="fold-item">
        		<div class="fold-head">
         			<div class="col-md-1" >
         				<i class="icon-times" style="color: red" onclick="deleteThis('${rs.aNum}')"></i>    
         			</div> 
          	  		<div>
          	  			您于<fmt:formatDate value="${rs.aTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
          	  			发布了<a style="color: blue">${rs.aDname}</a><a style="color: green">${rs.aPname}</a>岗位的招聘信息
          	 		</div>
       
        		</div>
    		</div>
    		</c:forEach>
   	  </div>
<!-- 发布招聘 -->
	<div class="modal fade bs-example-modal-lg" id="addrecruit"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header" style="text-align: center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<h4 class="modal-title" id="myLargeModalLabel">发布招聘</h4>
				</div>

				<div class="modal-body">
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">部门：</label>
						</div>
						<div class="col-md-6">
							<select id="adddepartment"  name="department"  class="input" onchange="pNameMethod()">
								    <option name="addid" value="-1" class="option" >请选择部门</option>
								<c:forEach items="${departs}" var="depart">
									<option name="addid" id="add${depart.dNum}" dName="${depart.dName}"  value="${depart.dNum}" class="option" >${depart.dName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-4" id="d4">
			  
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">请选择岗位：</label>
						</div>
						<div class="col-md-6">
							<select id="pName" name="pName"  class="input">
								<option value ="">请先选择部门</option>
		                    </select>
						</div>
						<div class="col-md-4" id="d4">
			  
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">请输入联系人姓名：</label>
						</div>
						<div class="col-md-6">
							<input id="hrName" type="text" class="input" name="hrName" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">请输入联系人电话：</label>
						</div>
						<div class="col-md-6">
							<input id="hrTel" type="text" class="input" name="hrTel" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" id="addbuton" class="btn btn-primary" onclick="addintoaffairs()" style="pointer-events：auto;">发布</button>
				</div>

			</div>
		</div>
	</div>
</body>
	<script type="text/javascript">
		function deleteThis(aNum){
			if(confirm("确认删除该招聘信息？")){
				$.ajax({
					 url:"<%=basePath%>/affairs/deletepracticeById",
					 type:"post",
					 data:{
						 id:aNum
					 },
					 success:function(data){
							alert("删除成功")
							window.location.reload();
					 },
					 error:function(data){
						 alert("删除请求失败");
					 }
				 })
				
			}
		}
		//发布招聘信息动态变化
		function pNameMethod(){
			var dNum= $("#adddepartment").val();
			var	d=document.querySelector("#pName");
			$.ajax({
				url:"<%=basePath%>/department/selectpNameByNum",
				type: "post",
				async: false,
				data : {dNum:dNum
				},
				success : function(data) {
					
					        		d.innerHTML=""
					        		d.innerHTML+="<option value=''>请选择职位</option>";
					        		for(var i=0;i<data.length;i++){
					        			d.innerHTML+="<option id='pN"+data[i]+"'>"+data[i]+"</option>"
					        			/**var o=document.createElement("option");
										var c=document.createTextNode(data[i]);
										o.appendChild(c);
										d.appendChild(o);*/
										}
							},
						error : function() {
							alert("请求失败");
						}
					})
		}
		//发布招聘信息
		function addintoaffairs(){
			var hrName=$("#hrName").val()
			var hrTel=$("#hrTel").val()
			var wPname=$("#pName option:selected").val();
			var wDnum=$("#adddepartment option:selected").val();
			var dName=$("#adddepartment option:selected").attr("dName");
			$.ajax({
				url:"<%=basePath%>/affairs/addrecruit",
				type: "post",
				async: false,
				data : {
					mDnum:wDnum,
					mPname:wPname,
					aWnum:hrTel,
					aWname:hrName,
					aDnum:wDnum,
					aDname:dName,
					aPname:wPname,
					
				},
				success : function(data) {
								if(data>0){
									alert("发布成功！")
								}
								window.location.reload();
							},
						error : function() {
							alert("请求失败");
						}
					})
		}
		
		//页面加载完执行的方法
		$(document).ready(function(){ 
			var num='${fn:length(affs)}';
			if(num==0){
				 document.querySelector("#fold").innerHTML="<center>暂未发布招聘信息</center>";
			}
		})
	</script>
</html>