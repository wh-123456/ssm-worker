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
<title>招聘广告</title>
<script src="<%=basePath%>/static/js/jquery.js"></script>
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/pintuer2.0/pintuer-2.0.css">
<link rel="stylesheet" type="text/css"  href="<%=basePath%>/static/css/admin.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/static/css/bootstrap.min.css">
<script src="<%=basePath%>/static/js/bootstrap.js"></script>
<script src="<%=basePath%>/static/pintuer2.0/pintuer-2.0.min.js"></script>
</head>
<body>
 	<div class="flip" id="flip" >
      	<div class="flip-body" style="text-align: center">
      		<div class="flip-item"><img src="<%=basePath%>/static/images/校徽.jpg" title="点击播放视频"
        	class="img-auto" alt="加载失败" data-toggle="modal" data-target="#mp4modal" /></div>
        	<c:if test="${notices!=null}">
        		<c:forEach items="${notices}" var="as">
        			<div class="flip-item">
        				<img src="<%=basePath%>/system/getImages2?content=${as.aContent}&author=${as.aWname}" 
        				class="img-auto" alt="加载失败" /></div>
        		</c:forEach>
        	</c:if>
      		<c:forEach items="${recruits}" var="as">
        	<div class="flip-item"><img src="<%=basePath%>/system/getImages?tit=本公司${as.aDname}招聘${as.aPname}岗位啦!
        	&type=工资福利：${as.aContent}&tel=联系人：${as.aWnum}——${as.aWname}" 
        	class="img-auto" alt="加载失败" /></div>
       		</c:forEach>
       		
      	</div>
      	
      	<div class="flip-prev" id="flip-prev"></div>
      	<div class="flip-next" id="flip-next"></div>
    </div>
    <div class="modal fade" id="mp4modal" style="display: none;">
    	<div class="modal-dialog">
        	<video src="<%=basePath%>/static/video/西院宣传视频.mp4" controls preload loop ></video>
        </div>
    </div>
</body>
<script type="text/javascript">
	$(function(){
    	$('#flip').flip({
      		 "autoplay":true,//自动播放
     		 "interval":3,//设置播放时间
     		 "page":true,
      		 "prev":"#flip-prev",
     		 "next":"#flip-next",
   			 });
  	});
</script>
</html>