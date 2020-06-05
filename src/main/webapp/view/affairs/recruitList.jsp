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
<title>简历筛选</title>
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
		<div class="panel admin-panel">  
			<div class="panel-head">
				<strong class="icon-reorder"> 简历筛选</strong> 
				<a href="" style="float: right; display: none;">添加字段</a>
				<button class="btn btn-link icon-reply" onclick="history.back()">后退</button>
				<button class="button win-print icon-print">打印</button>
			</div>
			<table class="table table-hover text-center">
				<div class="col-md-2">
					<img src="<%=basePath%>static/images/我不认识你.gif" id="gifshow">
					<div class="alert text-center" id="giftext">
						你好？
					</div>
			    </div>
				<tbody name="list" id="vo"> 
				<c:forEach items="${rs}" var="rt" varStatus="vs">
					<div class="modal-body col-md-10">

					<div class="row">
					    <div class="col-md-2" >	
						</div>
						<div class="col-md-1" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">姓名：</label>
						</div>
						<div class="col-md-1" style="text-align: left">
							<label id="name"  style="margin-top: 10px;font-size:16px;color: blue">${rt.rName}</label>
						</div>
						<div class="col-md-2" >
						</div>
						<div class="col-md-1" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">性别：</label>
						</div>
						<div>
							<label id="sex" style="margin-top: 10px;font-size:16px">${rt.rSex}</label>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" >	
						</div>
						<div class="col-md-1" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">年龄：</label>
						</div>
						<div class="col-md-1">
							<label id="age" style="margin-top: 10px;font-size:16px">${rt.rAge}</label>
						</div>
						<div class="col-md-2" >	
						</div>
						<div class="col-md-1" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">投递岗位：</label>
						</div>
						<div>
							<label id="pname" style="margin-top: 10px;font-size:16px">${rt.rPname}</label>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" >	
						</div>
						<div class="col-md-1" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">毕业院校：</label>
						</div>
						<div class="col-md-1">
							<label id="school" style="margin-top: 10px;font-size:16px">${rt.rSchool}</label>
						</div>
						<div class="col-md-2" >	
						</div>
						<div class="col-md-1" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">专业：</label>
						</div>
						<div>
							<label id="speciality" style="margin-top: 10px;font-size:16px">${rt.rSpeciality}</label>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" >	
						</div>
						<div class="col-md-1" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">学历：</label>
						</div>
						<div class="col-md-1">
							<label id="education" style="margin-top: 10px;font-size:16px">${rt.rEducation}</label>
						</div>
						<div class="col-md-2" >	
						</div>
						<div class="col-md-1" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">语言：</label>
						</div>
						<div>
							<label id="language" style="margin-top: 10px;font-size:16px">${rt.rLanguage}</label>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" >	
						</div>
						<div class="col-md-1" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">政治面貌：</label>
						</div>
						<div class="col-md-1">
							<label id="background" style="margin-top: 10px;font-size:16px">${rt.rBackground}</label>
						</div>
						<div class="col-md-2" >	
						</div>
						<div class="col-md-1" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">联系电话：</label>
						</div>
						<div>
							<label id="tel" style="margin-top: 10px;font-size:16px">${rt.rTel}</label>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" >	
						</div>
						<div class="col-md-1" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">邮箱：</label>
						</div>
						<div class="col-md-1">
							<label id="email" style="margin-top: 10px;font-size:16px">${rt.rEmail}</label>
						</div>
						<div class="col-md-2" >	
						</div>
						<div class="col-md-1" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">投递时间：</label>
						</div>
						<div>
							<label id="time" style="margin-top: 10px;font-size:16px"><fmt:formatDate value="${rt.rTime}" pattern="yyyy-MM-dd HH-mm-ss"/></label>
					    </div>
					</div>
						<div class="row">
						<div class="col-md-2" >	
						</div>
						<div class="col-md-1" style="text-align: left">
						</div>
						<div class="col-md-1">
						</div>
						<div class="col-md-2" >	
						</div>
						<div class="col-md-1" style="text-align: left">
						</div>
						<div style="text-align: right">
							<button type="button" 
									class="button border-main icon-plus"
									data-toggle="modal" data-target="#intopractice" onclick="setId('${rt.rId}')"  name="add" >录用</button>

								<button class="button border-red icon-trash-o"  onclick="delMethod('${rt.rId}')"> 删除
								</button>
					    </div>
					</div>
					</div>
				 </c:forEach>
				</tbody> 
			</table>
		</div>
		<!-- 分页栏 -->
		  <div style="text-align: center" id="page" >
		    <ul class="pagination">
			<!--  <p style="margin-left: 10%">共${page.pages}页,当前是第${page.pageNum}页</p> -->
			<li><input type="text" placeholder="共${page.pages}页,当前是第${page.pageNum}页" style="width:60%" id="findPage" />
						<button onclick="gotoPage()">跳转</button><li><br>
			<a href="<%=request.getContextPath()%>/${resumes}&page=1" >首页</a>
			<a href="<%=request.getContextPath()%>/${resumes}&page=${page.prePage}">上一页</a>
			<a  href="<%=request.getContextPath()%>/${resumes}&page=${page.pageNum+1}">下一页</a>			
			<a href="<%=request.getContextPath()%>/${resumes}&page=${page.pages}">尾页</a>	
	        </ul> 
	      </div>
	 <!-- 添加实习生 -->
	 <div class="modal fade bs-example-modal-lg" id="intopractice"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog  modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header" style="text-align: center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<h4 class="modal-title" id="myModalLabel">添加实习生</h4>
				</div>

				<div class="modal-body">
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">请设置员工编号：</label>
						</div>
						<div class="col-md-6">
							<input id="pNum" type="text" class="input" name="pNum" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">请安排实习开始时间：</label>
						</div>
						<div class="col-md-6" style="margin-top:10px">
							<input id="pStime"  value=""  class="Wdate" onFocus="WdatePicker({lang:'zh-cn'})">
						</div>
						
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px" >请选择实习结束时间：</label>
						</div>
						<div  class="col-md-6" style="margin-top:10px">
							<input id="pEtime" value=""  class="Wdate" onFocus="WdatePicker({lang:'zh-cn'})">
						</div>
						
					</div>
				</div>

				<div class="modal-footer" style="heght: 50px">
					<a herf="<%=basePath%>customerController/manager/list"><button
							type="button" class="btn btn-default" data-dismiss="modal">关闭</button></a>
					<button type="button" class="btn btn-primary" id="addbutton"
						onclick="pushData()">保存</button>
				</div>

			</div>
		</div>
	</div>
