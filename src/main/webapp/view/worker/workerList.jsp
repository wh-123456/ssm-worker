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
<title>员工管理</title>
<script src="<%=basePath%>/static/js/jquery.js"></script>
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/css/pintuer.css">
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/css/admin.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/bootstrap.min.css">
<script src="<%=basePath%>/static/js/bootstrap.js"></script>
<script src="<%=basePath%>/static/js/pintuer.js"></script>

</head>
<body>
	
		<div class="panel admin-panel">  
			<div class="panel-head">
				<strong class="icon-reorder"> 员工管理</strong> 
				<a href="" style="float: right; display: none;">添加字段</a>
				<button class="btn btn-link icon-reply" onclick="history.back()">后退</button>
				
			</div>
			<div class="padding border-bottom">
				<ul class="search" style="padding-left: 10px;">
					<li><button type="button" name="add"
							class="button border-main icon-plus-square-o" data-toggle="modal"
							data-target="#addWorker">新增员工</button></li>
					<li><button class="button border-red" onclick="delSelect()"><span class="icon-bomb" ></span>批量删除
					</button></li>
					<li><button class="button border-green" onclick="selectAll()"><span class="icon-check-square-o" ></span>反选
					</button></li>
					
					<!-- <a class="button border-main icon-plus-square-o"
						href="<%=basePath%>view/system/role/addRole.jsp"> 增加</a> -->
						<li><input type="text" placeholder="请输入员工姓名或编号"  id="findPer" />
						<button onclick="findWorker()" class="button border-blue" >
						<span class="icon-search">员工查询</span></button></li>
				</ul>
				
			</div>
			<table id="WList" class="table table-hover text-center">
				<tr class="blue">
				    
					<td>请选择</td>
					<th>员工编号</th>
					<th>姓名</th>
					<th>性别</th>
					<th>部门</th>
					<th>职称</th>
					<th width="310">操作</th>
				</tr>
				<tbody name="list" id="vo"> 
				<c:forEach items="${ws}" var="st" varStatus="vs">
					<tr>
						
						<td><input type="checkbox" name="del" value="${st.wNum}" id="${page.pageNum}"/>${vs.count+5*(page.pageNum-1)}</td>
						<td id="wNum" value="${st.wNum}"><a href="javascript:void(0)" onclick="popup('${st.wNum}','${st.wName}','${st.wSex}')">${st.wNum}</a></td>
						<td id="wName" >${st.wName }</td>
						<td id="wSex">${st.wSex}</td>
						<td >
						    <c:if test="${st.department=='待分配'}">
							<span id="department" style="color: red">${st.department}</span>
							</c:if>
							<c:if test="${st.department!='待分配'}">
							<span id="department">${st.department}</span>
							</c:if>
						</td>
						<td id="wPname">${st.wPname}</td>
						<td id="deleteandupdate" style="width: 20%"><div class="button-group">
								<button type="button" 
									class="button border-main icon-edit (alias)"
									data-toggle="modal" data-target="#updateworker"  name="update" >修改</button>

								<button class="button border-red"  onclick="delMethod('${st.wNum}')">
									<span class="icon-trash-o"></span> 删除
								</button>
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
			<a href="<%=request.getContextPath()%>/worker/${parameter}&page=${page.firstPage}">首页</a>
			<a href="<%=request.getContextPath()%>/worker/${parameter}&page=${page.prePage}">上一页</a>
			<c:forEach begin="1" end="${page.pages}" var="pageNumber">
					<a href="<%=request.getContextPath()%>/worker/${parameter}&page=${pageNumber}&size=5">
				    <%--判断：主要是为了给当前页显示红色--%> <c:choose>
							<c:when test="${pageNumber==page.pageNum}">
							<span style="color: red">${pageNumber}</span>
							</c:when>
							<c:otherwise>${pageNumber}</c:otherwise>
						</c:choose>
					</a>
			</c:forEach>
			<a  href="<%=request.getContextPath()%>/worker/${parameter}&page=${page.pageNum+1}">下一页</a>			
			<a href="<%=request.getContextPath()%>/worker/${parameter}&page=${page.lastPage}">尾页</a>
	        </ul> 
	      </div>
	

	<!-- addWorker -->
	<div class="modal fade bs-example-modal-lg" id="addWorker"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header" style="text-align: center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<h4 class="modal-title" id="myLargeModalLabel">员工新增</h4>
				</div>

				<div class="modal-body">

					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">员工编号：</label>
						</div>
						<div class="col-md-6">
							<input onkeyup="value=value.replace(/[\W]/g,'') " 
							onchange="value=value.replace(/[\W]/g,'') "
							id="addwNum" type="text" class="input" name="wNum" value="" />
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
							<input onkeyup="value=value.replace(/[^\u4E00-\u9FA5|a-zA-Z]/g,'') "
							 onchange="value=value.replace(/[^\u4E00-\u9FA5|a-zA-Z]/g,'')"
							 id="addwName"  type="text"  class="input" name="wName" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				<p style="color:green;margin-top: 10px"><span>提示！只能输入汉字或字母</span></p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">性别：</label>
						</div>
						<div class="col-md-6" style="margin-top:5px">
							<input type="radio" name="addwiSex" id="addsex男" value="男">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="addwiSex" id="addsex女" value="女">女&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<div class="col-md-4" id="d3">
			  
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">部门：</label>
						</div>
						<div class="col-md-6">
							<select id="adddepartment"  name="department"  class="input" onchange="pNameMethod('add')">
								    <option name="addid" value="-1" class="option" >请选择部门</option>
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
							<label style="margin-top: 10px">职称：</label>
						</div>
						<div class="col-md-6">
							<select id="pName" name="pName"  class="input">
								<option value ="">请先选择部门</option>
		                    </select>
						</div>
						<div class="col-md-4" id="d4">
			  
						</div>
					</div>
				</div>


				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" id="addbuton" class="btn btn-primary" onclick="addWorkerMethod()" style="pointer-events：auto;">保存</button>
				</div>

			</div>
		</div>
	</div>
	<!-- updateworker -->
	 <div class="modal fade bs-example-modal-lg" id="updateworker"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog  modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header" style="text-align: center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<h4 class="modal-title" id="myModalLabel">员工修改</h4>
				</div>

				<div class="modal-body">
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">员工编号：</label>
						</div>
						<div class="col-md-6">
							<input id="updatewNum" onkeyup="value=value.replace(/[^0-9|a-zA-Z]/g,'') "
							 onchange="value=value.replace(/[^0-9|a-zA-Z]/g,'')"
							 type="text" class="input" name="updatewNum" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				<p style="color:green;margin-top: 10px"><span>提示！只能输入字母，数字</span></p>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">姓名：</label>
						</div>
						<div class="col-md-6">
							<input id="updatewName" onkeyup="value=value.replace(/[^\u4E00-\u9FA5|a-zA-Z]/g,'') "
							 onchange="value=value.replace(/[^\u4E00-\u9FA5|a-zA-Z]/g,'')"
							 type="text" class="input" name="updatewName" value="" />
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
							<input type="radio" name="wiSex" id="sex男" value="男">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="wiSex" id="sex女" value="女">女&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">部门：</label>
						</div>
						<div class="col-md-6">
							<select id="updatedepartment"  name="updatedepartment"  class="input" onchange="pNameMethod('update')">
								    <option name="updateid" value="-1" class="option" >请选择部门</option>
								<c:forEach items="${ds}" var="depart">
									<option name="updateid" id="per${depart.dName}" value="${depart.dNum}" class="option" >${depart.dName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">职称：</label>
						</div>
						<div class="col-md-6">
							<select id="updatepName" name="updatepName"  class="input">
								<option value ="">请先选择部门</option>
		                    </select>
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
				</div>

				<div class="modal-footer" style="heght: 50px">
					<button
							type="button" class="btn btn-default" data-dismiss="modal">关闭</button></a>
					<button type="button" class="btn btn-primary" id="updatebutton"
						onclick="pushData(${page.pageNum})">保存</button>
				</div>

			</div>
		</div>
	</div>

</body>

	<script type="text/javascript">
	function popup(wNum,wName,wSex){
		window.location.href="<%=basePath%>/worker/findWorkerInfoById?wNum="+wNum+"&wName="+wName+"&wSex="+wSex;      
	}
	//职称选择
	//页面加载完执行的方法
	$(document).ready(function(){ 
		<%String dNum= request.getParameter("wDnum");//用request得到路径上的参数%>
		var dNum='<%=dNum%>';
		add=document.querySelector("#pName");
		$.ajax({
			url:"<%=basePath%>/department/selectpNameByNum",
			type: "post",
			data : {dNum:dNum
			},
			success : function(data) {
				        		add.innerHTML=""
				        		add.innerHTML+="<option value=''>请选择职位</option>";
				        		for(var i=0;i<data.length;i++){
				        			add.innerHTML+="<option id='pN"+data[i]+"'>"+data[i]+"</option>";
				        			/**var o=document.createElement("option");
									var c=document.createTextNode(data[i]);
									o.appendChild(c);
									d.appendChild(o);*/
									}
						},
					error : function() {
						alert("请求失败555");
					}
				})
	})
	function pNameMethod(m){
		var d;
		var dNum;
		var num='<%=dNum%>'
		if(m=='add'){
		    dNum= $("#adddepartment").val();
			d=document.querySelector("#pName");
		}else{
			if(num==""){
			dNum= $("#updatedepartment").val();
			}else{dNum=num}
			d=document.querySelector("#updatepName");
		}
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
				        		if(m!='update'&&m!='add'){
				        			$("#pN"+m).prop("selected",'selected');
				        		}
						},
					error : function() {
						alert("请求失败");
					}
				})
	}
	
	//员工模糊查询 
	function findWorker(){
		var name=$("#findPer").val();
		if(name!=""){
			var dNum='<%=dNum%>'
				window.location.href="<%=basePath%>/worker/selectworkerList2?wName="+name+"&wDnum="+dNum;
		        alert("查询成功")
						
		}else{
			alert("请输入查询内容！！！")
		}
	}
	var num;
	var name;
	var sex;
	//新增员工	
	//使用ajax刷新后获取button点击事件要使用.on('click','#XXX',function(){})
		$(document).on('click',"button[name='add']",function(){
			
			var dNum='<%=dNum%>'
			 if(dNum!=''){
				 $("#add"+dNum).prop("selected",'selected');
				 $("[name=addid]").prop("disabled",'disabled');
			 }
			
			 
		})
	function addWorkerMethod(){
			var wNum=$("#addwNum").val();
			var wName=$("#addwName").val();
			var wSex=$("input[type='radio'][name='addwiSex']:checked").val();
			var wPname=$("#pName option:selected").val();
			var wDnum=$("#adddepartment option:selected").val();
			num=wNum;
			name=wName;
			sex=wSex;
			if(wNum==''){
				alert("请输入编号")
			}else
			if(wName==''){
				alert("请输入姓名")
			}else 
			if(wSex==null){
				alert("请选择性别")
			}else
			if(wDnum==-1){
				alert("请选择部门")
			}else if(wPname==''){
				alert("请选择职位")
			}else{
			$.ajax({
				url:"<%=basePath%>/worker/addworker",
				type: "post",
				data : {wNum:wNum,
						wName:wName,
						wSex:wSex,
						wPname:wPname,
						wDnum:wDnum
				},
				success : function(data) {
					if(data>0){
						alert("新增成功");
						calTime();
					
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
		 window.location.href="<%=basePath%>/worker/intoaddworkerInfo?wiNum="+num+"&wiName="+name+"&wiSex="+sex;
	 }
	}
	
	    //删除单个
		function delMethod(wNum) {
			if (confirm("您确定要删除吗?")) {
				
				$.ajax({
					url:"<%=basePath%>/worker/deleteworker",
					type : "get",
					data : {
						wNum:wNum
					},
					success : function(data) {
						if (data>0) {
							alert("删除成功");
							window.location.reload();
							
						} else {
							alert("删除失败！！！");
						}
					},
					error : function() {
						alert("删除请求失败");
					}

				})
			}
		}
		//批量删除
		function delSelect() {
			var nums = new Array();
			//获取所有被选中的元素的value(),value值被设置为其permissionId
			$("input[name='del']:checked").each(function(i) {
				nums.push(this.value);
			});
			var wNums=nums.toString()
			if (nums!="") {
				if( confirm("您确认要删除选中的内容吗？")){
						$.ajax({
							url:"<%=basePath%>/worker/deleteWorkerSome",
							type : "post",
							data : {
								nums : wNums
							},
							success : function(data) {
								if (data>0) {
									alert("删除成功"); 
									window.location.reload();
										
								} else {
									alert("删除失败！！！");
								}
								
							},
							
							error : function() {
								alert("删除请求失败");
							}

						})
						
					}
			} else {
				alert("请选择您要删除的内容!");
				return false;
			}
		}
		
		//修改员工信息
		//使用ajax刷新后获取button点击事件要使用.on('click','#XXX',function(){})
		$(document).on('click',"button[name='update']",function(){
			 var wNum=$(this).parents("tr").find("#wNum").text();
			 var wName=$(this).parents("tr").find("#wName").text();
			 var wSex=$(this).parents("tr").find("#wSex").text();
			 var department=$(this).parents("tr").find("#department").text();
			 var wPname=$(this).parents("tr").find("#wPname").text();
			 var a=[];
			 //将上面获取到自身的原本信息显示在修改框
			 $("[name=updatewNum]").val(wNum);
			 $("[name=updatewName]").val(wName);
			 
			 //这里不能使用attr，使用attr两次后会失效
			 $("#sex"+wSex).prop("checked","checked");
			 $("#per"+department).prop("selected",'selected');
			 //存入部门编号
			 var dNum= $("#updatedepartment").val();
			 $("#updatedepartment").attr("value",dNum);
			 
			 var num='<%=dNum%>'
			 if(num!=''){
				 $("[name=updateid]").prop("disabled",'disabled');
			 }
			 pNameMethod(wPname);
			 //将更改前得员工编号属性存入
			 $("[name=updatewNum]").attr("wNum",wNum);
		})
		function pushData(pageNum){
			 //获取上面设置的wNum属性的值
			 var wNum=$("[name=updatewNum]").attr("wNum");
			 //获取上面设置后显示的对应的值
			 var newWnum= $("#updatewNum").val();
			 var wName=$("#updatewName").val();
			 var wSex= $("input[type='radio'][name='wiSex']:checked").val();
			 var num= $("#updatedepartment").val();
			 var wPname=$("#updatepName option:selected").val();
				$.ajax({
					 url:"<%=basePath%>/worker/updateworker",
					 type:"post",
					 data:{
						 wNum:wNum,
						 wName:wName,
						 wSex:wSex,
						 wDnum:num,
						 wPname:wPname, 
						 newWnum:newWnum
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
			   var num='${fn:length(ws)}';
				if(num==0){
					 document.querySelector("#WList").innerHTML="<center>暂无员工</center>";
				}
		   })
		   
		 //正则匹配
		 	 $(function(){
		 		 //当input框改变时会被触发
			    $("input").change(function(){
				            //获取发生更改的input框的id
							var id=$(this).attr("id")
							var myDiv=$(this).parent().parent().children("div.col-md-4");
							if(id=="addwNum"||id=="updatewNum"){
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
											myDiv.html('<p class="icon-check" style="color:green;margin-top: 10px"><span>格式正确</span></p>')
											s();
										},
										error : function() {
											alert("删除请求失败");
										}

									})
								}
							}
							
			            })
			      $("#pName").change(function(){
			    	  var myDiv=$(this).parent().parent().children("div.col-md-4");
			    	  var wPname=$("#pName option:selected").val();
					  var wDnum=$("#adddepartment option:selected").val();
					  if(wPname=="主管"){
						  $.ajax({
								url:"<%=basePath%>/department/selectBossByDnum",
								type : "post",
								data : {
									dNum:wDnum
								},
								success : function(data) {
									if(data>0){
										myDiv.html('<p class="icon-exclamation" style="color:red;margin-top: 10px"><span>该部门已有主管</span></p>')
										e();
										return;
									}else{
										myDiv.html("")
										s();
										return;
									}
								},
								error : function() {
								}

							})
					  }else{
						  myDiv.html("")
						  s();
						  return;
					  }
			      })
			       $("#updatepName").change(function(){
			    	  var myDiv=$(this).parent().parent().children("div.col-md-4");
			    	  var num= $("#updatedepartment").val();
					  var wPname=$("#updatepName option:selected").val();
					  if(wPname=="主管"){
						  $.ajax({
								url:"<%=basePath%>/department/selectBossByDnum",
								type : "post",
								data : {
									dNum:num
								},
								success : function(data) {
									alert(data)
									if(data>0){
										myDiv.html('<p class="icon-exclamation" style="color:red;margin-top: 10px"><span>该部门已有主管</span></p>')
										e();
										return;
									}else{
										myDiv.html("")
										s();
										return;
									}
								},
								error : function() {
								}

							})
					  }else{
						  myDiv.html("")
						  s();
						  return;
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