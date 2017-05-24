<%--
  Created by IntelliJ IDEA.
  User: shenchao
  Date: 17/5/15
  Time: 下午9:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>图书信息管理系统</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <style>
        h1 {
            width: 75px;
            margin: 20px auto;
        }
    </style>
</head>
<body>
<%@include file="common.jsp"%>
<div class="container">
<table id="table1" class="table table-hover">
    <thead>
    <tr>
        <th class="text-center">ISBN</th>
        <th class="text-center">作者</th>
        <th class="text-center">书名</th>
        <th class="text-center">出版日期</th>
        <th class="text-center">操作</th>
    </tr>
    </thead>
    <tbody>
    <s:iterator value="books" var="book" status="status">
        <tr>
            <th class="text-center" scope="row"><s:property value="#book.isbn"/></th>
            <td class="text-center"><s:property value="#book.author"/></td>
            <td class="text-center"><s:property value="#book.name"/></td>
            <td class="text-center">
                <s:date name="#book.date" format="yyyy-MM-dd"/>
            </td>
            <td class="text-center">
                <div class="btn-group" role="group">
                    <button type="button" id="<s:property value="#status.index+1"/>" key="<s:property value="#book.isbn"/>" class="btn btn-info btn_edit"
                            onclick="editInfo(this);">修改
                    </button>
                    <button type="button" id="<s:property value="#status.index+1"/>" key="<s:property value="#book.isbn"/>" class="btn btn-danger btn_delete" onclick="mySubmit(this)">删除
                    </button>
                    <button type="button" id="<s:property value="#status.index+1"/>" key="<s:property value="#book.isbn"/>" class="btn btn-warning" onclick="toOrder(this)">借阅
                    </button>
                </div>
            </td>
        </tr>
    </s:iterator>
    </tbody>
</table>
<div class="modal fade" id="myeditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="updateForm" action="/book_update.action" method="post">
                    <div class="form-group">
                        <label for="inputusername" class="col-xs-2 control-label">ISBN</label>
                        <div class="col-xs-10">
                            <input type="text" class="form-control" id="inputusername" disabled placeholder="ISBN" >
                            <input type="hidden" id="inputusername_con" name="book.isbn">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-xs-2 control-label">作者</label>
                        <div class="col-xs-10">
                            <input id="author" type="text" class="form-control" id="inputPassword3"
                                   name="book.author" placeholder="作者">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword4" class="col-xs-2 control-label">书名</label>
                        <div class="col-xs-10">
                            <input id="name" type="text" class="form-control" id="inputPassword4"
                                   name="book.name" placeholder="书名">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword5" class="col-xs-2 control-label">出版日期</label>
                        <div class="col-xs-10">
                            <input id="date" type="date" class="form-control" id="inputPassword5"
                                   name="book.date" placeholder="出版日期">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" onclick="toSubmit()" class="btn btn-primary">确定</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="myDeleteModal" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">提示</h4>
            </div>
            <div class="modal-body">
                <p class="text-danger" id="message"></p>
                <input type="hidden" id="myid">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" onclick="myDelete();" >确定</button>
            </div>
        </div>
    </div>
</div>
</div>
<script>
    function toOrder(obj) {
        var key = $(obj).attr("key");
        $.ajax({
            type: 'POST',
            url: '/lend_add.action',
            data: {"lend.book.isbn":key},
            success: function(data){
                if(data=="success"){
                    alert("借阅成功");
                    window.location.href = "/book_list.action"
                }
            }
        });
    }
    function editInfo(obj) {
        var attr = $(obj).attr("id");
        var isbn = $("#table1")[0].rows[attr].cells[0].innerText;
        var author = $("#table1")[0].rows[attr].cells[1].innerText;
        var name = $("#table1")[0].rows[attr].cells[2].innerText;
        var date = $("#table1")[0].rows[attr].cells[3].innerText;
        $("#inputusername").val(isbn)
        $("#inputusername_con").val(isbn)
        $("#author").val(author)
        $("#name").val(name)
        $("#date").val(date)
        $('#myeditModal').modal('show');
    }

    function toSubmit() {
        var isbn = $("#inputusername_con").val();
        var author = $("#author").val();
        var date = $("#date").val();
        var name = $("#name").val();
        $.ajax({
            type: 'POST',
            url: '/book_update.action',
            data: {"book.isbn":isbn, "book.author":author,"book.name":name,"book.date":date},
            success: function(data){
                if(data=="success"){
                    alert("修改成功");
                    window.location.href = "/book_list.action"
                }
            }
        });
    }

    function mySubmit(obj) {
        var attr = $(obj).attr("id");
        var name = $("#table1")[0].rows[attr].cells[2].innerText;
        $("#message")[0].innerHTML="确定要删除次本书吗:&lt;&lt;"+name+"&gt;&gt;?";
        $("#myid").val($("#table1")[0].rows[attr].cells[0].innerText)
        $('#myDeleteModal').modal('show');
    }
    function myDelete(){
        window.location.href = "/book_delete.action?book.isbn=" + $("#myid").val();
    }
</script>
</body>
</html>
