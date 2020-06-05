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
<%String wNum= request.getParameter("hNum");//用request得到路径上的参数%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, customer-scalable=no" />
<meta name="renderer" content="webkit">
<title>本月奖惩详情</title>
<script src="<%=basePath%>/static/js/jquery.js"></script>
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/pintuer2.0/pintuer-2.0.css">
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/css/admin.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=basePath%>/static/css/fontawesome4.7.0.css">
<script src="<%=basePath%>/static/js/bootstrap.js"></script>
<script src="<%=basePath%>/static/pintuer2.0/pintuer-2.0.min.js"></script>
</head>
<body>
		
		 <div class="button-group">
     		  <button class="button border-danger" onclick="history.back()">
     		  		<span>&#10006;</span> 后退</button>
		 	  <c:if test="${userrole<3 && (userwNum!=selectNum)}">
              <button type="button" name="add"
							class="button border-main " data-toggle="modal"
							data-target="#addhistory"><span class="icon-add-bg"></span> 新增记录</button>
			  </c:if>
			  
      <div class="drop">
        <button class="button text-sub"><span class="icon-clock-bg"></span>选择时间段 <i class="icon-down"></i></button>
        <div class="dropdown">
          <div class="list-link list-box bg-white">
            <a href="<%=basePath%>/money/findHistoryByNum?hNum=<%=wNum%>&hContent=本月">本月</a>
            <a href="<%=basePath%>/money/findHistoryByNum?hNum=<%=wNum%>&hContent=三月内">三月内</a>
            <a href="<%=basePath%>/money/findHistoryByNum?hNum=<%=wNum%>&hContent=全部">全部</a>
          </div>
        </div>
      </div>
      <c:if test="${userwNum==selectNum}">
			  <button style="float: right;" class="button text-info"
			  		data-toggle="modal" data-target="#updateBank">
			  			<span>&#36;</span>
			  		<c:if test="${bank!=null}">修改银行卡 </c:if>
			  		<c:if test="${bank==null}">添加银行卡 </c:if>
			  </button>
			
	  </c:if>
    </div>
    <c:if test="${bank!=null}">
    	<button style="float: right;" class="button button-icon">${fn:substring(bank.bNum,15,16)}</button>
    	<button style="float: right;" class="button button-icon">${fn:substring(bank.bNum,14,15)}</button>
    	<button style="float: right;" class="button button-icon">${fn:substring(bank.bNum,13,14)}</button>
    	<button style="float: right;" class="button button-icon">${fn:substring(bank.bNum,12,13)}</button>
    	<span style="float: right;margin-top:10px" >**** **** ****&nbsp;</span>
    	<span style="float: right;margin-top:5px;color: green;" >${bank.bBank}:&nbsp;</span>
    </c:if>
    <c:if test="${bank==null}">
    	<span style="float: right;margin-top:5px;color: red;" >暂未绑定银行卡</span>
    </c:if>
    	<div class="hr align-center"><span>${hw.department}${hw.wPname}${hw.wName}</span></div>
		<p class="text-center" style="color:orange">${hval}</p>
      <div class="fold" id="fold">
      		<c:forEach items="${hiss}" var="his" >
      		<div class="fold-item">
        		<div class="fold-head">
          	  		<div>
          	  			于<fmt:formatDate value="${his.hTime}" pattern="MM-dd"/>
          	  			${his.hContent},本月工资（${his.hPercentage}*${his.hMoney}）
          	 		</div>
        		</div>
    		</div>
    		</c:forEach>
   	  </div>
