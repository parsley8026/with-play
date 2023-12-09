<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<header>
    <meta charset="UTF-8">
    <style>
        div.toolbar-container {
            background-color: #888;
            width: 100%;
            min-width: 1148px;
            box-sizing: border-box;
            padding: 0 24px;
            height: 48px;
            line-height: 48px;
            margin: 0 auto;
            display: -webkit-box;
            display: -ms-flexbox;
            display: flex;
            -webkit-box-pack: justify;
            -ms-flex-pack: justify;
            justify-content: space-between;
        }

        div.toolbar-container-logo {
            max-width: 80px;
            height: 100%;
            margin-right: 8px;
            position: relative;
            float: left;
        }

        div.toolbar-container-left {
            -webkit-box-flex: 0;
            -ms-flex: none;
            flex: none;
        }

        div.toolbar-container-middle {
            padding: 0 32px;
        }
        div.toolbar-search {
            width: 100%;
            max-width: 720px;
            height: 32px;
            line-height: 32px;
            margin-top: calc((48px - 32px)/ 2);
            margin-left: auto;
            margin-right: auto;
            position: relative;
        }
        input.toolbar-search-input {
            float: left;
            font-size: 14px;
            display: inline-block;
            width: 500px;
            height: 100%;
            line-height: inherit;
            border: 0 none;
            outline: 0;
            background: #f5f6f7;
            color: #222226;
            vertical-align: top;
            text-indent: 32px;
            border-right: none;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            border-radius: 16px 0 0 16px;
        }
        button.toolbar-search-button {
            float: left;
            display: inline-block;
            width: 60px;
            height: 100%;
            outline: 0;
            border: 0 none;
            box-sizing: border-box;
            border-radius: 0 16px 16px 0;
            font-size: 14px;
            line-height: 32px;
            cursor: pointer;
            -webkit-transition: all .2s ease-in;
            transition: all .2s ease-in;
            background-color: #fc5531;
            text-align: left;
        }

        div.toolbar-container-right {
            padding: 0;
            margin: 0;
            -webkit-box-sizing: content-box;
            box-sizing: content-box;
            font-family: 'PingFang SC','SF Pro Display','Microsoft YaHei',sans-serif;
        }
        div.toolbar-container-user {
            height: 100%;
        }
        div.toolbar-container-user-avatar {
            padding: 0 20px;
            float: left;
        }
        div.toolbar-container-user-menu {
            height: 100%;
            padding: 0 20px;
            display: inline-block;
            float: left;
        }

        ul.toolbar-menus {
            width: auto;
            height: 100%;
            font-size: 0;
            background-color: #888;
        }

        ul.toolbar-menus > li {
            position: relative;
            display: inline-block;
            list-style: none;
            font-size: 14px;
            height: 100%;
            line-height: 48px;
        }

        ul.toolbar-menus > li a {
            display: block;
            color: white;
            text-align: center;
            padding: 0px 14px;
            text-decoration: none;
        }
        ul.toolbar-menus > li a:hover {
            background-color: #666;
        }

        .button-login {
            box-sizing: border-box;
            background-color: #777;
            border: 0 none;
            border-radius: 8px;
            color: #fff;
            font-family: revert;
            font-size: 14px;
            padding: 0 0;
            text-align: center;
            width: 80px;
            height: 100%;
        }

    </style>
</header>

<body>
    <div class="toolbar-container">
        <div class="toolbar-container-left">
            <ul class="toolbar-menus">
                <li> <a href="/">首页</a></li>
                <li> <a href="/tab/football">足球</a></li>
                <li> <a href="/tab/basketball">篮球</a></li>
                <li> <a href="/tab/badminton">羽毛球</a></li>
                <li> <a href="/tab/pingpong">乒乓球</a></li>
                <li> <a href="/tab/tennis">网球</a></li>
                <li> <a href="/tab/volleyball">排球</a></li>
                <li> <a href="/tab/run">跑步</a></li>
                <li> <a href="/tab/others">其他</a></li>
            </ul>
        </div>

        <div class="toolbar-container-middle">
            <div class="toolbar-search">
                <input id="searchInput" name="searchInput" class="toolbar-search-input"/><button id="searchBtn" class="toolbar-search-button">
                    <span style="color: white; font-family: 'PingFang SC', 'SF Pro Display', 'Microsoft YaHei', sans-serif">
                        搜索
                    </span>
                </button>
            </div>
        </div>

        <div class="toolbar-container-right">
            <div class="toolbar-container-user">
                <div class="toolbar-container-user-avatar"></div>
                <div class="toolbar-container-user-menu">
                    <ul class="toolbar-menus">
                        <c:if test="${empty userId}">
                            <!--未登陆-->
                            <li> <button id="loginStartBtn" class="button-login">登录/注册</button></li>
                        </c:if>

                        <c:if test="${!empty userId}">
                            <!--已登陆-->
                            <%--<li> <a href="/joined/${sessionScope.username}">已发布</a></li>--%>
                            <%--<li> <a href="/published/${sessionScope.username}">已受邀</a></li>--%>
                            <li> <a href="/member/${sessionScope.username}">${sessionScope.username}</a></li>
                            <li> <a href="/settings">设置</a></li>
                            <li><a href="javascript:signout_confirm();">登出</a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <script>
        // 监听搜索按钮的点击事件
        $("#searchBtn").click(function() {
            console.log("ssss")
            // 获取搜索框的值
            var searchTerm = $("#searchInput").val();

            // 构建搜索结果页面的URL
            var searchResultUrl = '/search?searchInput=' + searchTerm;

            // 重定向到搜索结果页面
            window.location.href = searchResultUrl;
        });
    </script>
    <%@include file="login.jsp" %>
</body>

<script>
    <%--退出--%>
    function signout_confirm()
    {
        var r=confirm("确定退出?")
        if (r==true)
        {
            window.location.href="/signout";
        }
    }
</script>