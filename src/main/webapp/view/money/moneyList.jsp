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
<title>薪资管理</title>
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
				<strong class="icon-reorder"> 薪资管理</strong> 
				<a href="" style="float: right; display: none;">添加字段</a>
				<button class="btn btn-link icon-reply" onclick="history.back()">后退</button>
			</div>
			<div class="padding border-bottom" >
				<b class="text-blue" >部门：</b><select id="department"  onchange="selectMoney()">
								    				<option value=null class="option" >请选择部门</option>
													<c:forEach items="${ds}" var="depart">
														<option id="m${depart.dNum}"  value="${depart.dNum}" class="option" >${depart.dName}</option>
													</c:forEach>
											   </select>
				<b class="text-blue" >职位：</b><select id="pName"  name="pName" onchange="selectMoney()">
								    				<option value=null class="option" >请先选择部门</option>
											   </select>
			</div>
			<table id="dList" class="table table-hover text-center">
				<tr class="blue">
					<th>部门编号</th>
					<th>职称</th>
					<th>工资区间</th>
					<th>员工福利</th>
					<th width="310">操作</th>
				</tr>
				<tbody name="list" id="vo"> 
				<c:forEach items="${ms}" var="mt" >
					<tr>
						<td id="mDnum" class="text-red">${mt.mDnum}</td>
						<td id="mPname" class="text-blue" >${mt.mPname }</td>
						<td id="money" min='${mt.mMin}' max='${mt.mMax}' class="text-green">
								<c:if test="${mt.mMin==null}">
							    	<span id="money" style="color: red">未设置</span>
							    </c:if>
							    <c:if test="${mt.mMin!=null}">
							    	￥   ${mt.mMin}     -     ${mt.mMax}
							    </c:if></td>
						<td  class="text-yellow">
								<c:if test="${mt.mSafe==null}">
							    	<span id="money" style="color: green">未设置</span>
							    </c:if>
							    <c:if test="${mt.mSafe!=null}">
							    	<span id="mSafe">${mt.mSafe}</span>
							    </c:if></td>
						<td id="deleteandupdate" style="width: 20%"><div class="button-group">
								<button type="button" 
									class="button border-main icon-edit (alias)"
									data-toggle="modal" data-target="#updateMoney"  name="update" >修改</button>
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
			<a href="<%=request.getContextPath()%>/money/findMoneyList?${mon}&page=${page.firstPage}">首页</a>
			<a href="<%=request.getContextPath()%>/money/findMoneyList?${mon}&page=${page.prePage}">上一页</a>
			<c:forEach begin="1" end="${page.pages}" var="pageNumber">
					<a href="<%=request.getContextPath()%>/money/findMoneyList?${mon}&page=${pageNumber}">
				    <%--判断：主要是为了给当前页显示红色--%> <c:choose>
						<c:when test="${pageNumber==page.pageNum}">
							<span style="color: red">${pageNumber}</span>
							</c:when>
							<c:otherwise>${pageNumber}</c:otherwise>
						</c:choose>
					</a>
			</c:forEach>
			<a  href="<%=request.getContextPath()%>/money/findMoneyList?${mon}&page=${page.pageNum+1}">下一页</a>			
			<a href="<%=request.getContextPath()%>/money/findMoneyList?${mon}&page=${page.lastPage}">尾页</a>
	        </ul> 
	      </div>
	</div>
	<!-- updateMoney -->
	 <div class="modal fade bs-example-modal-lg" id="updateMoney"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog  modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header" style="text-align: center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<h4 class="modal-title" id="myModalLabel">薪资修改</h4>
				</div>

				<div class="modal-body">
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">工资区间：</label>
						</div>
						<div class="col-md-6">
						  <div class="input-group" style="width:50%;float:left">
							<span class="addon">¥</span>
				            <input  onkeyup="value=value.replace(/[^\d\.]/g,'')" onblur="value=value.replace(/[^\d\.]/g,'')" type="text" class="input" id="moneyMin" name="money" size="50" placeholder="金额下限" />
				          </div>
				          <div class="input-group" style="width:50%;float:left">
				            <span class="addon">¥</span>
				            <input  onkeyup="value=value.replace(/[^\d\.]/g,'')" onblur="value=value.replace(/[^\d\.]/g,'')" type="text" class="input" id="moneyMax" name="money" size="50" placeholder="金额上限" />
				          </div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">待遇：</label>
						</div>
						<div class="col-md-6">
							<input id="updateSafe" type="text" class="input" name="updateSafe" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
				</div>

				<div class="modal-footer" style="heght: 50px">
					<button
							type="button" class="btn btn-default" data-dismiss="modal">关闭</button></a>
					<button type="button" class="btn btn-primary" id="updatebutton"
						onclick="pushMoney()">保存</button>
				</div>

			</div>
		</div>
	</div>
