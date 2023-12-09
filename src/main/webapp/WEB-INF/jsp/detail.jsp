<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="Content-Type"  content="text/html;charset=utf-8">

    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

    <title>${post.title} - With-Play </title>
    <style>
        .reply-my-container {
            display: flex;
            align-items: center;
            /*width: 400px;*/
            background-color: #f2f2f2;
            border-radius: 5px;
            padding: 10px;
            justify-content: center; /* 将内容水平居中 */
        }

        .reply-my-input {
            flex: 1;
            padding: 10px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            width: 500px;
        }

        .reply-my-button {
            margin-left: 10px;
            padding: 10px 20px;
            background-color: green;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
        }
    </style>
</head>

<body>
<%@ include file="header.jsp"%>
<div style="width: 70%;height: 90%; margin:1% 2% 1% 5%;float: left;">
    <%-- 帖子内容 --%>
    <div class="panel panel-default" id="postMain" style="height: 50%">
        <div class="panel-heading" style="background-color: white; height: 100%;">
            <div class="panel-heading" style="background-color: white">
                <a href="/">With-Play</a> › 主题
            </div>
            <div style="height: 100%">
                <div style="float: left;margin-top: 18px;width: 100px; height: 100%;margin-left: 5px" >
                    <div>
                        <a href="/member/${post.user.username}"><img width="80px" height="80px" src="${post.user.avatar}" class="img-rounded"></a>
                    </div>
                    <div>
                        <div style="text-align: left; padding-left: 2px">
                            <a href="/member/${post.user.username}">
                                <span style="font-size: 16px;
                                             font-family: 'PingFang SC', 'SF Pro Display', 'Microsoft YaHei', sans-serif;"
                                ><strong>${post.user.username}</strong></span>
                            </a>
                        </div>
                        <br>
                        <div>
                            <small class="text-muted">${post.localCreateTime}&nbsp;&nbsp;</small>&nbsp;&nbsp;
                        </div>
                        <div>
                            <small class="text-muted">${post.click}次点击</small>
                        </div>
                    </div>
                </div>
                <div style="width:calc(100% - 105px);height:85%;overflow:auto;float: left;margin-top: -18px; justify-content: space-between;">
                    <div style="height: 10%">
                        <h3 style="text-align: center">${post.title}</h3><br/>
                    </div>
                    <div style="font-size: 16px;
                                font-family: 'PingFang SC', 'SF Pro Display', 'Microsoft YaHei', sans-serif;
                                margin-left: 20px; height: 50%">
                        <p style="white-space: pre-wrap">${post.content}</p>
                    </div>
                    <div style="height: 10%">
                        日期 <span>${post.activeTime} - ${post.activeTime}</span><br>
                        地点 <span>${post.location}</span><br>
                        人数 <span><span id="nowPeopleNum">${post.nowPeopleNum}</span>/${post.maxPeopleNum}</span><br>
                    </div>
                    <div style=" margin-left: 20px; margin-bottom:20px; align-items: center; justify-content: center; text-align: center">

                        <button id="join" class="btn btn-success" style="display: inline-block">
                            <c:if test="${userId ne post.userId}">${joinFlag}</c:if>
                            <c:if test="${userId == post.userId}">取消</c:if>
                        </button>
                        <c:if test="${joinFlag == '已加入'}">
                            <button id="exit" class="btn btn-success" style="display: inline-block; background-color: #dd0000">
                                退出活动
                            </button>
                        </c:if>
                        <%--用户不是发帖人就可以加入--%>
