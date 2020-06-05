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
<title>实习员工信息</title>
<script src="<%=basePath%>/static/js/jquery.js"></script>
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/css/pintuer.css">
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/css/admin.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/My97DatePicker/skin/WdatePicker.css">
<script src="<%=basePath%>/static/js/bootstrap.js"></script>
<script src="<%=basePath%>/static/js/pintuer.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<div>
		<div class="padding border-bottom">
				<ul class="search" style="padding-left: 10px;">
	
					<li><button type="button" 
									class="button border-main icon-edit (alias)"
									data-toggle="modal" data-target="#updatePractice"  name="update" >修改</button></li>
				</ul>
				
		</div>
		<h1 class="text-center">你好,${pInfo.pName }!</h1>
		<div class="col-md-2 ">
				<img src="<%=basePath%>static/images/骚包.gif" id="gifshow">
				<div class="alert text-center" id="giftext">
					明天就走上人生巅峰！
				</div>
			    </div>
		<div class="keypoint bg-blue bg-inverse radius  col-md-10">
    			<div class="row">
					    <div class="col-md-2" >	
						</div>
						<div class="col-md-2" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">实习编号：</label>
						</div>
						<div class="col-md-2" style="text-align: left">
							<label  style="margin-top: 10px;font-size:16px">${pInfo.pNum}</label>
						</div>
						<div class="col-md-2" >
						</div>
						<div class="col-md-2" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">性别：</label>
						</div>
						<div>
							<label style="margin-top: 10px;font-size:16px">${pInfo.pSex}</label>
						</div>
				</div>
				<div class="row">
					    <div class="col-md-2" >	
						</div>
						<div class="col-md-2" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">部门编号：</label>
						</div>
						<div class="col-md-2" style="text-align: left">
							<label  style="margin-top: 10px;font-size:16px">${pInfo.pDnum}</label>
						</div>
						<div class="col-md-2" >
						</div>
						<div class="col-md-2" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">部门名称：</label>
						</div>
						<div>
							<label style="margin-top: 10px;font-size:16px">${pInfo.pDname}</label>
						</div>
				</div>
				<div class="row">
					    <div class="col-md-2" >	
						</div>
						<div class="col-md-2" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">毕业院校：</label>
						</div>
						<div class="col-md-2" style="text-align: left">
							<label  style="margin-top: 10px;font-size:16px">${pInfo.pSchool}</label>
						</div>
						<div class="col-md-2" >
						</div>
						<div class="col-md-2" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">学历：</label>
						</div>
						<div>
							<label style="margin-top: 10px;font-size:16px">${pInfo.pEducation}</label>
						</div>
				</div>
				<div class="row">
					    <div class="col-md-2" >	
						</div>
						<div class="col-md-2" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">专业：</label>
						</div>
						<div class="col-md-2" style="text-align: left">
							<label  style="margin-top: 10px;font-size:16px">${pInfo.pSpeciality}</label>
						</div>	
						
				</div>
				<div class="row">
					    <div class="col-md-2" >	
						</div>
						<div class="col-md-2" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">实习开始时间：</label>
						</div>
						<div class="col-md-2" style="text-align: left">
							<label  style="margin-top: 10px;font-size:16px"><fmt:formatDate value="${pInfo.pStime}" pattern="yyyy-MM-dd"/></label>
						</div>	
						<div class="col-md-2" >
						</div>
						<div class="col-md-2" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">实习结束时间：</label>
						</div>
						<div>
							<label style="margin-top: 10px;font-size:16px"><fmt:formatDate value="${pInfo.pEtime}" pattern="yyyy-MM-dd"/></label>
						</div>
				</div>		
		</div>

</div>
<!-- updatePractice -->
	 <div class="modal fade bs-example-modal-lg" id="updatePractice"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog  modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header" style="text-align: center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<h4 class="modal-title" id="myModalLabel">实习生修改</h4>
				</div>

				<div class="modal-body">
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">姓名：</label>
						</div>
						<div class="col-md-6">
							<input id="updatepName" type="text"  class="input" name="updatepName" value="${pInfo.pName }" />
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">性别：</label>
						</div>
						<div class="col-md-6" style="margin-top:5px">
							<input type="radio" name="updatepSex" id="updatesex男" value="男">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="updatepSex" id="updatesex女" value="女">女&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<div class="col-md-4" id="d3">
			  
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">毕业学校：</label>
						</div>
						<div class="col-md-6">
							<input id="updatepSchool" type="text"  class="input" name="updatepSchool" value="${pInfo.pSchool }" />
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">专业：</label>
						</div>
						<div class="col-md-6">
							<input id="updatepSpeciality" type="text"  class="input" name="updatepSpeciality" value="${pInfo.pSpeciality }" />
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">学历：</label>
						</div>
						<div class="col-md-6" style="margin-top: 10px">
							<input type="radio" name="updatepEducation" id="updateedu高中" value="高中">高中&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="updatepEducation" id="updateedu专科" value="专科">专科&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="updatepEducation" id="updateedu本科" value="本科">本科&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="updatepEducation" id="updateedu研究生" value="研究生">研究生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="updatepEducation" id="updateedu博士" value="博士">博士&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
				</div>

				<div class="modal-footer" style="heght: 50px">
					<button
							type="button" class="btn btn-default" data-dismiss="modal">关闭</button></a>
					<button type="button" class="btn btn-primary" id="updatebutton"
						onclick="pushData()">保存</button>
				</div>

			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
//修改实习生
$(document).on('click',"button[name='update']",function(){ 
			 var pSex='${pInfo.pSex}'
			 var pEducation='${pInfo.pEducation}'
			 //将上面获取到自身的原本信息显示在修改框
			 $("#updatesex"+pSex).prop("checked",true);
			 $("#updateedu"+pEducation).prop("checked",true);
			 
		})
function pushData(){
	 //获取上面存入的pNum
	 var pNum='${pInfo.pNum}'
	 //获取上面修改后的值
	 var pName=$("[name=updatepName]").val();
	 var pSex=$("input[type='radio'][name='updatepSex']:checked").val();
	 var pSchool=$("[name=updatepSchool]").val();
	 var pEducation=$("input[type='radio'][name='updatepEducation']:checked").val();
	 var pSpeciality=$("[name=updatepSpeciality]").val();
	 var pDnum='${pInfo.pDnum}'
	 var pStime='${pInfo.pStime}'
	 var pEtime='${pInfo.pEtime}'
	  $.ajax({
			 url:"<%=basePath%>/practice/updatepractice",
			 type:"post",
			 async: false,
			 data:{
				 pNum:pNum,
				 pName:pName,
				 pSex:pSex,
				 pSchool:pSchool,
				 pEducation:pEducation,
				 pSpeciality:pSpeciality,
				 pDnum:pDnum,
				 pStime:pStime,
				 pEtime:pEtime
			 },
			 success:function(data){
				 if(data>0){
					 
					 alert("修改成功");
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
</script>
</html>