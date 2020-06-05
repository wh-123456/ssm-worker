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
<title>用户注册</title>
<script src="<%=basePath%>/static/js/jquery.js"></script>
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/css/pintuer.css">
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/css/admin.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/bootstrap.min.css">
<script src="<%=basePath%>/static/js/bootstrap.js"></script>
<script src="<%=basePath%>/static/js/pintuer.js"></script>
<script src="<%=basePath%>static/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
                    <from>
                    <div  style="text-align: center; margin-top:20px">
					<h4 class="modal-title" id="myLargeModalLabel">用户注册</h4>
				    </div>
					<div class="row">
						<div class="col-md-2" style="text-align: right; margin-top:20px">
							<label style="margin-top: 10px">请选择用户类型：</label>
						</div>
						<div class="col-md-6" style="margin-top:30px">
							<input type="radio" name="pName" id=2  value="主管">主管&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pName" id=3 value="员工">员工&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="pName" id=4 value="实习生">实习生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							
						</div>
						<div class="col-md-4" id="d1" style="margin-top:20px">
			  				<p style="color:green;margin-top: 10px"><span>请选择用户类型，再进入操作</span></p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right; margin-top:20px">
							<label style="margin-top: 10px">请输入员工编号：</label>
						</div>
						<div class="col-md-6" style="margin-top:25px">
							 <input id="userNum" type="text" class="input" name="userNum" value="" />
						</div>
						<div class="col-md-4" id="d2" style="margin-top:20px">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right; margin-top:20px">
							<label style="margin-top: 10px">请输入员工姓名：</label>
						</div>
						<div class="col-md-6" style="margin-top:25px">
							 <input id="wName" type="text" class="input" name="wName" value="" />
						</div>
						<div class="col-md-4" id="d2" style="margin-top:20px">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right; margin-top:20px">
							<label style="margin-top: 10px">请输入注册用户名：</label>
						</div>
						<div class="col-md-6" style="margin-top:25px">
							 <input id="userName" type="text" class="input" name="userName" value="" />
						</div>
						<div class="col-md-4" id="d2" style="margin-top:20px">
			  				<p style="color:green;margin-top: 10px"><span>请输入只包含数字和大小写字母的用户名</span></p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right; margin-top:20px">
							<label style="margin-top: 10px">请输入密码：</label>
						</div>
						<div class="col-md-6" style="margin-top:20px">
							<input id="userPassword" type="password" class="input" name="userPassword" value="" />
						</div>
						<div class="col-md-4" id="d3" style="margin-top:20px">
			  				<p style="color:green;margin-top: 10px"><span>请输入以大小写字母开头，可包含数字的密码</span></p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right; margin-top:20px">
							<label style="margin-top: 10px">确认密码：</label>
						</div>
						<div class="col-md-6" style="margin-top:20px">
							<input id="userPassword2" type="password" class="input" name="userPassword2" value="" />
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
					    <button type="button" class="btn btn-primary" id="addbuton"
						onclick="pushData()">提交</button>
						</div>
				     </div>
				     </from>
