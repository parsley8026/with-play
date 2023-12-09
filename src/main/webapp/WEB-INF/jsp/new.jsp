<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
    <title>创作新主题 › with-play </title>

    <style>
        .publish-button {
            margin-left: 10px;
            padding: 10px 20px;
            background-color: #fc5531;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            cursor: pointer;
            width: 100px;
            height: 45px;
        }
    </style>
</head>
<body>
<!-- 引入header文件 -->
<%@ include file="header.jsp"%>

    <div style="width: 70%;margin:1% 2% 1% 5%;float: left;">
    <div class="panel panel-default" id="main" style="">
        <div class="panel-heading" style="background-color: white">
            <a href="/">With-Play</a> › 创作新主题
        </div>

        <div class="panel-body">
            <form action="/post/add" method="post" id="replyForm">
                <div class="form-group">
                    <label for="title">主题标题</label>
                    <input type="text" class="form-control" id="title" name="title" placeholder="请输入主题标题，如果标题能够表达完整内容，则正文可以为空" required="required">
                </div>
                <div class="form-group">
                    <label for="content">正文</label>
                    <textarea class="form-control" rows="10" id="content" name="content"></textarea>
                </div>

                <div class="form-group" style="margin-bottom: 0">
                    <div style="width: 40%">
                        <label for="tab" style="display: inline-block">板块 </label><br/>
                        <select class="form-control" id="tab" name="tab">
                            <c:forEach items="${tabs}" var="tab">
                            <option value="${tab.id}">${tab.tabName}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div style="width: 40%">
                        <div style="height: 30%; margin-top: 50px">
                            <div style="display: inline-block; width: 49%">
                                <div style="display: flex">
                                    <label for="active-time"
                                           style="display: inline-block; width: 70px; justify-content: center; margin-top: 5px">开始日期 </label>
                                    <input type="datetime-local" id="active-time" name="active-time" style="flex: 1">
                                </div>
                            </div>
                            <div style="display: inline-block; width: 49%">
                                <div style="display: flex">
                                    <label for="end-time"
                                           style="display: inline-block; width: 70px; justify-content: center; margin-top: 5px">结束日期 </label>
                                    <input type="datetime-local" id="end-time" name="end-time" style="flex: 1">
                                </div>
                            </div>
                        </div>
                        <div style="height: 30%; margin-top: 10px; display: flex">
                            <label for="active-location"
                                   style="display: inline-block; width: 70px; justify-content: center; margin-top: 5px">活动地点 </label>
                            <input type="text" id="active-location" name="active-location" style="flex: 1">
                        </div>
                        <div style="height: 30%; margin-top: 10px; display: flex">
                            <label for="active-people"
                                   style="display: inline-block; width: 70px; justify-content: center; margin-top: 5px">参与人数</label>
                            <input type="number" id="active-people" name="active-people" min="0" style="flex: 1">
                        </div>
                    </div>
                </div>
                <div style="justify-content: center; align-items: center; width: 100%; margin-top: 30px;display: flex">
                    <input type="submit" class="publish-button" value="发布">
                </div>

            </form>
        </div>
    </div>

</div>
    <div class="panel panel-default" id="sidebar2" style="width: 20%;margin:1% 2% 1% 0%;float: right">
        <div class="panel-heading" style="background-color: white;text-align: center">
            发帖提示
        </div>
        <ul class="list-group" style="width: 100%">
            <li class="list-group-item">
                <h5>主题标题</h5>
                <p>
                    请在标题中描述内容要点。如果一件事情在标题的长度内就已经可以说清楚，那就没有必要写正文了。
                </p>
            </li>

            <li class="list-group-item">
                <h5>正文</h5>
                <p>
                    请清楚地表达所要说明的内容。
                </p>
            </li>
        </ul>
    </div>
    <div class="panel panel-default" id="sidebar1" style="width: 20%;margin:1% 2% 1% 0%;float: right">
        <div class="panel-heading" style="background-color: white;text-align: center">
            社区指导原则
        </div>
        <ul class="list-group" style="width: 100%">
            <li class="list-group-item">
                <h5>尊重他人</h5>
                <p>
                    请不要发布任何辱骂、色情、歧视、诽谤、恐吓等违反法律法规的内容。
                </p>
            </li>

            <li class="list-group-item">
                <h5>友好互助</h5>
                <p>
                    保持对陌生人的友善，与他人友好交流，共同维护社区的良好氛围。
                </p>
            </li>
        </ul>
    </div>

<!-- 引入footer文件 -->
<%--<%@ include file="footer.jsp"%>--%>

<script>
    function submitValidate(flag){
        return flag;
    }
    $("#replyForm").submit(function () {
        if($("#title").val()==''){
            alert("请填写标题！");
            return submitValidate(false);
        }else {
            var ifSubmit=confirm("确定发表该主题吗?");
            if (ifSubmit == true){}else {
                return submitValidate(false);
            }
        }
    })

    var now = new Date().toISOString().slice(0, 16);  // 将当前时间转换为 datetime-local 格式
    // 设置最小时间为当前时间
    var startTime = document.getElementById("active-time");
    var endTime = document.getElementById("end-time");
    startTime.min = now;
    endTime.addEventListener("change", function (){
        endTime.min = startTime.value;
    })
</script>
</body>
</html>