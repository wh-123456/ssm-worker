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
<title>部门管理</title>
<script src="<%=basePath%>/static/js/jquery.js"></script>
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/css/pintuer.css">
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/css/admin.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/bootstrap.min.css">
<script src="<%=basePath%>/static/js/bootstrap.js"></script>
<script src="<%=basePath%>/static/js/pintuer.js"></script>

</head>
<body>
	<div>
		<div class="panel admin-panel">  
			<div class="panel-head">
				<strong class="icon-reorder"> 部门管理</strong> 
				<a href="" style="float: right; display: none;">添加字段</a>
				<button class="btn btn-link icon-reply" onclick="history.back()">后退</button>
			</div>
			<div class="padding border-bottom">
				<ul class="search" style="padding-left: 10px;">
					<li><button type="button" name="add"
							class="button border-main icon-plus-square-o" data-toggle="modal"
							data-target="#addDepartment">新增部门</button></li>
					<li><button class="button border-green" onclick="Merge()">
					<span class="icon-steam-square" ></span>部门合并</button></li>
				</ul>
				
			</div>
			<table id="dList" class="table table-hover text-center">
				<tr class="blue">
				    
					<td>请选择</td>
					<th>部门编号</th>
					<th>名称</th>
					<th>成立时间</th>
					<th width="310">操作</th>
				</tr>
				<tbody name="list" id="vo"> 
				<c:forEach items="${des}" var="dt" varStatus="d">
					<tr>
						
						<td><input type="checkbox" name="del" value="${dt.dNum}" id="${page.pageNum}"/>${d.count+(page.pageSize)*(page.pageNum-1)}</td>
						<td  value="${dt.dNum}">
						<a href="<%=basePath%>/worker/workerListByNum?wDnum=${dt.dNum}"
						title="${dt.dName},主管${dt.bossName},共${dt.count}人"
						id="dNum">${dt.dNum}</a></td>
						<td id="dName" >${dt.dName }</td>
						<td id="dTime"><fmt:formatDate value="${dt.dTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td id="deleteandupdate" style="width: 20%"><div class="button-group">
								<button type="button" 
									class="button border-main icon-edit (alias)"
									data-toggle="modal" data-target="#updateDepartment"  name="update" >修改</button>
								<button class="button border-red"  onclick="delMethod('${dt.dNum}')">
									<span class="icon-trash-o"></span> 解散
								</button>
								<button type="button" class="button border-main icon-plus-square"
									data-toggle="modal" data-target="#addPname" onclick="pNameMethod('${dt.dNum}')"  
									name="update" >职位</button>
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
			<a href="<%=request.getContextPath()%>/department/departmentList?${department}&page=${page.firstPage}">首页</a>
			<a href="<%=request.getContextPath()%>/department/departmentList?${department}&page=${page.prePage}">上一页</a>
			<c:forEach begin="1" end="${page.pages}" var="pageNumber">
					<a href="<%=request.getContextPath()%>/department/departmentList?${department}&page=${pageNumber}">
				    <%--判断：主要是为了给当前页显示红色--%> <c:choose>
						<c:when test="${pageNumber==page.pageNum}">
							<span style="color: red">${pageNumber}</span>
							</c:when>
							<c:otherwise>${pageNumber}</c:otherwise>
						</c:choose>
					</a>
			</c:forEach>
			<a  href="<%=request.getContextPath()%>/department/departmentList?${department}&page=${page.pageNum+1}">下一页</a>			
			<a href="<%=request.getContextPath()%>/department/departmentList?${department}&page=${page.lastPage}">尾页</a>
	        </ul> 
	      </div>
	      <!-- 数据显示条数设置-->
	      <div>
	      	<ul class="search" style="padding-left: 10px;">
	      	<li><button class="button border-green" onclick="selectAll()"><span class="icon-check-square-o" ></span>反选
					</button></li>
	      	<li><input type="text" style="width:35%" placeholder="每页显示条数"  id="pgSize" />
						<button onclick="pageMethod()"  class="button border-blue" >
						<span class="icon-paper-plane-o">跳转</span></button></li>
	      	</ul>
	      </div>
	</div>
	<!-- addDepartment -->
	<div class="modal fade bs-example-modal-lg" id="addDepartment"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header" style="text-align: center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<h4 class="modal-title" id="myLargeModalLabel">部门新增</h4>
				</div>

				<div class="modal-body">

					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">部门编号：</label>
						</div>
						<div class="col-md-6">
							<input id="adddNum" onkeyup="value=value.replace(/[^a-zA-Z|0-9]/g,'') "
							 onchange="value=value.replace(/[^a-zA-Z|0-9]/g,'')"
							 type="text" class="input" name="dNum" value="" />
						</div>
						<div class="col-md-4" id="d1">
			  				<p style="color:green;margin-top: 10px"><span>提示！只能输入字母和数字</span></p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">部门名称：</label>
						</div>
						<div class="col-md-6">
							<input id="adddName" onkeyup="value=value.replace(/[^\u4E00-\u9FA5|a-zA-Z|0-9]/g,'') "
							 onchange="value=value.replace(/[^\u4E00-\u9FA5|a-zA-Z|0-9]/g,'')"
							 type="text"  class="input" name="dName" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				<p style="color:green;margin-top: 10px"><span>提示！只能输入字母，汉字或数字</span></p>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" id="addbuton" class="btn btn-primary" onclick="addDepartmentMethod()" style="pointer-events：auto;">保存</button>
				</div>

			</div>
		</div>
	</div>
	<!-- updateDepartment -->
	 <div class="modal fade bs-example-modal-lg" id="updateDepartment"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog  modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header" style="text-align: center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<h4 class="modal-title" id="myModalLabel">部门修改</h4>
				</div>

				<div class="modal-body">
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">部门编号：</label>
						</div>
						<div class="col-md-6">
							<input id="updatedNum" onkeyup="value=value.replace(/[^a-zA-Z|0-9]/g,'') "
							 onchange="value=value.replace(/[^a-zA-Z|0-9]/g,'')"
							 type="text" class="input" name="updatedNum" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				<p style="color:green;margin-top: 10px"><span>提示！只能输入字母和数字</span></p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">部门名称：</label>
						</div>
						<div class="col-md-6">
							<input id="updatedName" onkeyup="value=value.replace(/[^\u4E00-\u9FA5|a-zA-Z|0-9]/g,'') "
							 onchange="value=value.replace(/[^\u4E00-\u9FA5|a-zA-Z|0-9]/g,'')"
							 type="text" class="input" name="updatedName" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				<p style="color:green;margin-top: 10px"><span>提示！只能输入字母，汉字或数字</span></p>
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
	<!-- addPname -->
	<div class="modal fade bs-example-modal-lg" id="addPname"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header" style="text-align: center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<h4 class="modal-title" id="myLargeModalLabel">职位管理</h4>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">已有职位：</label>
						</div>
						<div class="col-md-6" id="pName">
							
						</div>
						<div class="col-md-4">
			  				<p class='text-dot' style='margin-top: 10px'>点击按钮删除对应职位,职员不可删除</p>
						</div>
					</div>
					<div class="row" style="margin-top: 10px">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">新增职位：</label>
						</div>
						<div class="col-md-6" id="pName">
							<input id="addpName" onkeyup="value=value.replace(/[^\u4E00-\u9FA5|a-zA-Z|0-9]/g,'') "
							 onchange="value=value.replace(/[^\u4E00-\u9FA5|a-zA-Z|0-9]/g,'')"
							type="text"  class="input" name="pName" value="" />
						</div>
						<div class="col-md-4">
							<p class='text-main' style='margin-top: 10px'>提示！只可输入汉字，字母和数字，点击下方按钮提交</p>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" id="addbuton" class="btn btn-primary" onclick="addpName()" style="pointer-events：auto">提交</button>
				</div>

			</div>
		</div>
	</div>
