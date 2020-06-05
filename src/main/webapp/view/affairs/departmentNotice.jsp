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
<title>部门公告</title>
<script src="<%=basePath%>/static/js/jquery.js"></script>
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/pintuer2.0/pintuer-2.0.css">
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/css/admin.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/fontawesome4.7.0.css">
<script src="<%=basePath%>/static/js/bootstrap.js"></script>
<script src="<%=basePath%>/static/pintuer2.0/pintuer-2.0.min.js"></script>
</head>
<body>
			<div>
				<li> <button type="button" name="add"
							class="button border-main " data-toggle="modal"
							data-target="#adddepartmentnotice"><span class="icon-add-bg"></span> 新增公告</button></li>	</div>	
	<div id="vo" style="margin-top:10px">
	 	<div class="fold fold-arrow" id="folddemo">
      		<div class="fold-item">
      			<c:forEach items="${myNotice}" var="mn">
       		 	<div class="fold-head">
       		 			<fmt:formatDate  value="${mn.aTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
       		 			<c:if test="${userrole==1}">
       		 				${mn.aType}
       		 			</c:if>
       		 	</div>
        	 	<div class="fold-body">
        	 		<p>${mn.aContent}</p>
        	 		<button  class="button  button-small size-small  bg-danger" onclick="deleteNotice(${mn.aNum})" >删除公告</button>
        	 	</div>
        	 	</c:forEach>
      		</div>
     		
    	</div>
      	
     		 
    </div>
    
 <!-- 新增公告 -->
	<div class="modal fade bs-example-modal-lg" id="adddepartmentnotice"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header" style="text-align: center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<h4 class="modal-title" id="myLargeModalLabel">新增公告</h4>
				</div>
				<div class="modal-body">
					<c:if test="${userrole==1 }">
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">请选择接收人：</label>
						</div>
						<div class="col-md-6" style="margin-top:5px">
							<input type="radio" name="peop"  value="主管公告">主管&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="peop"  value="全员公告">全体职员&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<div class="col-md-4" id="d4">
						</div>
					</div>
					</c:if>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">内容：</label>
						</div>
						<div class="col-md-6">
							<textarea id="content" class="input" placeholder="请输入公告内容"></textarea>
						</div>
						<div class="col-md-4" id="d4">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" id="addbuton" class="btn btn-primary" onclick="addnotice()" style="pointer-events：auto;">发布</button>
				</div>

			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	//添加公告
	function addnotice(){
		var content=$("#content").val();
		var name='${name}'
		var dNum="${userDnum}"
		var wNum='${userwNum}'
		var type="公告"
		var kId=${userrole}
		if(kId==1){
			type=$("input[type='radio'][name='peop']:checked").val();
			dNum="boss"
			if(type==null){
				alert("请选择接收人！")
				return;
			}
		}
		if(content==''){
			alert("请输入公告内容！")
			return;
		}
		$.ajax({
			url:"<%=basePath%>/affairs/addAffairs",
			type: "post",
			async: false,
			data : {
				aContent:content,
				aWname:name,
				aNum:wNum,
				aType:type,
				aDnum:dNum,
				
			},
			success : function(data) {
							if(data>0){
								alert("添加成功！")
							}
							window.location.reload();
						},
					error : function() {
						alert("请求失败");
					}
				})
		
	}
	//删除公告
	function deleteNotice(num){
		if (confirm("您确定要删除吗?")) {
		$.ajax({
			url:"<%=basePath%>/affairs/deletepracticeById",
			type: "post",
			async: false,
			data : {
				id:num
			},
			success : function(data) {
							if(data>0){
								alert("删除成功！")
							}
							window.location.reload();
						},
					error : function() {
						alert("请求失败");
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
		var num='${fn:length(myNotice)}';
		if(num==0){
			 document.querySelector("#vo").innerHTML="<center>暂未发布公告</center>";
		}
	})
</script>
</html>