<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta content="text/html;charset=utf-8">

    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <style>
        li {list-style-type:none;}
        html, body {
            height: 100%;
            font-size: 14px;
            color: #525252;
            font-family: NotoSansHans-Regular,AvenirNext-Regular,arial,Hiragino Sans GB,"Microsoft Yahei","Hiragino Sans GB","WenQuanYi Micro Hei",sans-serif;
            background: #f0f2f5;
        }
        a{
            color: #8A8A8A;
            cursor: pointer;
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@ include file="header.jsp"%>
<%--<%@include file="login.jsp"%>>--%>
<div class="panel panel-default" id="main" style="width: 70%;margin:1% 2% 5% 5%;float: left;">

    <ul class="list-group" style="width: 100%; padding-left: 0">
        <c:forEach items="${posts}" var="post">
        <li class="list-group-item" style="height: 65px">
            <div style="height: 50px; overflow: hidden">
                <div style="width: 5%;float: left">
                    <img width=50px height="50px" src="${post.user.avatar}" class="img-rounded"/>
                </div>
                <div style="width: 90%;float: left;">
                    <a href="/t/${post.id}">${post.title}</a><br/>
                    <div>
                        <a><span class="label label-default" >${post.tab.tabName}</span></a>&nbsp;&nbsp;&nbsp;
                        <small class="text-muted">${post.localCreateTime}</small>
                    </div>
                </div>
                <div style="width: 5%;text-align: center;float: left;">
                    <span class="badge">${post.countReplies}</span>
                </div>
            </div>
            <br>
        </li>
        </c:forEach>
    </ul>
</div>

<%-- 引入侧边栏 --%>
<%@ include file="side.jsp"%>
<!-- 引入footer文件 -->
<%@ include file="footer.jsp"%>
</body>
</html>