</body>

	<script type="text/javascript">
	//设置数据显示条数
	function pageMethod(){
		var size=$("#pgSize").val();
		var reg=/^\d+$/; 
        var result= reg.test(size);
		if(result){
			window.location.href="<%=basePath%>/department/departmentList?size="+size; 
		}else{
			alert("请输入数字");
		}
	}
	//部门职位管理
	//显示该部门已有职位
	var pDnum;
	function pNameMethod(dNum){
		pDnum=dNum;
		$.ajax({
			url:"<%=basePath%>/department/selectpNameByNum",
			type: "post",
			async: false,
			data : {
				dNum:dNum,
			},
			success : function(data) {
					d=document.querySelector("#pName");
					d.innerHTML=""
	        		for(var i=0;i<data.length;i++){
	        			pName="`"+data[i]+"`"
	        			dnum="`"+dNum+"`";
	        			d.innerHTML+="<button type='button' class='button border-blue' onclick='deletePname("+dnum+","+pName+")'>"+data[i]+"</button>"
	        		}
					    
					},
					error : function() {
						alert("新增请求失败");
					}
				})
		
	}
	//部门职位删除
	function deletePname(dNum,pName){
	  if (confirm("您确定要删除此部门的本职位吗?")) {
		  if(pName=="职员"){
			  alert("职员不可删除!")
			  return;
		  }
		 $.ajax({
				url:"<%=basePath%>/department/deletePnameByNum",
				type: "post",
				async: false,
				data : {
					mDnum:dNum,
					mPname:pName,
				},
				success : function(data) {
					if(data>0){
						alert("删除成功");
						window.location.reload();
					
					}else{
						alert("删除失败")
					}
							},
						error : function() {
							alert("删除请求失败");
						}
					})
	  }
	}
	//部门职位新增
	function addpName(){
		var pName=$("#addpName").val();
		if(pName==''){
			alert("请输入要新增的职位")
		}else{
			$.ajax({
				url:"<%=basePath%>/department/addPnameByNum",
				type: "post",
				async: false,
				data : {
					mDnum:pDnum,
					mPname:pName,
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
		
	}
	//部门新增	
	function addDepartmentMethod(){
			var dNum=$("#adddNum").val();
			var dName=$("#adddName").val();
			$.ajax({
				url:"<%=basePath%>/department/addDepartment",
				type: "post",
				async: false,
				data : {
					dNum:dNum,
					dName:dName,
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
	    //删除部门
		function delMethod(dNum) {
			if (confirm("您确定要解散本部门吗?")) {
				
				$.ajax({
					url:"<%=basePath%>/department/deleteDepartment",
					type : "post",
					async: false,
					data : {
						dNum:dNum
					},
					success : function(data) {
						if (data>0) {
							alert("解散成功");
							delWorker(dNum);
							window.location.reload();
							
						} else {
							alert("解散失败！！！");
						}
					},
					error : function() {
						alert("解散请求失败");
					}

				})
			}
		}
	    //遣散部门员工
	    function delWorker(dNum) {
	    	var url;
	    	var su;
	    	var fa;
	    	if(confirm("是否遣散本部门所有员工?")){
	    		url="<%=basePath%>/department/deleteDepartmentWorker";
	    	}else{
	    		url="<%=basePath%>/department/updateWorkerDnum";
	    	}
				$.ajax({
					url:url,
					type : "post",
					async: false,
					data : {
						dNum:dNum
					},
					success : function(data) {
						alert("操作成功！")
					},
					error : function() {
						alert("操作失败");
					}

				})
			
		}
		//部门合并
		var dNums=[];
		function Merge() {
			var Checkbox = false;
			var num=0;
			//获取所有被选中的元素的value(),value值被设置为其permissionId
			$("input[name='del']").each(function(i) {
				if (this.checked == true) {
					Checkbox = true;
					num+=1;
					dNums[i]=$(this).val();
				}
			});
			if (Checkbox) {
				if(num>1){
					if( confirm("您确认要合并所选部门吗？")){
						$('#addDepartment').modal("show");
						$("#addbuton").attr("onclick","mergeMethod()")
					}
				}else{
					alert("您只选择了一个部门")
				}
			} else {
				alert("请选择您要合并的部门!");
			}
		}
		function mergeMethod(){
			var dNum=$("#adddNum").val();
			var dName=$("#adddName").val();
			$.ajax({
				url:"<%=basePath%>/department/mergeDepartment",
				type : "post",
				async: false,
				data : {
					dNums : dNums,
					newdNum:dNum,
					dName:dName
				},
				success : function(data) {
					if (data>0) {
						alert("合并成功"); 
						window.location.reload();
							
					} else {
						alert("合并失败！！！");
					}
					
				},
				
				error : function() {
					alert("合并请求失败");
				}

			})
			$("#addbuton").prop("onclick","addDepartmentMethod()")
		}
		
		//修改部门信息
		//使用ajax刷新后获取button点击事件要使用.on('click','#XXX',function(){})
		$(document).on('click',"button[name='update']",function(){
			 var dNum=$(this).parents("tr").find("#dNum").text();
			 var dName=$(this).parents("tr").find("#dName").text();
			 var dName=$(this).parents("tr").find("#dName").text();
			 //将上面获取到自身的原本信息显示在修改框
			 $("[name=updatedNum]").val(dNum);
			 $("[name=updatedName]").val(dName);
			 $("[name=updatedNum]").prop("dNum",dNum);
		})
		function pushData(){
			 //获取原部门编号
			 var dNum=$("[name=updatedNum]").prop("dNum");
			 //获取上面修改后的值
			 var newdNum= $("#updatedNum").val();
			 var dName=$("#updatedName").val();
				$.ajax({
					 url:"<%=basePath%>/department/updateDepartment",
					 type:"post",
					 data:{
						 dNum:dNum,
						 dName:dName,
						 newdNum:newdNum
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
		//反选
		 function selectAll(){
				 $("input[name='del']").each(function(){
				      if(this.checked){
				    	  this.checked=false
				      }else{
				    	  this.checked=true
				      }
				 })
		}   
		     
		   $(document).ready(function(){ 
			   var num='${fn:length(des)}';
				if(num==0){
					 document.querySelector("#dList").innerHTML="<center>暂无部门</center>";
				}
		   })
		   //正则匹配
		 	 $(function(){
		 		 //当input框改变时会被触发
			    $("input").change(function(){
				            //获取发生更改的input框的id
							var id=$(this).prop("id")
							var myDiv=$(this).parent().parent().children("div.col-md-4");
							if(id=="adddNum"||id=="updatedNum"){
								var a=$(this).val();
								var regex=/^[|0-9|a-z|A-Z]+$/
								if(regex.test(a)==true){
									$.ajax({
										url:"<%=basePath%>/department/selectDnumAll",
										type : "post",
										data : {
										},
										success : function(data) {
											for(var i=0;i<data.length;i++){
										       if(data[i]==a){
										    	   myDiv.html('<p class="icon-exclamation" style="color:red;margin-top: 10px"><span>该部门编号已存在，请重新输入</span></p>')
											 	    e();
										    	   return;
										       }
										    }
											myDiv.html('<p class="icon-check" style="color:green;margin-top: 10px"><span>格式正确</span></p>')
											s();
										},
										error : function() {
											alert("请求错误")
										}

									})
								}
							}
							 if(id=="adddName"||id=="updatedName"){
								 var a=$(this).val();
									var regex=/^[\u4e00-\u9fa5|a-z|A-Z|0-9]+$/
								if(regex.test(a)==true){
									$.ajax({
										url:"<%=basePath%>/department/selectDnameAll",
										type : "post",
										data : {
										},
										success : function(data) {
											for(var i=0;i<data.length;i++){
										       if(data[i]==a){
										    	   myDiv.html('<p class="icon-exclamation" style="color:red;margin-top: 10px"><span>该部门已存在，请重新输入</span></p>')
											 	    e();
										    	   return;
										       }
										    }
											myDiv.html('<p class="icon-check" style="color:green;margin-top: 10px"><span>格式正确</span></p>')
											s();
										},
										error : function() {
											alert("请求错误")
										}

									})
								}
								 
							 }
							 if(id=="addpName"){
								 var a=$(this).val();
								 var regex=/^[\u4e00-\u9fa5|a-z|A-Z|0-9]+$/
								if(regex.test(a)==true){
									$.ajax({
										url:"<%=basePath%>/department/selectpNameByNum",
										type : "post",
										data : {
											dNum:pDnum
										},
										success : function(data) {
											for(var i=0;i<data.length;i++){
										       if(data[i]==a){
										    	   myDiv.html('<p class="icon-exclamation" style="color:red;margin-top: 10px"><span>该部门已有该职位，请重新输入</span></p>')
											 	    e();
										    	   return;
										       }
										    }
											myDiv.html('<p class="icon-check" style="color:green;margin-top: 10px"><span>格式正确</span></p>')
											s();
										},
										error : function() {
											alert("请求错误")
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