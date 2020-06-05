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
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title>实习员工管理</title>
<script src="<%=basePath%>/static/js/jquery.js"></script>
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/css/pintuer.css">
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/css/admin.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/bootstrap.min.css">
<script src="<%=basePath%>/static/js/bootstrap.js"></script>
<script src="<%=basePath%>/static/js/pintuer.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/My97DatePicker/WdatePicker.js"></script>

</head>
<body>
	<div>
		<div class="panel admin-panel">  
			<div class="panel-head">
				<strong class="icon-reorder"> 实习员工管理</strong> 
				<a href="" style="float: right; display: none;">添加字段</a>
				<button class="btn btn-link icon-reply" onclick="history.back()">后退</button>
			</div>
			<div class="padding border-bottom">
				<ul class="search" style="padding-left: 10px;">
					<li><button type="button" name="add"
							class="button border-main icon-plus-square-o" data-toggle="modal"
							data-target="#addPractice">新增实习生</button></li>
					<li><input type="text" placeholder="请输入实习员工姓名或编号"  id="findPra" />
						<button onclick="findPractice()" class="button border-blue" >
						<span class="icon-search">查询</span></button></li>
				</ul>
				
			</div>
			<table id="dList" class="table table-hover text-center">
				<tr class="blue">
				    
					<th class="icon-thumb-tack">实习编号</th>
					<th class="icon-user">姓名</th>
					<th class="icon-male">性别</th>
					<th class="icon-graduation-cap">毕业学校</th>
					<th class="icon-gear (alias)">实习部门</th>
					<th class="icon-clock-o">报道时间</th>
					<th class="icon-clock-o">结束时间</th>
					<th width="310">操作</th>
				</tr>
				<tbody name="list" id="vo"> 
				<c:forEach items="${ps}" var="pt" varStatus="p">
					<tr>
						
						<td id=pNum>${pt.pNum}</td>
						<td id="pName" >${pt.pName}</td>
						<td id="pSex" >${pt.pSex}</td>
						<td id="pSchool" pSchool="${pt.pSchool}"
						pEducation="${pt.pEducation}" pSpeciality="${pt.pSpeciality}"
						 title="${pt.pSpeciality}专业，${pt.pEducation}学历">
						${pt.pSchool}</td>
						<td id="pDname" >${pt.pDname }</td>
						<td id="pStime"><fmt:formatDate value="${pt.pStime}" pattern="yyyy-MM-dd"/></td>
						<td id="pEtime"><fmt:formatDate value="${pt.pEtime}" pattern="yyyy-MM-dd"/></td>
						<td id="deleteandupdate" style="width: 20%"><div class="button-group">
								<button type="button" 
									class="button border-main icon-edit (alias)"
									data-toggle="modal" data-target="#updatePractice"  name="update" >修改</button>
								<button class="button border-red"  onclick="delMethod('${pt.pNum}')">
									<span class="icon-trash-o"></span> 开除
								</button>
								<button type="button" class="button border-main icon-trophy"
									data-toggle="modal" data-target="#addPname" onclick="toWorkerMethod('${pt.pNum}')"  
									name="add" >转正</button>
							</div></td>
					</tr>
				 </c:forEach>
				</tbody> 
			</table>
		</div>
		<!-- 分页栏 -->
		  <div style="text-align: center" id="page" >
		    <ul class="pagination">
			<!--  <p style="margin-left: 10%">共${page.pages}页,当前是第${page.pageNum}页</p> -->
			<li>共${page.pages}页,当前是第${page.pageNum}页<li><br>
			<a href="<%=request.getContextPath()%>/practice/findpracticeList?${pra}&page=${page.firstPage}">首页</a>
			<a href="<%=request.getContextPath()%>/practice/findpracticeList?${pra}&page=${page.prePage}">上一页</a>
			<c:forEach begin="1" end="${page.pages}" var="pageNumber">
					<a href="<%=request.getContextPath()%>/practice/findpracticeList?${pra}&page=${pageNumber}">
				    <%--判断：主要是为了给当前页显示红色--%> <c:choose>
						<c:when test="${pageNumber==page.pageNum}">
							<span style="color: red">${pageNumber}</span>
							</c:when>
							<c:otherwise>${pageNumber}</c:otherwise>
						</c:choose>
					</a>
			</c:forEach>
			<a  href="<%=request.getContextPath()%>/practice/findpracticeList?${pra}&page=${page.pageNum+1}">下一页</a>			
			<a href="<%=request.getContextPath()%>/practice/findpracticeList?${pra}&page=${page.lastPage}">尾页</a>
	        </ul> 
	      </div>
	</div>
	<!-- addPractice -->
	<div class="modal fade bs-example-modal-lg" id="addPractice"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header" style="text-align: center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<h4 class="modal-title" id="myLargeModalLabel">实习生新增</h4>
				</div>

				<div class="modal-body">

					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">实习编号：</label>
						</div>
						<div class="col-md-6">
							<input id="addpNum" onkeyup="value=value.replace(/[^0-9|a-zA-Z]/g,'') "
							 onchange="value=value.replace(/[^0-9|a-zA-Z]/g,'')"
							 type="text" class="input" name="pNum" value="" />
						</div>
						<div class="col-md-4" id="d1">
			  				<p style="color:green;margin-top: 10px"><span>提示！只能输入字母，数字</span></p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">姓名：</label>
						</div>
						<div class="col-md-6">
							<input id="addpName" onkeyup="value=value.replace(/[^\u4E00-\u9FA5|a-zA-Z]/g,'') "
							 onchange="value=value.replace(/[^\u4E00-\u9FA5|a-zA-Z]/g,'')"
							 type="text"  class="input" name="pName" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				<p style="color:green;margin-top: 10px"><span>提示！只能输入字母或汉字</span></p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">性别：</label>
						</div>
						<div class="col-md-6" style="margin-top:5px">
							<input type="radio" name="addpSex" id="addsex男" value="男">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="addpSex" id="addsex女" value="女">女&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<div class="col-md-4" id="d3">
			  
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">毕业学校：</label>
						</div>
						<div class="col-md-6">
							<input id="addpSchool" onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'') "
							 onchange="value=value.replace(/[^\u4E00-\u9FA5]/g,'')"
							 type="text"  class="input" name="pSchool" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				<p style="color:green;margin-top: 10px"><span>提示！只能输入汉字</span></p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">专业：</label>
						</div>
						<div class="col-md-6">
							<input id="addpSpeciality"  onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'') "
							 onchange="value=value.replace(/[^\u4E00-\u9FA5]/g,'')"
							type="text"  class="input" name="pSpeciality" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				<p style="color:green;margin-top: 10px"><span>提示！只能输入汉字</span></p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">学历：</label>
						</div>
						<div class="col-md-6" style="margin-top: 10px">
							<input type="radio" name="addpEducation" id="edu高中" value="高中">高中&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="addoEducation" id="edu专科" value="专科">专科&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="addpEducation" id="edu本科" value="本科">本科&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="addpEducation" id="edu研究生" value="研究生">研究生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="addpEducation" id="edu博士" value="博士">博士&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">实习部门：</label>
						</div>
						<div class="col-md-6">
							<select id="adddepartment"  name="department"  class="input" >
								    <option name="addid" value="10000" class="option" >请选择部门</option>
								<c:forEach items="${ds}" var="depart">
									<option name="addid" id="add${depart.dNum}"  value="${depart.dNum}" class="option" >${depart.dName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-4" id="d4">
			  
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">实习结束时间：</label>
						</div>
						<div class="col-md-6" style="margin-top: 10px">
							<input id="addpEtime" style="color:green" name="pEtime" value=""  class="Wdate" onFocus="WdatePicker({lang:'zh-cn'})">
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" id="addbuton" class="btn btn-primary" onclick="addPracticeMethod()" style="pointer-events：auto;">保存</button>
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
							<input id="updatepName" onkeyup="value=value.replace(/[^\u4E00-\u9FA5|a-zA-Z]/g,'') "
							 onchange="value=value.replace(/[^\u4E00-\u9FA5|a-zA-Z]/g,'')"
							 type="text"  class="input" name="updatepName" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				<p style="color:green;margin-top: 10px"><span>提示！只能输入字母或汉字</span></p>
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
							<input id="updatepSchool" onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'') "
							 onchange="value=value.replace(/[^\u4E00-\u9FA5]/g,'')"
							 type="text"  class="input" name="updatepSchool" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				<p style="color:green;margin-top: 10px"><span>提示！只能输入汉字</span></p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">专业：</label>
						</div>
						<div class="col-md-6">
							<input id="updatepSpeciality" onkeyup="value=value.replace(/[^\u4E00-\u9FA5]/g,'') "
							 onchange="value=value.replace(/[^\u4E00-\u9FA5]/g,'')"
							 type="text"  class="input" name="updatepSpeciality" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				<p style="color:green;margin-top: 10px"><span>提示！只能输入汉字</span></p>
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
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">实习部门：</label>
						</div>
						<div class="col-md-6">
							<select id="updatepDname"  name="department"  class="input">
								    <option  value="10000" class="option" >请选择部门</option>
								<c:forEach items="${ds}" var="depart">
									<option  id="update${depart.dName}"  value="${depart.dNum}" class="option" >${depart.dName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-4" id="d4">
			  
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">报道时间：</label>
						</div>
						<div class="col-md-6" style="margin-top: 10px">
							<input id="updatepStime" style="color:blue" name="updatepStime" value=""  class="Wdate" onFocus="WdatePicker({lang:'zh-cn'})">
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">实习结束时间：</label>
						</div>
						<div class="col-md-6" style="margin-top: 10px"> 
							<input id="updatepEtime" style="color:red" name="updatepEtime" value=""  class="Wdate" onFocus="WdatePicker({lang:'zh-cn'})">
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
	//实习员工查询
	function findPractice(){
		
		var pName=$("#findPra").val();
		if(pName==""){
			alert("请输入查询条件")
			return;
		}else{
			<%String dNum=request.getParameter("pDnum"); //获取路径上的参数%>
			var dNum=<%=dNum%>
			window.location.href="<%=basePath%>/practice/findpracticeList?pDnum="+dNum+"&pName="+pName;
		}
		
	}
	//实习员工新增	
	//使用ajax刷新后获取button点击事件要使用.on('click','#XXX',function(){})
	/*设置只能添加本部门的实习生*/
		$(document).on('click',"button[name='add']",function(){
			var dNum='<%=dNum%>'
			 if(dNum!=''){
				 $("#add"+dNum).prop("selected",'selected');
				 $("[name=addid]").prop("disabled",'disabled');
			 } 
		})
	function addPracticeMethod(){
			var pNum=$("#addpNum").val();
			var pName=$("#addpName").val();
			var pSex=$("input[type='radio'][name='addpSex']:checked").val();
			var pSchool=$("#addpSchool").val();
			var pEducation=$("input[type='radio'][name='addpEducation']:checked").val();
			var pSpeciality=$("#addpSpeciality").val();
			var pDnum=$("#adddepartment option:selected").val();
			var pEtime=$("#addpEtime").val();
			var t=new Date(pEtime.replace(/-/g,"/"));
			$.ajax({
				url:"<%=basePath%>/practice/addpractice",
				type: "post",
				async: false,
				data : {
					pNum:pNum,
					pName:pName,
					pSex:pSex,
					pSchool:pSchool,
					pEducation:pEducation,
					pSpeciality:pSpeciality,
					pDnum:pDnum,
					pEtime:t
				},
				success : function(data) {
					if(data>0){
						alert("新增成功");
						window.location.reload();
					
					}else{
						alert("新增失败")
					}
							},
						error : function() {
							alert("新增请求失败");
						}
					})
	         }
	    //开除实习员工
		function delMethod(pNum) {
			if (confirm("您确定要开除该实习员工吗?")) {
				
				$.ajax({
					url:"<%=basePath%>/practice/deletepractice",
					type : "post",
					async: false,
					data : {
						pNum:pNum
					},
					success : function(data) {
						if (data>0) {
							alert("开除成功");
							window.location.reload();
							
						} else {
							alert("开除失败！！！");
						}
					},
					error : function() {
						alert("开除请求失败");
					}

				})
			}
		}
		//修改实习生
		//使用ajax刷新后获取button点击事件要使用.on('click','#XXX',function(){})
		$(document).on('click',"button[name='update']",function(){
			 var pNum=$(this).parents("tr").find("#pNum").text();
			 var pName=$(this).parents("tr").find("#pName").text();
			 var pSex=$(this).parents("tr").find("#pSex").text();
			 var pSchool=$(this).parents("tr").find("#pSchool").attr("pSchool");
			 var pEducation=$(this).parents("tr").find("#pSchool").attr("pEducation");
			 var pSpeciality=$(this).parents("tr").find("#pSchool").attr("pSpeciality");
			 var pDname=$(this).parents("tr").find("#pDname").text();
			 var pStime=$(this).parents("tr").find("#pStime").text();
			 var pEtime=$(this).parents("tr").find("#pEtime").text();
			 //将上面获取到自身的原本信息显示在修改框
			 $("[name=updatepName]").val(pName);
			 $("#updatesex"+pSex).prop("checked",true);
			 $("[name=updatepSchool]").val(pSchool);
			 $("#updateedu"+pEducation).prop("checked",true);
			 $("[name=updatepSpeciality]").val(pSpeciality);
			 $("#update"+pDname).prop("selected",'selected');
			 $("[name=updatepStime]").val(pStime);
			 $("[name=updatepEtime]").val(pEtime);
			 //将pNum存入
			 $("[name=updatepName]").attr("pNum",pNum)
		})
		function pushData(){
			 //获取上面存入的pNum
			 var pNum=$("[name=updatepName]").attr("pNum");
			 //获取上面修改后的值
			 var pName=$("[name=updatepName]").val();
			 var pSex=$("input[type='radio'][name='updatepSex']:checked").val();
			 var pSchool=$("[name=updatepSchool]").val();
			 var pEducation=$("input[type='radio'][name='updatepEducation']:checked").val();
			 var pSpeciality=$("[name=updatepSpeciality]").val();
			 var pDnum=$("#updatepDname option:selected").val();
			 var pStime=$("[name=updatepStime]").val();
			 var pEtime=$("[name=updatepEtime]").val();
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
						 pStime:new Date(pStime.replace(/-/g,"/")),
						 pEtime:new Date(pEtime.replace(/-/g,"/"))
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
		//员工转正
		var num;
		var name;
		var sex;
		var school;
		var education;
		var speciality;
		function toWorkerMethod(pNum){
			$.ajax({
				 url:"<%=basePath%>/practice/selectpracticeByNum",
				 type:"post",
				 async: false,
				 data:{
					 pNum:pNum
				 },
				 success:function(data){
					num=data.pNum;
					name=data.pName;
					sex=data.pSex;
					school=data.pSchool;
					education=data.pEducation;
					speciality=data.pSpeciality
					 
				 },
				 error:function(data){
				 }
			})
			if(confirm("确认转正该员工？")){
				$.ajax({
					 url:"<%=basePath%>/practice/insertpracticeToworker",
					 type:"post",
					 async: false,
					 data:{
						 pNum:pNum
					 },
					 success:function(data){
						 if(data>0){
							 alert("转正成功");
							 if(confirm("是否现在完善员工信息？？？")){
								 calTime()
							 }else{
							 window.location.reload();
							 }
						 }else{
							 alert("转正失败");
						 }
						 
					 },
					 error:function(data){
						 alert("修改请求失败");
					 }
				})
			}
			
		}
		//倒计时跳转页面
		function calTime(){
		    a=3;
		    go();
		}
		function go(){
		   if(a>=0){
		      document.querySelector("body").innerHTML="<center><b>还剩<span style='color:red'>"+a+"</span>秒，即将跳转至员工信息注册界面</b></center>";
		      a--;
		      setTimeout(go,1000);
		 }else{
			 window.location.href="<%=basePath%>/worker/intoaddworkerInfo?wiNum="+num+"&wiName="+name+"&wiSex="+sex+"&wiSchool="+school+"&wiEducation="+education+"&wiSpeciality="+speciality;
		 }
		}     
		   $(document).ready(function(){ 
			   var num='${fn:length(ps)}';
				if(num==0){
					 document.querySelector("#dList").innerHTML="<center>暂无实习员工</center>";
				}
		   })
		 //正则匹配
		 	 $(function(){
		 		 //当input框改变时会被触发
			    $("input").change(function(){
				            //获取发生更改的input框的id
							var id=$(this).attr("id")
							var myDiv=$(this).parent().parent().children("div.col-md-4");
							if(id=="addpNum"){
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
										    	   myDiv.html('<p class="icon-exclamation" style="color:red;margin-top: 10px"><span>该编号已存在，请重新输入</span></p>')
											 	    e();
										    	   return;
										       }
										    }
											myDiv.html('<p class="icon-check" style="color:green;margin-top: 10px"><span>格式正确</span></p>')
											s();
										},
										error : function() {
											alert("查询请求失败");
										}

									})
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