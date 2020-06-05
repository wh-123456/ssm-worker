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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>简历投递</title>
<script src="<%=basePath%>/static/js/jquery.js"></script>
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/pintuer2.0/pintuer-2.0.css">
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/css/admin.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/bootstrap.min.css">
<script src="<%=basePath%>/static/js/bootstrap.js"></script>
<script src="<%=basePath%>/static/pintuer2.0/pintuer-2.0.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/static/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
	<div>
		<div class="col-md-6">
					<div class="row">
						<div class="col-md-6" style="text-align: right">
							<label style="margin-top: 10px">请选择应聘岗位:</label>
						</div>
						<div class="col-md-6">
							<select id="choosedepartment" class="input">
								    <option name="addid" value="-1" class="option" >请选择岗位</option>
								<c:forEach items="${recruits}" var="depart">
									<option name="addid" pName="${depart.aPname}"  value="${depart.aDnum}" class="option" >${depart.aDname}${depart.aPname}</option>
								</c:forEach>
							</select>
						</div>
		 			</div>
		
					<div class="row">
						<div class="col-md-6" style="text-align: right">
							<label style="margin-top: 10px">姓名：</label>
						</div>
						<div class="col-md-6">
							<input id="name" type="text" class="input"  placeholder="请输入姓名" value="" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-6" style="text-align: right">
							<label style="margin-top: 10px">请选择性别：</label>
						</div>
						<div class="col-md-6" style="margin-top:5px">
							<input type="radio" name="sex" id="sex男" value="男">男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="sex" id="sex女" value="女">女&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
					</div>
					<div class="row">
						<div class="col-md-6" style="text-align: right">
							<label style="margin-top: 10px">年龄：</label>
						</div>
						<div class="col-md-6">
							<input id="age" type="text" placeholder="请输入年龄" class="input" value="" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-6" style="text-align: right">
							<label style="margin-top: 10px">毕业院校：</label>
						</div>
						<div class="col-md-6">
							<input id="school" placeholder="请输入学校" type="text" class="input" value="" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-6" style="text-align: right">
							<label style="margin-top: 10px">专业：</label>
						</div>
						<div class="col-md-6">
							<input id="speciality" placeholder="请输入专业" type="text" class="input" value="" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-6" style="text-align: right">
							<label style="margin-top: 10px">请选择学历：</label>
						</div>
						<div class="col-md-6" style="margin-top:10px">
							<input type="radio" name="education" id="edu高中" value="高中">高中&nbsp;&nbsp;&nbsp;
							<input type="radio" name="education" id="edu专科" value="专科">专科&nbsp;&nbsp;&nbsp;
							<input type="radio" name="education" id="edu本科" value="本科">本科&nbsp;&nbsp;&nbsp;
							<input type="radio" name="education" id="edu研究生" value="研究生">研究生&nbsp;&nbsp;&nbsp;
							<input type="radio" name="education" id="edu博士" value="博士">博士
						</div>
					</div>
					<div class="row">
						<div class="col-md-6" style="text-align: right">
							<label style="margin-top: 10px">请选择语言：</label>
						</div>
						<div class="col-md-6" style="margin-top:10px">
							<input type="radio" name="language" id="lgCET-6" value="CET-6">CET-6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="language" id="lgCET-4" value="CET-4">CET-4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="language" id="lg无" value="无">无
						</div>
					</div>
					<div class="row">
						<div class="col-md-6" style="text-align: right">
							<label style="margin-top: 10px">请选择政治面貌：</label>
						</div>
						<div class="col-md-6" style="margin-top:10px">
							<input type="radio" name="background" id="bg群众" value="群众">群众&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="background" id="bg团员" value="团员">团员&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="radio" name="background" id="bg党员" value="党员">党员
						</div>
					</div>
					<div class="row">
						<div class="col-md-6" style="text-align: right">
							<label style="margin-top: 10px">电话号码：</label>
						</div>
						<div class="col-md-6">
							<input id="tel"
							 placeholder="请输入联系手机号码" type="text" class="input"  value="" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-6" style="text-align: right">
							<label style="margin-top: 10px">邮箱：</label>
						</div>
						<div class="col-md-6">
							<input id="email" placeholder="请输入邮箱" type="text" class="input"  value="" />
						</div>
					</div>
					<div class="row">
						<div class="col-md-6" style="text-align: right">
						</div>
						<div class="col-md-6" style="margin-top:20px;text-align: right">
						<button type="button" class="btn btn-primary" id="addbuton"
						onclick="pushData()">提交</button>
						</div>
					</div>
	</div>
				<div class="col-md-6">
					<img width="600" src="<%=basePath%>static/images/专业团队.jpg" id="gifshow">
			    </div>
  </div>
</body>
<script type="text/javascript">
		function pushData(){
			var dnum=$("#choosedepartment option:selected").val();
			var pname=$("#choosedepartment option:selected").attr("pName");
			var name=$("#name").val()
			var sex=$("input[type='radio'][name='sex']:checked").val();
			var age=$("#age").val()
			var school=$("#school").val()
			var speciality=$("#speciality").val()
			var education=$("input[type='radio'][name='education']:checked").val();
			var language=$("input[type='radio'][name='language']:checked").val();
			var background=$("input[type='radio'][name='background']:checked").val();
			var tel=$("#tel").val()
			var email=$("#email").val()
			$.ajax({
				url:"<%=basePath%>/resume/addresume",
				type: "post",
				data : {
					rDnum:dnum,
					rPname:pname,
					rName:name,
					rSex:sex,
					rAge:age,
					rSchool:school,
					rSpeciality:speciality,
					rEducation:education,
					rLanguage:language,
					rBackground:background,
					rTel:tel,
					rEmail:email
				},
				success : function(data) {
					if(data>0){
						alert("简历投递成功，请等待回复！");
						window.location.reload();
					
					}else{
						alert("投递失败")
					}
							},
						error : function() {
							alert("新增请求失败,请检查输入是否有误！");
						}
			})
		}
		
		
</script>
</html>