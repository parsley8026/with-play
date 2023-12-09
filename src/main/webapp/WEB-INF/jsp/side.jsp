<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div style="width: 20%; float:right;">
    <c:if test="${!empty userId}">
        <!-- 已登录 -->
        <div class="panel panel-default" id="sidebar2" style="width: 100%;margin:1% 2% 1% 0%;float: right">
            <div class="panel-heading" style="background-color: white;text-align: center">
                <a href="/member/${user.username}">${user.username}</a>
            </div>
            <ul class="list-group" style="width: 100%">
                <li class="list-group-item"><a href="/new">发布新帖</a></li>
                <li class="list-group-item"><a href="/inviter/${sessionScope.get("userId")}">我发布的帖子</a></li>
                <li class="list-group-item"><a href="/invitee/${sessionScope.get("userId")}">我接受的邀请</a></li>
            </ul>
        </div>
    </c:if>

    <div class="panel panel-default" id="sidebar1" style="width: 100%;margin:1% 2% 1% 0%;float: right;overflow: hidden">
        <div class="panel-heading" style="background-color: white;text-align: center">
            热议主题
        </div>
        <ul class="list-group" style="width: 100%">
            <c:forEach items="${hotestPosts}" var="hotestPost">
                <li class="list-group-item"><a href="/post/${hotestPost.id}">${hotestPost.title}</a></li>
            </c:forEach>
        </ul>
    </div>
</div>



