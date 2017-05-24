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
        <th class="text-center">作者</th>
        <th class="text-center">书名</th>
        <th class="text-center">出版日期</th>
        <th class="text-center">借阅时间</th>
        <th class="text-center">归还时间</th>
        <th class="text-center">操作</th>
    </tr>
    </thead>
    <tbody>
    <s:iterator value="lends" var="lend" status="status">
        <tr>
            <th class="text-center" scope="row"><s:property value="#lend.book.author"/></th>
            <td class="text-center"><s:property value="#lend.book.name"/></td>
            <td class="text-center">
                <s:date name="#lend.book.date" format="yyyy-MM-dd"/>
            </td>
            <td class="text-center">
                <s:date name="#lend.borrowDate" format="yyyy-MM-dd"/>
            </td>
            <td class="text-center">
                <s:date name="#lend.endDate" format="yyyy-MM-dd"/>
            </td>
            <td class="text-center">
                <div class="btn-group" role="group">
                    <button type="button" id="<s:property value="#status.index+1"/>" key="<s:property value="#lend.id"/>" class="btn btn-danger btn_delete" onclick="repay(this)">归还
                    </button>
                    <button type="button" id="<s:property value="#status.index+1"/>" key="<s:property value="#lend.id"/>" class="btn btn-warning" onclick="delay1(this)">续借
                    </button>
                </div>
            </td>
        </tr>
    </s:iterator>
    </tbody>
</table>
</div>
<script>
    function repay(obj) {
        var key = $(obj).attr("key");
        $.ajax({
            type: 'POST',
            url: '/lend_delete.action',
            data: {"id":key},
            success: function(data){
                if(data=="success"){
                    alert("归还成功");
                    window.location.href = "/lend_list.action"
                }
            }
        });
    }
    function delay1(obj) {
        var key = $(obj).attr("key");
        $.ajax({
            type: 'POST',
            url: '/lend_delay.action',
            data: {"id":key},
            success: function(data){
                if(data=="success"){
                    alert("续借成功");
                    window.location.href = "/lend_list.action"
                }
            }
        });
    }
</script>
</body>
</html>