</body>
	<script type="text/javascript">
		//录取简历
		function setId(id){
			$("#pNum").attr("rId",id)
		}
		function pushData(){
			var pNum=$("#pNum").val()
			var pStime=$("#pStime").val()
			var pEtime=$("#pEtime").val()
			var id=$("#pNum").attr("rId")
			var s=new Date(pStime.replace(/-/g,"/"));
			var e=new Date(pEtime.replace(/-/g,"/"));
			$.ajax({
					 url:"<%=basePath%>/resume/setresumetopractice",
					 type:"post",
					 data:{
						pNum:pNum,
						PDnum:id,
						pStime:s,
						pEtime:e
						
					 },
					 success:function(data){
						 if(data>0){
							 alert("录取成功！");
							 window.location.reload();
						 
						 }else{
							 alert("录取失败");
						 }
						 
					 },
					 error:function(data){
						 alert("录取请求失败");
					 }
				 })
			
		}
		//删除简历
		function delMethod(id){
			if(confirm("您确定要删除吗?")){
				$.ajax({
					 url:"<%=basePath%>/resume/deleteresumeById",
					 type:"post",
					 data:{
						rId:id
					 },
					 success:function(data){
						 if(data>0){
							 alert("删除成功！");
							 window.location.reload();
						 
						 }else{
							 alert("删除失败");
						 }
						 
					 },
					 error:function(data){
						 alert("删除请求失败");
					 }
				 })
			}
		}
		 //正则匹配
	 	 $(function(){
	 		 //当input框改变时会被触发
		    $("input").change(function(){
			            //获取发生更改的input框的id
						var id=$(this).attr("id")
						var myDiv=$(this).parent().parent().children("div.col-md-4");
						if(id=="pNum"){
							var a=$(this).val();
								var regex=/^[|0-9|a-z|A-Z]+$/
							if(regex.test(a)==true){
								$.ajax({
									url:"<%=basePath%>/worker/selectwNumList",
									type : "post",
									data : {
									},
									success : function(data) {
										for(var i=0;i<data.length;i++){
									       if(data[i]==a){
									    	   myDiv.html('<p class="icon-exclamation" style="color:red;margin-top: 10px"><span>该员工编号已存在，请重新输入</span></p>')
										 	    e();
									    	   return;
									       }
									    }
									},
									error : function() {
										alert("删除请求失败");
									}

								})
								
								myDiv.html('<p class="icon-check" style="color:green;margin-top: 10px">格式正确</p>')
								s();
							 	}else{
								myDiv.html('<p class="icon-exclamation" style="color:red;margin-top: 10px"><span>只能输入字母，数字</span></p>')
						 	    e();
							}
						}
		    })
            function s(){
    	        $('#addbuton').prop("disabled",false)
			}
			function e(){
				$('#addbuton').prop("disabled",true)
			}

      })
	</script>
</html>