<!-- 新增记录 -->
	<div class="modal fade bs-example-modal-lg" id="addhistory"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header" style="text-align: center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<h4 class="modal-title" id="myLargeModalLabel">新增记录</h4>
				</div>

				<div class="modal-body">
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">事件：</label>
						</div>
						<div class="col-md-6">
							<input type="radio" name="hContent"  value="提成">提成&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="hContent" money="50"  value="请假">请假&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="hContent" money="200"  value="迟到">迟到&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="hContent" money="200"   value="早退">早退&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="hContent" money="500"   value="旷工">旷工&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<div class="col-md-4" id="d4">
			  
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">金额：</label>
						</div>
						<div class="col-md-6">
							<input id="hMoney" disabled=true type="text" class="input" name="hMoney" value="" />
						</div>
						<div class="col-md-4" id="d2">
			  				
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">百分比：</label>
						</div>
						<div class="col-md-6">
							<input id="hPercentage" disabled=true type="text" class="input" name="hPercentage" value="" />
						</div>
						<div class="col-md-4" id="d4">
			  
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" id="addbuton" class="btn btn-primary" onclick="addhistoryMeth()" style="pointer-events：auto;">发布</button>
				</div>

			</div>
		</div>
	</div>
	<!-- 银行卡修改 -->
	<div class="modal fade bs-example-modal-lg" id="updateBank"
		tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header" style="text-align: center">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<h4 class="modal-title" id="myLargeModalLabel">
						<c:if test="${bank!=null}">卡号修改</c:if>
						<c:if test="${bank==null}">卡号添加</c:if>
					</h4>
				</div>

				<div class="modal-body">

					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">请选择银行：</label>
						</div>
						<div class="col-md-6">
							<select id="updateBank"  name="department"  class="input">
								<c:if test="${bank!=null}">
									<option name="updatebBank" value="${bank.bBank}" class="option" >${bank.bBank}</option>
								</c:if>
								<c:if test="${bank==null}">
									<option name="updatebBank" value="-1" class="option" >请选择银行</option>
								</c:if>
								<option name="updatebBank" value="中国工商银行" class="option" >中国工商银行</option>
								<option name="updatebBank" value="中国农业银行" class="option" >中国农业银行</option>
								<option name="updatebBank" value="中国建设银行" class="option" >中国建设银行</option>
								<option name="updatebBank" value="中国邮政储蓄银行" class="option" >中国邮政储蓄银行</option>
								<option name="updatebBank" value="中国银行" class="option" >中国银行</option>
								<option name="updatebBank" value="招商银行" class="option" >招商银行</option>
							</select>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2" style="text-align: right">
							<label style="margin-top: 10px">请输入卡号：</label>
						</div>
						<div class="col-md-6">
							<input id="updatebNum" onkeyup="value=value.replace(/[^0-9]/g,'') "
							 type="text"   class="input" name="updatebNum" value="${bank.bNum }" />
						</div>
						<div class="col-md-4" id="d2">
			  				<p style="color:green;margin-top: 10px"><span>请输入16位银行卡</span></p>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<c:if test="${bank!=null}">
					<button type="button" id="addbuton" class="btn btn-primary" onclick="updateBankMethod()" style="pointer-events：auto;">保存</button>
					</c:if>
					<c:if test="${bank==null}">
					<button type="button" id="addbuton" class="btn btn-primary" onclick="addBankMethod()" style="pointer-events：auto;">保存</button>
					</c:if>
				</div>

			</div>
		</div>
	</div>
</body>
	<script type="text/javascript">
		//设置选中提成时，可以设置金额
		$(function(){
		 	//当input框改变时会被触发
	   		 $("input[type='radio']").change(function(){
	    	 var name=$(this).val();
	    	 if(name=="提成"){
	    		/*这里设置用户类型被选择后可以输入input框*/
	    	 	$("input[type='text']").prop("disabled",false);
	    		}else{
	    			 $("input[type='text']").prop("disabled",true);	
	    		}
	    	/*这里设置当用户类型换掉后input里的数据清空*/
	    	$("[name=hMoney]").val(null);
	    	$("[name=hPercentage]").val(null);
	    })
	    })
	 //添加记录
		function addhistoryMeth(){
			if (confirm("确认添加？")) {
			var wNum=<%=wNum%>;
			var content=$("input[type='radio'][name='hContent']:checked").val();
			var percentage=$("#hPercentage").val()
			var money=$("#hMoney").val()
			if(content!="提成"){
				percentage=-1;
				money=$("input[type='radio'][name='hContent']:checked").attr("money");
			}
			$.ajax({
				url:"<%=basePath%>/money/addHistoryByNum",
				type: "post",
				async: false,
				data : {
					hNum:wNum,
					hContent:content,
					hMoney:money,
					hPercentage:percentage
					
				},
				success : function(data) {
								if(data>0){
									alert("添加成功！")
								}
								window.location.reload();
							},
						error : function() {
							alert("请求失败");
						}
					})
			}
		}
		//修改银行卡
		function updateBankMethod(){
			var updateBank=$("#updateBank option:selected").val();
			var updatebNum=$("#updatebNum").val();
			var bWnum='${bank.bWnum}'
			var regex=/^[0-9]{16}$/
			if(regex.test(updatebNum)==false){
				alert("卡号长度不正确")
				return;
			}
			$.ajax({
				url:"<%=basePath%>/money/updateBank",
				type: "post",
				async: false,
				data : {
					bWnum:bWnum,
					bNum:updatebNum,
					bBank:updateBank
					
				},
				success : function(data) {
								if(data>0){
									alert("修改成功！")
								}
								window.location.reload();
							},
						error : function() {
							alert("请求失败");
						}
					})
		}
		//添加银行卡
		function addBankMethod(){
			var updateBank=$("#updateBank option:selected").val();
			var updatebNum=$("#updatebNum").val();
			var bWnum='${userwNum}'
			if(updateBank=="-1"){
				alert("请选择银行")
				return;
			}
			var regex=/^[0-9]{16}$/
			if(regex.test(updatebNum)==false){
				alert("卡号长度不正确")
				return;
			}
			$.ajax({
				url:"<%=basePath%>/money/addBank",
				type: "post",
				async: false,
				data : {
					bWnum:bWnum,
					bNum:updatebNum,
					bBank:updateBank
					
				},
				success : function(data) {
								if(data>0){
									alert("添加成功！")
								}
								window.location.reload();
							},
						error : function() {
							alert("请求失败");
						}
					})	
		}
		//页面加载完执行的方法
		$(document).ready(function(){ 
			var num='${fn:length(hiss)}';
			if(num==0){
				 document.querySelector("#fold").innerHTML="<center>本月表现正常</center>";
			}
			<%String hContent= request.getParameter("hContent");//用request得到路径上的参数%>
			$('a').each(function(){
				if(this.innerHTML=='<%=hContent%>'){
					$(this).prop("class",'active')
				}
			})
		})
	</script>
</html>