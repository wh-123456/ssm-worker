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
<title>员工信息</title>
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
				<strong class="icon-reorder"> 员工信息</strong> 
				<a href="" style="float: right; display: none;">添加字段</a>
				<button class="btn btn-link icon-reply" onclick="history.back()">后退</button>
			</div>
			<div class="padding border-bottom">
				<ul class="search" style="padding-left: 10px;">
					<c:if test="${userrole==1 or wNum!=userwNum}">
					<li><button type="button" 
									class="button border-main icon-edit (alias)"
									  data-toggle="modal" data-target="#updateWorkerInfo"  name="update" >修改</button></li>
					</c:if>
					<!-- <a class="button border-main icon-plus-square-o"
						href="<%=basePath%>view/system/role/addRole.jsp"> 增加</a> -->
						<li id="select"><input type="text" placeholder="请输入员工姓名或编号"  id="findPer" />
						<button onclick="findWorkerInfo()" class="button border-blue" >
						<span class="icon-search">员工查询</span></button></li>
				</ul>
				
			</div>
			<div style="text-align: center"><a id="finaMon" style="color:orange" onclick="goHistory()" title="点击查看详情"></a></div>
			<table class="table table-hover text-center">
				
				<c:forEach items="${wis}" var="st" varStatus="vs">
				<div class="col-md-2">
					<img src="<%=basePath%>static/images/我不认识你.gif" id="gifshow">
					<div class="alert text-center" id="giftext">
						你好？
					</div>
			    </div>
				<tbody name="list" id="vo"> 
					<div class="modal-body col-md-8">

					<div class="row">
					    <div class="col-md-1" >	
						</div>
						<div class="col-md-2" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">姓名：</label>
						</div>
						<div class="col-md-2" style="text-align: left">
							<label id="wiName" num="${st.wiNum}" style="margin-top: 10px;font-size:16px;color: blue">${st.wiName}</label>
						</div>
						<div class="col-md-1" >
						</div>
						<div class="col-md-2" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">性别：</label>
						</div>
						<div>
							<label id="wiSex" style="margin-top: 10px;font-size:16px">${st.wiSex}</label>
						</div>
					</div>
					<div class="row">
						<div class="col-md-1" >	
						</div>
						<div class="col-md-2" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">年龄：</label>
						</div>
						<div class="col-md-2">
							<label id="wiAge" style="margin-top: 10px;font-size:16px">${st.wiAge}</label>
						</div>
						<div class="col-md-1" >	
						</div>
						<div class="col-md-2" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">籍贯：</label>
						</div>
						<div>
							<label id="wiAddress" style="margin-top: 10px;font-size:16px">${st.wiAddress}</label>
						</div>
					</div>
					<div class="row">
						<div class="col-md-1" >	
						</div>
						<div class="col-md-2" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">毕业院校：</label>
						</div>
						<div class="col-md-2">
							<label id="wiSchool" style="margin-top: 10px;font-size:16px">${st.wiSchool}</label>
						</div>
						<div class="col-md-1" >	
						</div>
						<div class="col-md-2" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">专业：</label>
						</div>
						<div>
							<label id="wiSpeciality" style="margin-top: 10px;font-size:16px">${st.wiSpeciality}</label>
						</div>
					</div>
					<div class="row">
						<div class="col-md-1" >	
						</div>
						<div class="col-md-2" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">学历：</label>
						</div>
						<div class="col-md-2">
							<label id="wiEducation" style="margin-top: 10px;font-size:16px">${st.wiEducation}</label>
						</div>
						<div class="col-md-1" >	
						</div>
						<div class="col-md-2" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">语言：</label>
						</div>
						<div>
							<label id="wiLanguage" style="margin-top: 10px;font-size:16px">${st.wiLanguage}</label>
						</div>
					</div>
					<div class="row">
						<div class="col-md-1" >	
						</div>
						<div class="col-md-2" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">生日：</label>
						</div>
						<div class="col-md-2">
							<label id="birthday" style="margin-top: 10px;font-size:16px">${st.birthday}</label>
						</div>
						<div class="col-md-1" >	
						</div>
						<div class="col-md-2" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">身份证编号：</label>
						</div>
						<div>
							<label id="idCard" style="margin-top: 10px;font-size:16px">${st.idCard}</label>
						</div>
					</div>
					<div class="row">
						<div class="col-md-1" >	
						</div>
						<div class="col-md-2" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">政治面貌：</label>
						</div>
						<div class="col-md-2">
							<label id="wiBackground" style="margin-top: 10px;font-size:16px">${st.wiBackground}</label>
						</div>
						<div class="col-md-1" >	
						</div>
						<div class="col-md-2" style="text-align: left">
							<label style="margin-top: 10px;font-size:16px">入职时间：</label>
						</div>
						<div>
							<label id="wiTime" style="margin-top: 10px;font-size:16px"><fmt:formatDate value="${st.wiTime}" pattern="yyyy-MM-dd"/></label>
					    </div>
					</div>
					</div>
					<div class="col-md-2 card" style="width:16rem;">
      					<img class="card-media" style="width:16rem;height:16rem" 
      					   src="<%=basePath%>static/images/userImage/${st.wiNum}.jpg" 
      					   onclick="openuploadMethod('${st.wiNum}')" alt="未上传头像" 
      					   onerror="javascript:this.src='<%=basePath%>static/images/userImage/未上传.jpg'" />
      					    <div class="card-body" id="upbutton" style="display:none">
      					    <form id="fileform" method="post" enctype="multipart/form-data">
									<input id="upload" name="uploadfile" style="color:blue"  type="file" >
      					    		<button  class="icon-cloud-upload" onclick="uploadMethod()">点击上传</button>
							</form>	
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
			<a href="<%=request.getContextPath()%>/${parameter}&page=1" >首页</a>
			<a href="<%=request.getContextPath()%>/${parameter}&page=${page.prePage}">上一页</a>
			<a  href="<%=request.getContextPath()%>/${parameter}&page=${page.pageNum+1}">下一页</a>			
			<a href="<%=request.getContextPath()%>/${parameter}&page=${page.pages}">尾页</a>	
	        </ul> 
	      </div>
	

	
	<!-- updateWorkerInfo -->
	 <div class="modal fade bs-example-modal-lg" id="updateWorkerInfo"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog  modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header" style="text-align: center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<h4 class="modal-title" id="myModalLabel">信息修改</h4>
				</div>

				<div class="modal-body">
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">姓名：</label>
						</div>
						<div class="col-md-6">
							<input id="updatewiName" type="text" class="input" name="updatewiName" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">性别：</label>
						</div>
						<div class="col-md-6" style="margin-top:5px">
							<input type="radio" name="wiSex" id="sex男" value="男">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="wiSex" id="sex女" value="女">女&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">年龄：</label>
						</div>
						<div class="col-md-6">
							<input id="updatewiAge" type="text" class="input" name="updatewiAge" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">籍贯：</label>
						</div>
						<div class="col-md-6">
							<input id="updatewiAddress" type="text" class="input" name="updatewiAddress" value="" />	
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">毕业院校：</label>
						</div>
						<div class="col-md-6">
							<input id="updatewiSchool" type="text" class="input" name="updatewiSchool" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">专业：</label>
						</div>
						<div class="col-md-6">
							<input id="updatewiSpeciality" type="text" class="input" name="updatewiSpeciality" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">学历：</label>
						</div>
						<div class="col-md-6" style="margin-top:10px">
							<input type="radio" name="updatewiEducation" id="edu高中" value="高中">高中&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="updatewiEducation" id="edu专科" value="专科">专科&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="updatewiEducation" id="edu本科" value="本科">本科&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="updatewiEducation" id="edu研究生" value="研究生">研究生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="updatewiEducation" id="edu博士" value="博士">博士&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">语言：</label>
						</div>
						<div class="col-md-6" style="margin-top:10px">
							<input type="radio" name="wiLanguage" id="lgCET-6" value="CET-6">CET-6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="wiLanguage" id="lgCET-4" value="CET-4">CET-4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="wiLanguage" id="lg无" value="无">无
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">生日：</label>
						</div>
						<div class="col-md-6" style="margin-top:10px">
							<input id="updatebirthday"  name="updatebirthday" value=""  class="Wdate" onFocus="WdatePicker({lang:'zh-cn',dateFmt:'MM-dd'})">
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">身份证编号：</label>
						</div>
						<div class="col-md-6">
							<input id="updateidCard" type="text" class="input" name="updateidCard" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">政治面貌：</label>
						</div>
						<div class="col-md-6" style="margin-top:10px">
							<input type="radio" name="updatewiBackground" id="bg群众" value="群众">群众&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="updatewiBackground" id="bg团员" value="团员">团员&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="updatewiBackground" id="bg党员" value="党员">党员
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px" >入职时间：</label>
						</div>
						<div class="col-md-6" style="margin-top:10px">
							<input id="updatewiTime" name="updatewiTime" value=""  class="Wdate" onclick="WdatePicker({lang:'zh-cn'})">
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
				</div>

				<div class="modal-footer" style="heght: 50px">
					<a herf="<%=basePath%>customerController/manager/list"><button
							type="button" class="btn btn-default" data-dismiss="modal">关闭</button></a>
					<button type="button" class="btn btn-primary" id="updatebutton"
						onclick="pushData(${page.pageNum})">保存</button>
				</div>

			</div>
		</div>
	</div>

