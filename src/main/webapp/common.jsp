<%--
  Created by IntelliJ IDEA.
  User: shenchao
  Date: 17/5/23
  Time: 下午12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/">图书馆信息管理系统</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#"
                       class="dropdown-toggle <s:if test="#session.user==null||#session.user.role!=0">disabled</s:if> "
                       data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">学生管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="javascript:void(0)" onclick="addStudent()">添加学生</a></li>
                        <li><a href="/student_list.action" onclick="addStudent()">学生列表</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#"
                       class="dropdown-toggle <s:if test="#session.user==null||#session.user.role!=0">disabled</s:if>"
                       data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">图书管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="javascript:void(0)" onclick="addBook()">添加图书</a></li>
                        <li><a href="/book_list.action">图书列表</a></li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-left">
                <div class="form-group">
                    <input type="text" id="mquery" class="form-control" placeholder="书名/作者/ISBN" value="<s:property value="query"></s:property> ">
                </div>
                <button type="button" onclick="myquery()" class="btn btn-default">检索</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/lend_list.action">我的借阅</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">系统管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="javascript:void(0)" onclick="login()">登录</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#" onclick="logout()">注销</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">切换帐号</a></li>
                    </ul>
                </li>
                <s:if test="#session.user!=null">
                    <li><a href="#">欢迎您: <s:property value="#session.user.username"/> </a></li>
                </s:if>
                <s:if test="#session.user==null">
                    <li><a href="#">未登录</a></li>
                </s:if>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<div id="loginModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">登录</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="/login.action" method="post">
                    <div class="form-group">
                        <label for="loginusername" class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="loginusername" name="login.username"
                                   placeholder="Username">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="loginpassword" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="loginpassword"
                                   name="loginpassword" placeholder="Password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">角色</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="login.role" id="inlineRadio1" checked value="0"> 管理员
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
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" onclick="toLogin()">登录</button>
            </div>
        </div>
    </div>
</div>
<div id="addBookModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">添加图书</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="/book_add.action" method="post">
                    <div class="form-group">
                        <label for="bookISBN" class="col-sm-2 control-label">ISBN</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="bookISBN" name="book.isbn" placeholder="ISBN">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="bauthor" class="col-sm-2 control-label">作者</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="bauthor"
                                   name="book.author" placeholder="作者">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="bname" class="col-sm-2 control-label">书名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="bname"
                                   name="book.name" placeholder="书名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="bdate" class="col-sm-2 control-label">出版日期</label>
                        <div class="col-sm-10">
                            <input type="date" class="form-control" id="bdate"
                                   name="book.date" placeholder="出版日期">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" onclick="toAddBook()">确定</button>
            </div>
        </div>
    </div>
</div>
<div id="addStudentModal" class="modal fade" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">添加学生</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" action="/register.action" method="post">
                    <div class="form-group">
                        <label for="susername" class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="susername" name="login.username"
                                   placeholder="Username">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="spassword" class="col-sm-2 control-label">密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="spassword"
                                   name="login.password" placeholder="Password">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">角色</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input id="srole" type="radio" name="login.role" checked id="inlineRadio3" value="0">
                                管理员
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="login.role" id="inlineRadio4" value="1"> 读者
                            </label>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" onclick="toAddStudent()">确定</button>
            </div>
        </div>
    </div>
</div>
<script>
    function toAddStudent() {
        var username = $("#susername").val();
        var password = $("#spassword").val();
        var role = $("#srole")[0].checked ? "0" : "1";
        $.ajax({
            type: 'POST',
            url: '/register.action',
            data: {"login.username": username, "login.password": password, "login.role": role},
            success: function (data) {
                if (data == "success") {
                    alert("添加成功")
                    window.location.href = "/"
                }
            }
        });
    }
    function myquery() {
        window.location.href = '/book_toQuery.action?query='+$("#mquery").val()
    }

    function toAddBook() {
        var bookISBN = $("#bookISBN").val();
        var bdate = $("#bdate").val();
        var bname = $("#bname").val();
        var author = $("#bauthor").val();
        $.ajax({
            type: 'POST',
            url: '/book_add.action',
            data: {"book.isbn": bookISBN, "book.name": bname, "book.date": bdate, "book.author": author},
            success: function (data) {
                if (data == "success") {
                    alert("添加成功")
                    window.location.href = "/book_list.action"
                }
            }
        });
    }
    function logout() {
        window.location.href = "/logout.action"
    }
    function toLogin() {
        var username = $("#loginusername").val();
        var password = $("#loginpassword").val();
        $.ajax({
            type: 'POST',
            url: '/login.action',
            data: {"login.username": username, "login.password": password},
            success: function (data) {
                if (data == "success") {
                    window.location.href = "/"
                } else {
                    $.messager.alert("提示", "用户名或者密码错误", "error");
                }
            }
        });
    }
    function login() {
        $('#loginModal').modal('show');
    }
    function addBook() {
        $('#addBookModal').modal('show');
    }
    function addStudent() {
        $("#addStudentModal").modal('show');
    }
</script>