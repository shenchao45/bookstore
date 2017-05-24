<%--
  Created by IntelliJ IDEA.
  User: shenchao
  Date: 17/5/15
  Time: 下午7:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>图书信息管理系统</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        ul {
            list-style-type: none;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="text-primary">注册</h1>
    <div class="col-md-6 col-md-offset-3">
        <form class="form-horizontal" action="/register.action" method="post">
            <div class="form-group">
                <label for="inputusername" class="col-sm-2 control-label">用户名</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputusername" name="login.username"
                           placeholder="Username">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">密码</label>
                <div class="col-sm-10">
                    <input type="password" class="form-control" id="inputPassword3"
                           name="login.password" placeholder="Password">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-2 control-label">角色</label>
                <div class="col-sm-10">
                    <label class="radio-inline">
                        <input type="radio" name="login.role" checked id="inlineRadio1" value="0"> 管理员
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="login.role" id="inlineRadio2" value="1"> 读者
                    </label>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox"> 记住我
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">登录</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>
