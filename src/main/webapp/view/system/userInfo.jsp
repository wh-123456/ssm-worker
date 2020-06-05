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
<title>账号管理</title>
<script src="<%=basePath%>/static/js/jquery.js"></script>
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/css/pintuer.css">
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/css/admin.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/bootstrap.min.css">
<script src="<%=basePath%>/static/js/bootstrap.js"></script>
<script src="<%=basePath%>/static/js/pintuer.js"></script>
<script src="<%=basePath%>static/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
	<div  style="text-align: center; margin-top:20px">
		<div class="row">
						<div class="col-md-2" style="text-align: right; margin-top:20px">
							<label style="margin-top: 10px">您当前用户名为：</label>
						</div>
						<div class="col-md-6" style="margin-top:20px">
							<input id="username" type="text" class="input" name="username" value="${username }" />
						</div>
						<div class="col-md-4" id="d3" style="margin-top:20px">
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right; margin-top:20px">
							<label style="margin-top: 10px">您当前密码为：</label>
						</div>
						<div class="col-md-6" style="margin-top:20px">
							<input id="userpassword" type="text" class="input" name="userpassword" value="${password }" />
						</div>
						<div class="col-md-4" id="d4" style="margin-top:20px">
			  
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right; margin-top:20px">
							
						</div>
						<div class="col-md-6" style="text-align: right;margin-top:20px">
							<button type="button" 
									class="button border-main icon-edit (alias)"
									data-toggle="modal" data-target="#updateuser"  name="update" >修改密码</button>
						</div>
						<div class="col-md-4" id="d4" style="margin-top:20px">
			  
						</div>
					</div>
	</div>
<!--updateuser -->
	<div class="modal fade bs-example-modal-lg" id="updateuser"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header" style="text-align: center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<h4 class="modal-title" id="myLargeModalLabel">修改密码</h4>
				</div>

				<div class="modal-body">

					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">请输入新密码：</label>
						</div>
						<div class="col-md-6">
							<div class="form-group">
								<div class="field field-icon-right">
									<input type="password" class="input input-big" name="password" id="password"
										placeholder="登录密码" data-validate="required:请填写密码" /> <span
									onclick="passwordShow()"	class="icon icon-key margin-small"></span>
								</div>
							</div>
						</div>
						<div class="col-md-4" id="d1">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">确认密码：</label>
						</div>
						<div class="col-md-6">
							<input id="password2" type="password" placeholder="确认密码"  class="input" name="password2" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" id="updatebuton" class="btn btn-primary" disabled="disabled" onclick="updateuserPassword()" style="pointer-events：auto;">保存</button>
				</div>

			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	function passwordShow(){
		var b=$("#password").attr("type")
		if(b=='password'){
			$("#password").attr("type",'text')
		}else{
			$("#password").attr("type",'password')
		}
	}
	//修改用户密码
	function updateuserPassword(){
		var wNum='${userwNum}'
		var password=$("#password").val()
		var wName='${username}'
		 $.ajax({
				url:"<%=basePath%>/user/updatePasswordBywNum",
				type : "post",
				//代表按顺序执行
				async: false,
				data : {
					uWnum:wNum,
					uName:wName,
					uPassword:password
				},
				success : function(data) {
							if(data>0){
								alert("修改成功!请重新登录")
								window.location.href="<%=basePath%>/system/gologin";
							}else{
								alert("修改失败！")
							}
				},
				error : function() {
					alert("请求失败")
				}

			})
	}
	//正则匹配
	 $(function(){
		 /*验证每个正则都匹配才能点击提交按钮*/
			var testNum=0
		 //当input框改变时会被触发
	    $("input").change(function(){
		            //获取发生更改的input框的id
					var id=$(this).attr("id")
					
					 if(id=="password"){
						 var myDiv=document.querySelector("#d1")
						 myDiv.innerHTML=''
						 var a=$(this).val();
						 var regex=/^[a-z|A-Z]+[a-z|A-Z|0-9]+$/
							 if(regex.test(a)==true){
								 		testNum+=1
										myDiv.innerHTML+='<p class="icon-check" style="color:green;margin-top: 10px" >格式正确</p>';
										
									 	}else{
										myDiv.innerHTML+='<p class="icon-exclamation" style="color:red;margin-top: 10px"><span>密码以大小写字母开头，可包含数字</span></p>'
								 	   e();
									}
					 }else
					 if(id=="password2"){
						 var myDiv=document.querySelector("#d2")
						  myDiv.innerHTML=''
						 var a=$(this).val();
						 var b=$("#password").val();
						 if(b==''){
							 alert("您还未输入密码！")
						 }
						if(a==b){
							testNum+=1
							myDiv.innerHTML+='<p class="icon-check" style="color:green;margin-top: 10px" >格式正确</p>'
							
						 	}else{
						 	
						 	myDiv.innerHTML+='<p class="icon-exclamation" style="color:red;margin-top: 10px"><span>两次的密码不一致</span></p>'
						 	e();
						 	return;
						}
					 }
					if(testNum==2){
						s();
					} 
	            })
	            function s(){
	    	        $('#updatebuton').prop("disabled",false)
	    	      
				}
				function e(){
				   $('#updatebuton').prop("disabled",true)
				
				}
	 })
</script>
</html>