</body>

	<script type="text/javascript">
	//打开文件上传界面
	function openuploadMethod(wNum){
		var uNum="${userwNum}";
		if(wNum!=uNum){
			return;
		}
		document.getElementById('upload').click();
		$("#upbutton").show();
	}
	//上传头像
	function uploadMethod(){
		var form = new FormData(document.getElementById("fileform"));
	    $.ajax({
	        type:"post",
	        url:"<%=basePath%>/worker/upload",
	        data:form,
	        processData:false,
	        contentType:false,
	        async: false,
	        dataType:'text',
	        success:function(data){
	                if(data>0){
	                	alert("上传成功")
						window.location.reload();
	                	return;
	                }
	                alert("请选择文件")
	        }
	    });
	}
	//页面跳转
	function gotoPage(){
		var page=$("#findPage").val()
		var num=/^[0-9]+$/
		if(num.test(page)){
			window.location.href="<%=request.getContextPath()%>/${parameter}&page="+page;
		}else{
			alert("请输入正整数")
		}
	}
	//跳转到记录表
	function goHistory(){
		var wiNum=$("#wiName").attr("num");
		window.location.href="<%=basePath%>/money/findHistoryByNum?hNum="+wiNum+"&hContent=本月";
	}
	//员工信息模糊查询
	function findWorkerInfo(){
		var name=$("#findPer").val();
		if(name!=""){
			<%String dNum= request.getParameter("wiDnum");//用request得到路径上的参数%>
			var dNum='<%=dNum%>';
			window.location.href="<%=basePath%>/worker/findWorkerInfoByIdOrName?"+"wiName="+name+"&wiDnum="+dNum;
			alert("查询成功");			
		}
	}
	   
		
		//修改员工信息
		//使用ajax刷新后获取button点击事件要使用.on('click','#XXX',function(){})
		$(document).on('click',"button[name='update']",function(){
			 var wiName=$(this).parents().find("#wiName").text();
			 var wiSex=$(this).parents().find("#wiSex").text();
			 var wiAge=$(this).parents().find("#wiAge").text();
			 var wiAddress=$(this).parents().find("#wiAddress").text();
			 var wiSchool=$(this).parents().find("#wiSchool").text();
			 var wiSpeciality=$(this).parents().find("#wiSpeciality").text();
			 var wiEducation=$(this).parents().find("#wiEducation").text();
			 var wiLanguage=$(this).parents().find("#wiLanguage").text();
			 var birthday=$(this).parents().find("#birthday").text();
			 var idCard=$(this).parents().find("#idCard").text();
			 var wiBackground=$(this).parents().find("#wiBackground").text();
			 var wiTime=$(this).parents().find("#wiTime").text();
			 //将上面获取到自身的原本信息显示在修改框
			 $("[name=updatewiName]").val(wiName);
			 $("#sex"+wiSex).attr("checked",true);
			 $("[name=updatewiAge]").val(wiAge);
			 $("[name=updatewiAddress]").val(wiAddress);
			 $("[name=updatewiSchool]").val(wiSchool);
			 $("[name=updatewiSpeciality]").val(wiSpeciality);
			 $("#edu"+wiEducation).prop("checked",true);
			 $("#lg"+wiLanguage).prop("checked",true);
			 $("[name=updatebirthday]").val(birthday);
			 $("[name=updateidCard]").val(idCard);
			 $("#bg"+wiBackground).prop("checked",true);
			 $("[name=updatewiTime]").val(wiTime);
			 
		})
		function pushData(pageNum){
			 //获取上面设置的员工编号属性的值
			 var wiNum=$("#wiName").attr("num");
			 //获取上面设置后显示的对应的值
			 var wiName= $("#updatewiName").val();
			 var wiSex=$("input[type='radio'][name='wiSex']:checked").val();
			 var wiAge= $("#updatewiAge").val();
			 var wiAddress= $("#updatewiAddress").val();
			 var wiSchool=$("#updatewiSchool").val();
			 var wiSpeciality= $("#updatewiSpeciality").val();
			 var wiEducation=$("input[type='radio'][name='updatewiEducation']:checked").val();
			 var wiLanguage=$("input[type='radio'][name='wiLanguage']:checked").val();
			 var birthday= $("#updatebirthday").val();
			 var idCard=$("#updateidCard").val();
			 var wiBackground= $("input[type='radio'][name='updatewiBackground']:checked").val();
			 var wiTime=$("#updatewiTime").val();
			 var t=new Date(wiTime.replace(/-/g,"/"));
				$.ajax({
					 url:"<%=basePath%>/worker/updateworkerInfo",
					 type:"post",
					 data:{
						 wiNum:wiNum,
						 wiName:wiName,
						 wiSex:wiSex,
						 wiAge:wiAge,
						 wiAddress:wiAddress,
						 wiSchool:wiSchool,
						 wiSpeciality:wiSpeciality,
						 wiEducation:wiEducation,
						 wiLanguage:wiLanguage,
						 birthday:birthday,
						 idCard:idCard,
						 wiBackground:wiBackground,
						 wiTime:t
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
	//页面加载完执行的方法，主要控制搜索功能是否展示
	$(document).ready(function(){ 
		/*奖惩记录累计展示*/
		var wiNum=$("#wiName").attr("num");
		$.ajax({
			url:"<%=basePath%>/money/getfinallMoney",
			type: "post",
			async: false,
			data : {
				hNum:wiNum,
				hContent:'本月'
			},
			success : function(data) {
							var name=document.getElementById("finaMon");
							name.innerText=data;
						},
			error : function() {
					        alert("请求失败");
					}
		})
		<%String wNum = request.getParameter("wNum");//用request得到路径上的参数%>
		var wNum='<%=wNum%>';
			if(wNum!='null'){
				//隐藏标签
				$("#select").hide();
				$("#page").hide();
				$("#gifshow").attr("src","<%=basePath%>static/images/超赞.gif")
				$("#giftext").html("就是这么优秀！")
				/**
				//显示标签
				$("#select").show();
				*/
				//获取得到集合的人长度，如果长度为零，跳转到信息注册页面
				var num='${fn:length(wis)}';
				if(num=='0'){
					calTime();
				}
				
			}else{
				var num='${fn:length(wis)}';
				if(num==0){
					 document.querySelector("#vo").innerHTML="<center>暂无员工</center>";
				}
			}
	})
	function calTime(){
	    a=5;
	    go();
	}
	function go(){
	   if(a>=0){
		   if(a>3){
			    document.querySelector("body").innerHTML="<center>详细信息还未登记</center>";
		   }else{
	      		document.querySelector("body").innerHTML="<center><b>即将跳转至员工信息注册界面,还剩<span style='color:red'>"+a+"</span>秒</b></center>";
		   }
		   	a--;
	      	setTimeout(go,1000);
	 }else{
		 window.location.href="<%=basePath%>/worker/intoaddworkerInfo?wiNum="+'${wNum}'+"&wiName="+'${wName}'+"&wiSex="+'${wSex}'+"&url="+'${url}';
	 }
	}
	//正则匹配
	 $(function(){
		 //当input框改变时会被触发
	    $("input").change(function(){
		            //获取发生更改的input框的id
					var id=$(this).attr("id")
					var myDiv=$(this).parent().parent().children("div.col-md-4");
					
					 if(id=="updatewiName"){
						 var a=$(this).val();
							var regex=/^[\u4e00-\u9fa5|a-z|A-Z]+$/
						if(regex.test(a)==true){
							myDiv.html('<p class="icon-check" style="color:green;margin-top: 10px" >格式正确</p>')
							s();
						 	}else{
							myDiv.html('<p class="icon-exclamation" style="color:red;margin-top: 10px"><span>只能输入汉字或者英文字母</span></p>')
					 	    e();
						}
						 
					 }
					 if(id=="updatewiAge"){
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
					 if(id=="updatewiAddress"){
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
					 if(id=="updatewiSchool"){
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
					 if(id=="updatewiSpeciality"){
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
					 if(id=="updateidCard"){
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