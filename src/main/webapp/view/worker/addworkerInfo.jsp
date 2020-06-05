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
<title>员工信息注册</title>
<script src="<%=basePath%>/static/js/jquery.js"></script>
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/css/pintuer.css">
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/css/admin.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/bootstrap.min.css">
<script src="<%=basePath%>/static/js/bootstrap.js"></script>
<script src="<%=basePath%>/static/js/pintuer.js"></script>
<script src="<%=basePath%>static/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
					<button class="btn btn-link icon-reply" onclick="history.back()">后退</button>
                    <from>
                    <div  style="text-align: center; margin-top:20px">
					<h4 class="modal-title" id="myLargeModalLabel">员工新增</h4>
				    </div>
					<div class="row">
						<div class="col-md-2" style="text-align: right; margin-top:20px">
							<label style="margin-top: 10px">姓名：</label>
						</div>
						<div class="col-md-6" style="margin-top:20px" style="margin-top:20px">
							<input id="addwiName" type="text" class="input" name="wiName" value="" />
						</div>
						<div class="col-md-4" id="d1" style="margin-top:20px">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right; margin-top:20px">
							<label style="margin-top: 10px">性别：</label>
						</div>
						<div class="col-md-6" style="margin-top:25px">
							 <input type="radio" name="wiSex" id="sex男" value="男">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							 <input type="radio" name="wiSex" id="sex女" value="女">女&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<div class="col-md-4" id="d2" style="margin-top:20px">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right; margin-top:20px">
							<label style="margin-top: 10px">年龄：</label>
						</div>
						<div class="col-md-6" style="margin-top:20px">
							<input id="addwiAge" type="text" class="input" name="wiAge" value="" 
							data-validate="required:必填,number:年龄只能填写数字,compare#<150:年龄介于0-150之间" placeholder="请输入您的年龄" />
						</div>
						<div class="col-md-4" id="d3" style="margin-top:20px">
			  
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right; margin-top:20px">
							<label style="margin-top: 10px">生日：</label>
						</div>
						<div class="col-md-6" style="margin-top:30px">
							<input id="addbirthday" name="wibirthday" value=""  class="Wdate" onFocus="WdatePicker({lang:'zh-cn',dateFmt:'MM-dd'})">
						</div>
						<div class="col-md-4" id="d4" style="margin-top:20px">
			  
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right; margin-top:20px">
							<label style="margin-top: 10px">籍贯：</label>
						</div>
						<div class="col-md-6" style="margin-top:20px">
							<input id="addwiAddress" type="text" class="input" name="wiAddress" value="" />
						</div>
						<div class="col-md-4" id="d4" style="margin-top:20px">
			  
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right; margin-top:20px">
							<label style="margin-top: 10px">毕业院校：</label>
						</div>
						<div class="col-md-6" style="margin-top:20px" style="margin-top:20px">
							<input id="addwiSchool" type="text" class="input" name="wiSchool" value="" />
						</div>
						<div class="col-md-4" id="d1" style="margin-top:20px">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right; margin-top:20px">
							<label style="margin-top: 10px">学历：</label>
						</div>
						<div class="col-md-6" style="margin-top:30px">
							<input type="radio" name="wiEducation" id="edu高中" value="高中">高中&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="wiEducation" id="edu专科" value="专科">专科&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="wiEducation" id="edu本科" value="本科">本科&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="wiEducation" id="edu研究生" value="研究生">研究生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="wiEducation" id="edu博士" value="博士">博士&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<div class="col-md-4" id="d2" style="margin-top:20px">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right; margin-top:20px">
							<label style="margin-top: 10px">专业：</label>
						</div>
						<div class="col-md-6" style="margin-top:20px">
							<input id="addwiSpeciality" type="text" class="input" name="wiSpeciality" value="" />
						</div>
						<div class="col-md-4" id="d3" style="margin-top:20px">
			  
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right; margin-top:20px">
							<label style="margin-top: 10px">语言：</label>
						</div>
						<div class="col-md-6" style="margin-top:30px">
							    <input type="radio" name="wiLanguage" value="CET-6">CET-6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="wiLanguage" value="CET-4">CET-4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="wiLanguage" value="无">无
							
						</div>
						<div class="col-md-4" id="d4" style="margin-top:20px">
			  
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right; margin-top:20px">
							<label style="margin-top: 10px">政治面貌：</label>
						</div>
						<div class="col-md-6" style="margin-top:30px">
							<input type="radio" name="wiBackground" id="bg群众" value="群众">群众&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="wiBackground" id="bg团员" value="团员">团员&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="wiBackground" id="bg党员" value="党员">党员
						</div>
						<div class="col-md-4" id="d4">
			  
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right; margin-top:20px">
							<label style="margin-top: 10px">身份证编号：</label>
						</div>
						<div class="col-md-6" style="margin-top:20px">
							<input id="addIDcard" type="text" class="input" name="IDcard" value="" />
						</div>
						<div class="col-md-4" id="d4" style="margin-top:20px">
			  
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right; margin-top:20px">
							<label style="margin-top: 10px">入职时间：</label>
						</div>
						<div class="col-md-6" style="margin-top:30px">
							<input id="addwiTime" name="wiTime" value=""  class="Wdate" onFocus="WdatePicker({lang:'zh-cn'})">
						</div>
						<div class="col-md-4" id="d4" style="margin-top:20px">
			  
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right; margin-top:20px">
						</div>
						<div class="col-md-6" style="margin-top:20px;text-align: right">
						<button type="button" class="btn btn-default" 
							onclick="backMethod()">退出登记</button>
					    <button type="button" class="btn btn-primary" id="updatebutton"
						onclick="pushData()">提交</button>
						</div>
				     </div>
				     </from>
