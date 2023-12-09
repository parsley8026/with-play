<%--
  Created by IntelliJ IDEA.
  User: 86152
  Date: 2023/12/6
  Time: 10:00
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <%--<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>--%>
        <%--<script src="js/jquery-3.2.1.js"></script>--%>
        <%--<script src="js/bootstrap.min.js"></script>--%>
        <%--<script src="js/js.cookie.js"></script>--%>

        <style>
            .login-model {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }
            .login-container {
                font-family: Arial, sans-serif;
                width: 300px;
                margin: 150px auto;
                padding: 20px;
                background-color: #f5f5f5;
                border: 1px solid #ddd;
                border-radius: 5px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            }
            .login-close {
                float: right;
                position: relative;
                top: 5px;
                right: 8px;
                color: #aaa;
                font-size: 28px;
                font-weight: bold;
            }

            .login-close:hover,
            .login-close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }

            .login-container h2 {
                text-align: center;
                color: #333;
            }

            .form-group {
                margin-bottom: 20px;
            }

            .form-group label {
                display: block;
                margin-bottom: 5px;
                color: #333;
            }

            .form-group input[type="text"],
            .form-group input[type="password"] {
                width: 100%;
                padding: 8px;
                border-radius: 3px;
                border: 1px solid #ccc;
            }

            .form-group button {
                width: 100%;
                padding: 10px;
                background-color: #333;
                color: #fff;
                border: none;
                border-radius: 3px;
                cursor: pointer;
            }

            .form-group button:hover {
                background-color: #111;
            }
        </style>
    </head>

    <body>
        <div id="loginModel" class="login-model">
            <%--登录窗口--%>
            <div id="loginContainer" class="login-container">
                <span id="loginClose" class="login-close">&times;</span>
                <h2>Login</h2>
                <form id="loginForm" onsubmit="return validate()" method="post">
                    <div class="form-group">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="username" placeholder="Enter your username">
                        <div>
                            <span id="usernameInfo" style="padding-left: 2px; color: red; font-size: 12px"></span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" placeholder="Enter your password">
                        <div>
                            <span id="passwordInfo" style="padding-left: 2px; color: red; font-size: 12px"></span>
                        </div>
                    </div>

                    <div>
                        <input type="checkbox" id="remember" name="remember" value="remember"/>记住密码
                    </div>

                    <div class="form-group">
                        <button id="loginBtn">Login</button>
                    </div>
                </form>
            </div>
        </div>

        <script>
            // Get the modal
            var loginModal = document.getElementById('loginModel');
            var spanLoginClose = document.getElementById("loginClose");
            var form = document.querySelector('.login-container form');
            var loginBtn = document.getElementById("loginBtn");
            var loginStartBtn = document.getElementById("loginStartBtn");
            var validateFlag = false;

            $("#loginStartBtn").click(function () {
                resetForm();
                resetInfo();
                loginModal.style.display = "block";
            })
            spanLoginClose.onclick = function(event) {
                loginModal.style.display = "none";
            }
            form.onclick = function(event) {
                event.stopPropagation(); // 阻止事件冒泡
            }

            // 记住登录信息
            function rememberLogin(username, password, checked) {
                Cookies.set('loginStatus', {
                    username: username,
                    password: password,
                    remember: checked
                }, {expires: 30, path: ''})
            }
            // 若选择记住登录信息，则进入页面时设置登录信息
            function setLoginStatus() {
                var loginStatusText = Cookies.get('loginStatus')
                if (loginStatusText) {
                    var loginStatus
                    try {
                        loginStatus = JSON.parse(loginStatusText);
                        $('#username').val(loginStatus.username);
                        $('#passwd').val(loginStatus.password);
                        $("#remember").prop('checked',true);
                    } catch (__) {}
                }
            }
            // 设置登录信息
            // setLoginStatus();

            function validate() {
                if (validateFlag) {
                    validateFlag = false;
                    return true;
                }
                else{
                    return false;
                }
            }
            function resetInfo() {
                $("#usernameInfo").text("");
                $("#passwordInfo").text("");
            }
            function resetForm() {
                $("#username").val("");
                $("#password").val("");
            }
            $("#loginBtn").click(function () {
                resetInfo();
                var id =$("#username").val();
                var passwd=$("#password").val();
                var remember=$("#remember").prop('checked');
                if( id=='' && passwd==''){
                    $("#usernameInfo").text("账号和密码不能为空");
                }
                else if ( id ==''){
                    $("#usernameInfo").text("账号不能为空");
                }
                else if( passwd ==''){
                    $("#passwordInfo").text("密码不能为空");
                }
                else {
                    $.ajax({
                        type: "POST",
                        url: "/api/loginCheck",
                        data: {
                            username:id ,
                            password: passwd
                        },
                        dataType: "json",
                        success: function(data) {
                            if(data.stateCode.trim() == "0") {
                                $("#usernameInfo").text("用户名不存在!");
                            } else if(data.stateCode.trim() == "1") {
                                $("#passwordInfo").text("密码错误!");
                            } else if(data.stateCode.trim() == "2"){
                                validateFlag = true;
                                $("#loginForm").submit();
                                if(remember){
                                    rememberLogin(id,passwd,remember);
                                }else {
                                    Cookies.remove('loginStatus');
                                }
                                window.location.href="/";
                            }
                        }
                    });
                }
            })
        </script>
    </body>
</html>
