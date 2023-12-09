<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/static/s/bootstrap.min.js"></script>
    <title>With-Play › <c:if test="${!empty userInfo}">${userInfo.username}</c:if><c:if test="${!empty errorInfo}">会员未找到</c:if></title>
</head>
<body>
<!-- 引入header文件 -->
<%@ include file="header.jsp"%>


<div class="panel panel-default" style="width: 70%;margin:1% 2% 5% 5%;float: left;">
    <div class="panel panel-default" id="main" style="">
        <div class="panel-heading" style="background-color: white">
            <a href="/">With-Play</a> › ${userInfo.username}
        </div>

        <div class="panel-body">
            <c:if test="${!empty userInfo}">
            <form class="form-horizontal" role="form" style="font-size: 16px;font-family: 'PingFang SC', 'SF Pro Display', 'Microsoft YaHei', sans-serif">
                <div style="margin-left: 5px; margin-top: 5px">
                    <img width="70px" height="70px" src="${userInfo.avatar}" class="img-rounded">
                </div><br/>
                <div class="form-group" style="margin-left: 5px; margin-top: 5px">
                    uid : ${userInfo.id}
                </div>
                <div class="form-group" style="margin-left: 5px; margin-top: 5px">
                    用户名 : ${userInfo.username}
                </div>
                <div class="form-group" style="margin-left: 5px; margin-top: 5px">
                    Email : ${userInfo.email}
                </div>
                <div class="form-group" style="margin-left: 5px; margin-top: 5px">
                    注册时间 : ${userInfo.localCreateTime}
                </div>
                <div class="form-group" style="margin-left: 5px; margin-top: 5px">
                    个人介绍 : ${userInfo.introduce}
                </div>
            </form>
            </c:if>
            <c:if test="${!empty errorInfo}">
                会员未找到!
            </c:if>
        </div>
    </div>
</div>

<!-- 引入侧边栏文件 -->
<%@ include file="side.jsp"%>

<!-- 引入footer文件 -->
<%@ include file="footer.jsp"%>

</body>
</html>