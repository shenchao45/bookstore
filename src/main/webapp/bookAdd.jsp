<%--
  Created by IntelliJ IDEA.
  User: shenchao
  Date: 17/5/16
  Time: 上午9:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书信息管理系统</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        ul {
            list-style-type: none;
        }

        h1 {
            width: 150px;
            margin: 20px auto;
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="text-primary">添加图书</h1>
    <div class="col-md-6 col-md-offset-3">
        <form class="form-horizontal" action="/book_add.action" method="post">
            <div class="form-group">
                <label for="inputusername" class="col-sm-2 control-label">ISBN</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputusername" name="book.isbn" placeholder="ISBN">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">作者</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputPassword3"
                           name="book.author" placeholder="作者">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword4" class="col-sm-2 control-label">书名</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="inputPassword4"
                           name="book.name" placeholder="书名">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword5" class="col-sm-2 control-label">出版日期</label>
                <div class="col-sm-10">
                    <input type="date" class="form-control" id="inputPassword5"
                           name="book.date" placeholder="出版日期">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">添加</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
</html>