<%--                            <c:if test="${userId ne post.userId}">--%>
<%--                                <button id="join" class="btn btn-success">${joinFlag}</button>--%>
<%--                            </c:if>--%>
<%--                            <c:if test="${user == post.userId}">--%>
<%--                                <button id="cancel" class="btn btn-sucess">取消</button>--%>
<%--                            </c:if>--%>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div style="height: 60%">
        <%-- 回复基本信息 --%>
        <c:if test="${!empty replies}">
            <div class="panel panel-default" id="replyMain" style="">
                <div class="panel-heading" style="background-color: white">
                <span>
                        ${fn:length(replies)} 回复  |  最近回复 <c:forEach items="${replies}" var="reply" varStatus="status">
                    <c:if test="${status.last}">
                        ${reply.localCreateTime}
                    </c:if>
                </c:forEach>
                </span>
                </div>

                <ul class="list-group" style="width: 100%">
                    <!-- 遍历评论 -->
                    <c:forEach items="${replies}" var="reply">
                        <li class="list-group-item">
                            <div style="height: 50px">
                                <div style="float: left;width: 6%;margin-bottom: 5px">
                                    <img width="50px" height="50px" src="${reply.user.avatar} " class="img-rounded">
                                </div>
                                <div style="width: 89%;float: left">
                                    <a href="/member/${reply.user.username}"><strong>${reply.user.username}</strong></a>&nbsp;&nbsp;
                                    <small class="text-muted">${reply.localCreateTime}</small>
                                    <br/>
                                    <div>
                                        <p style="white-space: pre-wrap">${reply.content}</p>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>

        <%--  回复发布者  --%>
        <c:if test="${!empty user}">
            <div class="panel panel-default" id="replyUserMain" style="margin-top: 60px">
                <%-- 回复框 --%>
                <div class="reply-my-container" style="width: 100%">
                    <form action="/reply/add" method="post">
                        <input type="hidden" name="postId" value="${post.id}">
                        <input type="hidden" name="replyUserId" value="${user.id}">
                        <input type="text" name="content" placeholder="在此输入回复内容" class="reply-my-input">
                        <button type="submit" class="reply-my-button">回复</button>
                    </form>
                </div>
            </div>
        </c:if>
    </div>
        <script>
            $("#join").click(function () {
                var joinFlag = $("#join").text().trim();
                if (joinFlag === "请先登录") {
                    window.alert("登录才可以加入哦");
                    return;
                }
                if (joinFlag === "已满员"){
                    alert("该活动已满员");
                    return;
                }
                if (joinFlag === "已加入"){
                    alert("您已加入该活动");
                    return;
                }
                var uid = "${user.id}";
                var postId = "${post.id}";
                if (joinFlag === "取消") {
                    $.ajax({
                        type: "POST",
                        url: "/cancel",
                        data: {
                            uid:uid,
                            postId: postId
                        },
                        dataType: "json",
                        success: function(data) {
                            if (data.done == 'done') {
                                alert("您已取消活动!");
                                $("#join").text("已取消");
                            }else {
                                console.log("无法取消")
                            }
                        },
                        error: function () {
                            alert("您已取消活动!");
                            $("#join").text("已取消");
                            $("#nowPeopleNum").val(0);
                            console.log("其实AJAX请求失败")
                        }
                    });
                    return;
                }
                if (joinFlag === "加入") {
                    $.ajax({
                        type: "POST",
                        url: "/join",
                        data: {
                            uid:uid,
                            postId: postId
                        },
                        dataType: "json",
                        success: function(data) {
                            if (data.done == 'done') {
                                alert("您已成功加入!");
                                $("#join").text("已加入");
                            }else {
                                console.log("无法加入")
                            }
                        },
                        error: function () {
                            alert("您已成功加入!");
                            $("#join").text("已加入");
                            $("#nowPeopleNum").val($("#nowPeopleNum").text() + 1);
                            console.log("其实AJAX请求失败")
                        }
                    });
                }
            })

            $("#exit").click(function () {
                var exitFlag = $("#exit").text().trim();
                var uid = "${user.id}";
                var postId = "${post.id}";
                if (exitFlag === "退出活动") {
                    $.ajax({
                        type: "POST",
                        url: "/exitInvitee",
                        data: {
                            uid:uid,
                            postId: postId
                        },
                        dataType: "json",
                        success: function(data) {
                            if (data.done == 'done') {
                                alert("您已退出活动!");
                                $("#exit").text("已退出");
                            }else {
                                console.log("无法退出")
                            }
                        },
                        error: function () {
                            alert("您已退出活动!");
                            $("#exit").text("已退出");
                            $("#nowPeopleNum").text()($("#nowPeopleNum").text()-1);
                            console.log("其实AJAX请求失败")
                        }
                    });
                }
            })
        </script>

</div>


<!-- 引入侧边栏文件 -->
<%@ include file="side.jsp"%>

<!-- 引入footer文件 -->
<%@ include file="footer.jsp"%>

</body>
</html>