</body>
<script type="text/javascript">
	function pushData(){
	
		 //获取上面设置后显示的对应的值
		 var wiNum="${wi.wiNum}";
		 var wiName= $("#addwiName").val();
		 var wiSex= $("input[type='radio'][name='wiSex']:checked").val();
		 var wiAge=$("#addwiAge").val();
		 var birthday= $("#addbirthday").val();
		 var wiAddress= $("#addwiAddress").val();
		 var wiSchool=$("#addwiSchool").val();
		 var wiEducation= $("input[type='radio'][name='wiEducation']:checked").val();
		 var wiSpeciality=$("#addwiSpeciality").val();
		 var wiLanguage= $("input[type='radio'][name='wiLanguage']:checked").val();
		 var wiBackground= $("input[type='radio'][name='wiBackground']:checked").val();
		 var IDcard=$("#addIDcard").val();
		 var wiTime=$("#addwiTime").val();
		 var t=new Date(wiTime.replace(/-/g,"/"));
			$.ajax({
				 url:"<%=basePath%>/worker/addworkerInfo",
				 type:"post",
				 data:{
					 wiNum:wiNum,
					 wiName:wiName,
					 wiSex:wiSex,
					 wiAge:wiAge,
					 birthday:birthday,
					 wiAddress:wiAddress,
					 wiSchool:wiSchool,
					 wiEducation:wiEducation,
					 wiSpeciality:wiSpeciality,
					 wiLanguage:wiLanguage,
					 wiBackground:wiBackground,
					 idCard:IDcard,
					 wiTime:t
				 },
				 success:function(data){
					 if(data>0){
						 alert("登记成功");
						 window.location.href="<%=basePath%>/worker/findWorkerInfoById?wNum="+wiNum+"&wName="+wiName+"&wSex="+wiSex;
					 
					 }else{
						 alert("登记失败");
					 }
					 
				 },
				 error:function(data){
					 alert("登记请求失败");
				 }
			 })
		
	}
	function backMethod(){
		if (confirm("您确定要退出吗?")) {
				var url="${url}";
				window.location.href=url;
		}
	}
	//页面加载完执行的方法
		$(document).ready(function(){
			
			var name="${wi.wiName}";
			var sex="${wi.wiSex}";
			var school="${wi.wiSchool}";
			var education="${wi.wiEducation}";
			var speciality="${wi.wiSpeciality}";
			$("[name=wiName]").val(name);
			$("[name=wiName]").attr("readonly",'readonly');
			$("#sex"+sex).prop("checked",true);
			$("[name=wiSex]").prop("disabled",'disabled');
			$("[name=wiSchool]").val(school);
			$("#edu"+education).prop("checked",true);
			$("[name=wiSpeciality]").val(speciality);
	
		})
	//正则匹配
	 $(function(){
		 //当input框改变时会被触发
	    $("input").change(function(){
		            //获取发生更改的input框的id
					var id=$(this).attr("id")
					var myDiv=$(this).parent().parent().children("div.col-md-4");
					
					 
					 if(id=="addwiAge"){
						 var a=$(this).val();
							var regex=/^[2-5][0-9]$/
						if(regex.test(a)==true){
							myDiv.html('<p class="icon-check" style="color:green;margin-top: 10px" >格式正确</p>')
							s();
						 	}else{
							myDiv.html('<p class="icon-exclamation" style="color:red;margin-top: 10px"><span>请输入正确的年龄20-59岁</span></p>')
					 	    e();
						}
						 
					 }
					 if(id=="addwiAddress"){
						 var a=$(this).val();
							var regex=/^[\u4e00-\u9fa5]+[省][\u4e00-\u9fa5][市]|[\u4e00-\u9fa5]+市$/
						if(regex.test(a)==true){
							myDiv.html('<p class="icon-check" style="color:green;margin-top: 10px" >格式正确</p>')
							s();
						 	}else{
							myDiv.html('<p class="icon-exclamation" style="color:red;margin-top: 10px"><span>请输入正确籍贯XX省XX市</span></p>')
					 	    e();
						}
						 
					 }
					 if(id=="addwiSchool"){
						 var a=$(this).val();
							var regex=/^[\u4e00-\u9fa5]+$/
						if(regex.test(a)==true){
							myDiv.html('<p class="icon-check" style="color:green;margin-top: 10px" >格式正确</p>')
							s();
						 	}else{
							myDiv.html('<p class="icon-exclamation" style="color:red;margin-top: 10px"><span>请输入正确的学校，只能输入汉字</span></p>')
					 	    e();
						}
						 
					 }
					 if(id=="addwiSpeciality"){
						 var a=$(this).val();
							var regex=/^[\u4e00-\u9fa5]+$/
						if(regex.test(a)==true){
							myDiv.html('<p class="icon-check" style="color:green;margin-top: 10px" >格式正确</p>')
							s();
						 	}else{
							myDiv.html('<p class="icon-exclamation" style="color:red;margin-top: 10px"><span>请输入正确的专业，只能输入汉字</span></p>')
					 	    e();
						}
						 
					 }
					 if(id=="addIDcard"){
						 var a=$(this).val();
							var regex=/^[0-9]{17}[0-9|X|x]{1}$/
						if(regex.test(a)==true){
							myDiv.html('<p class="icon-check" style="color:green;margin-top: 10px" >格式正确</p>')
							s();
						 	}else{
							myDiv.html('<p class="icon-exclamation" style="color:red;margin-top: 10px"><span>身份证号由17位数字组成，最后一位是数字或者x</span></p>')
					 	    e();
						}
						 
					 }
	            })
	            function s(){
	    	        $('#addbuton').prop("disabled",false)
	    	        $('#updatebutton').prop("disabled",false)
				}
				function e(){
					$('#addbuton').prop("disabled",true)
					$('#updatebutton').prop("disabled",true)
				}

	      })
	</script>

</html>