</body>
<script type="text/javascript">
	function pushData(){
	
		 //获取上面设置后显示的对应的值
		 var id= $("input[type='radio'][name='pName']:checked").attr("id");//这是外键的值
		 var userNum= $("#userNum").val();
		 var wName= $("#wName").val();
		 var userName= $("#userName").val();
		 var userpassword=$("#userPassword").val();
			$.ajax({
				 url:"<%=basePath%>/user/addUser",
				 type:"post",
				 data:{
					 uWnum:userNum,
					 uName:userName,
					 uPassword:userpassword,
					 fkRoId:id
				 },
				 success:function(data){
					 if(data>0){
						 alert("注册成功");
						 calTime()
					 
					 }else{
						 alert("注册失败");
					 }
					 
				 },
				 error:function(data){
					 alert("注册请求失败");
				 }
			 })
		
	}
	function calTime(){
	    a=3;
	    go();
	}
	function go(){
	   if(a>=0){
	      document.querySelector("body").innerHTML="<center><b>还剩<span style='color:red'>"+a+"</span>秒，即将跳转至登录页面面</b></center>";
	      a--;
	      setTimeout(go,1000);
	 }else{
		 window.location.href="<%=basePath%>/system/gologin";
	 }
	}
	function backMethod(){
		if (confirm("您确定要退出吗?")) {
				window.location.href="<%=basePath%>/system/gologin";
		}
	}
	 $(function(){
		 //当input框改变时会被触发
	    $("input").change(function(){
	    	var name=$(this).attr("name")
	    	if(name=="pName"){
	    	/*这里设置用户类型被选择后可以输入input框*/
	    	 $("input[type='text']").prop("disabled",false);
	    	 $("input[type='password']").prop("disabled",false);
	    	/*这里设置当用户类型换掉后input里的数据清空*/
	    	 $("[name=userNum]").val(null);
	    	 $("[name=wName]").val(null);
			 $("[name=userName]").val(null);
			 $("[name=userPassword]").val(null);
			 $("[name=userPassword2]").val(null);
	    	}
	    })
	    })
	
	//页面加载完执行的方法
		$(document).ready(function(){
			$("input[type='text']").prop("disabled",true);
			$("input[type='password']").prop("disabled",true);
			$('#addbuton').prop("disabled",true)
		})
	//正则匹配
	 $(function(){
		 /*验证每个正则都匹配才能点击提交按钮*/
			var testNum=0
		 //当input框改变时会被触发
	    $("input").change(function(){
		            //获取发生更改的input框的id
					var id=$(this).attr("id")
					var myDiv=$(this).parent().parent().children("div.col-md-4");
					 if(id=="userNum"){
						 var b=true;
						 var pName=$("input[type='radio'][name='pName']:checked").val();
						 var uWnum=$(this).val();
						 if(pName=="实习生"){
							 $.ajax({
									url:"<%=basePath%>/practice/selectpracticeByNum",
									type : "post",
									//代表按顺序执行
									async: false,
									data : {
										pNum:uWnum
									},
									success : function(data) {
												if(data==''){
													myDiv.html('<p class="icon-exclamation" style="color:red;margin-top: 10px"><span>该实习员工编号不存在</span></p>')
												
													b=false;
												}
									},
									error : function() {
										alert("请求失败")
									}

								})
						 }else
						 if(pName=="主管"){
							 $.ajax({
									url:"<%=basePath%>/worker/getBossList",
									type : "post",
									//代表按顺序执行
									async: false,
									data : {
									},
									success : function(data) {
												
												for(var i=0;i<data.length;i++){
													
													if(data[i].wNum==uWnum){
														b=true;
														return;
													}else{
														b=false
														myDiv.html('<p class="icon-exclamation" style="color:red;margin-top: 10px"><span>该主管编号不存在</span></p>')
														
													}
												}
									},
									error : function() {
										alert("请求失败")
									}

								})
						 }else{
							 $.ajax({
									url:"<%=basePath%>/worker/getpeopleList",
									type : "post",
									//代表按顺序执行
									async: false,
									data : {
									},
									success : function(data) {
		
												for(var i=0;i<data.length;i++){
													if(data[i].wNum==uWnum){
														
														b=true;
														return;
													}else{
														b=false
														myDiv.html('<p class="icon-exclamation" style="color:red;margin-top: 10px"><span>该员工编号不存在</span></p>')
														
													}
												}
									},
									error : function() {
										alert("请求失败")
									}

								})
						 }
						 if(b==false){
							 return
						 }
						 $.ajax({
								url:"<%=basePath%>/user/userList",
								type : "get",
								async: false,
								data : {
								
								},
								success : function(data) {
									for(var i=0;i<data.length;i++){
									       if(data[i]==uWnum){
									    	   myDiv.html('<p class="icon-exclamation" style="color:red;margin-top: 10px"><span>该员工已注册，请返回登录页面找回密码</span></p>')
										 	 
									    	   return;
									       }
									       
									    }
									   testNum+=1
										myDiv.html('<p class="icon-check" style="color:green;margin-top: 10px" >认证通过</p>')
								 	  
									
								},
								error : function() {
								}

							})
						 
					 }
					 if(id=='wName'){
						 var b=true;
						 var pName=$("input[type='radio'][name='pName']:checked").val();
						 var wName=$(this).val();
						 var uWnum=$("#userNum").val()
						 if(pName=="实习生"){
							 $.ajax({
									url:"<%=basePath%>/practice/selectpracticeByNum",
									type : "post",
									//代表按顺序执行
									async: false,
									data : {
										pNum:uWnum
									},
									success : function(data) {
										        var name=data.pName;
												if(name!=wName){
													myDiv.html('<p class="icon-exclamation" style="color:red;margin-top: 10px"><span>姓名错误</span></p>')
													
													b=false;
													return;
												}
									},
									error : function() {
										alert("请求失败")
									}

								})
						 }
						 else{
							 $.ajax({
									url:"<%=basePath%>/worker/selectWorkerbywNum",
									type : "get",
									//代表按顺序执行
									async: false,
									data : {
										wNum:uWnum
									},
									success : function(data) {
										        var name=data.wName;
												if(name!=wName){
													myDiv.html('<p class="icon-exclamation" style="color:red;margin-top: 10px"><span>姓名错误</span></p>')
												
													b=false;
													return;
												}
									},
									error : function() {
										alert("请求失败")
									}

								})
						 }
						 if(b==false){
							 return
						 }
						 testNum+=1
						 myDiv.html('<p class="icon-check" style="color:green;margin-top: 10px" >认证通过</p>')
					 }
					 if(id=="userName"){
						 var a=$(this).val();
						 var regex=/^[a-z|A-Z|0-9]+$/
						 if(regex.test(a)==true){
							       testNum+=1
									myDiv.html('<p class="icon-check" style="color:green;margin-top: 10px" >格式正确</p>')
									
								 	}else{
									myDiv.html('<p class="icon-exclamation" style="color:red;margin-top: 10px"><span>用户名只能包含数字和大小写字母</span></p>')
							 	    
								}
					 }
					 if(id=="userPassword"){
						 var a=$(this).val();
						 var regex=/^[a-z|A-Z]+[a-z|A-Z|0-9]+$/
						 if(regex.test(a)==true){
							 testNum+=1
									myDiv.html('<p class="icon-check" style="color:green;margin-top: 10px" >格式正确</p>')
									
								 	}else{
									myDiv.html('<p class="icon-exclamation" style="color:red;margin-top: 10px"><span>密码以大小写字母开头，可包含数字</span></p>')
							 	   
								}
					 }
					 if(id=="userPassword2"){
						 var a=$(this).val();
						 var b=$("#userPassword").val();
						 if(b==''){
							 alert("您还未输入密码！")
						 }
						if(a==b){
							testNum+=1
							myDiv.html('<p class="icon-check" style="color:green;margin-top: 10px" >格式正确</p>')
							
						 	}else{
							myDiv.html('<p class="icon-exclamation" style="color:red;margin-top: 10px"><span>两次的密码不一致</span></p>')
					 	 
						}
						 
					 }
					if(testNum==5){
						s();
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