</body>

	<script type="text/javascript">
	
	//列表查询
	function selectMoney(){
		var dNum=$("#department option:selected").val();
		var pName=$("#pName option:selected").val();
		window.location.href="<%=basePath%>/money/findMoneyList?mPname="+pName+"&mDnum="+dNum; 
	}
	
		//修改工资
		//使用ajax刷新后获取button点击事件要使用.on('click','#XXX',function(){})
		$(document).on('click',"button[name='update']",function(){
			 var mSafe=$(this).parents("tr").find("#mSafe").text();
			 var min=$(this).parents("tr").find("#money").attr("min");
			 var max=$(this).parents("tr").find("#money").attr("max");
			 var mDnum=$(this).parents("tr").find("#mDnum").text();
			 var mPname=$(this).parents("tr").find("#mPname").text();
			 //将上面获取到自身的原本信息显示在修改框
			 $("#moneyMin").val(min);
			 $("#moneyMax").val(max);
			 $("[name='updateSafe']").val(mSafe);
			 //将部门编号和职称存入
			 $("#moneyMin").prop("mDnum",mDnum);
			 $("#moneyMin").prop("mPname",mPname);
		})
		function pushMoney(){
			 //获取上面修改后的值
			 var mMin= $("#moneyMin").val();
			 var mMax= $("#moneyMax").val();
			 var safe=$("#updateSafe").val();
			 //取出部门编号和职位
			 var mDnum=$("#moneyMin").prop("mDnum");
			 var mPname=$("#moneyMin").prop("mPname");
			 var regex=/^[1-9]+[0-9]+[.]?[0-9]+$/
			 var b= regex.test(mMin)
			 var bb=regex.test(mMax)
			if(b==false||bb==false){
				alert("请输入正确的数字金额,3位数以上")
				return;
			}
			 if(mMax-mMin<0){
				 alert("金额下限超过上限，请重新输入")
				 return;
			 }else{
				$.ajax({
					 url:"<%=basePath%>/money/updateMoneyByDnumAndPname",
					 type:"post",
					 async: false,
					 data:{
						 mDnum:mDnum,
						 mPname:mPname,
						 mSafe:safe,
						 mMin:mMin,
						 mMax:mMax
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
		}    
		   //页面加载完执行代码
		   $(document).ready(function(){ 
			   var num='${fn:length(ms)}';
				if(num==0){
					 document.querySelector("#dList").innerHTML="<center>暂无数据</center>";
				}
				<% String num =request.getParameter("mDnum");//用request得到路径上的参数%>
				var dNum=<%=num%>;
				<% String pName =request.getParameter("mPname");//用request得到路径上的参数%>
				var pName='<%=pName%>';
				if(dNum!=null){
				$.ajax({
					url:"<%=basePath%>/department/selectpNameByNum",
					type: "post",
					async: false,
					data : {
						dNum:dNum,
					},
					success : function(data) {
							d=document.querySelector("#pName");
							d.innerHTML="<option  value=null class='option' >请选择职位</option>"
			        		for(var i=0;i<data.length;i++){
			        			d.innerHTML+="<option id='p"+data[i]+"' class='option' >"+data[i]+"</option>"	
			        		}
							$("#m"+dNum).prop("selected",'selected');
							$("#p"+pName).prop("selected",'selected');
							},
							error : function() {
								alert("搜索请求失败");
							}
						})
				}
		   })
	</script>

</html>