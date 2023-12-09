<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <style>
        li {list-style-type:none;}
        html, body {
            height: 100%;
            font-size: 14px;
            color: #525252;
            font-family: NotoSansHans-Regular,AvenirNext-Regular,arial,Hiragino Sans GB,"Microsoft Yahei","Hiragino Sans GB","WenQuanYi Micro Hei",sans-serif;
            background: #f0f2f5;
        }
        .footer {

            background-color: #fff;
            margin-top: 22px;
            margin-bottom: 22px;
            width: 100%;
            padding-top: 22px;
            color: #8A8A8A;
            display: block;
            height: 100px;
            border: 1px ;
            clear:both
        }

        .container {
            margin-right: 5%;
            margin-left: 5%;
            padding-left: 15px;
            padding-right: 15px;
            padding-top: 15px;
            width: 100%;
            /*min-width: 1280px;*/
            height: 30%;
            float: left;
            text-align: center;
        }
        .info {
            margin-right: 5%;
            width: 100%;
            float: right;
        }
a{
    color: #8A8A8A;
    cursor: pointer;
}
    </style>
</head>
<body>
<footer class="footer">
    <div class="container">
        我们为您提供了一个运动社交的平台，希望您在这里认识到志同道合的朋友，一起运动，一起分享，一起快乐！
        <br/><br/><br/>
    </div>
    <div class="info">
        <p style="text-align: right">更多内容请访问 <a href="https://github.com/parsley8026">GitHub</a></p>
    </div>
</footer>
</body>
</html>