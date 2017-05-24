<%--
  Created by IntelliJ IDEA.
  User: shenchao
  Date: 17/5/15
  Time: 下午7:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>图书信息管理系统</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/bootstrap-theme.min.css">
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/easyui.css">
    <link rel="stylesheet" type="text/css" href="css/icon.css">
    <script src="js/jquery.easyui.min.js"></script>
    <style>
        ul {
            list-style-type: none;
        }
        h1 {
            width: 290px;
            margin: 30px auto;
        }
    </style>
</head>
<body>
<%@ include file="common.jsp"%>
<div class="container" style="margin-top: 30px">
    <h1>图书信息管理系统</h1>
    <div id="myCarousel" class="carousel slide">
        <!-- 轮播（Carousel）指标 -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
            <li data-target="#myCarousel" data-slide-to="3"></li>
            <li data-target="#myCarousel" data-slide-to="4"></li>
        </ol>
        <!-- 轮播（Carousel）项目 -->
        <div class="carousel-inner">
            <div class="item active">
                <img src="images/1495531141600.jpg" alt="First slide">
            </div>
            <div class="item">
                <img src="images/1495531144178.jpg" alt="Second slide">
            </div>
            <div class="item">
                <img src="images/1495531148161.jpg" alt="Third slide">
            </div>
            <div class="item">
                <img src="images/149553125736.jpg" alt="Third slide">
            </div>
            <div class="item">
                <img src="images/1495531254525.jpg" alt="Third slide">
            </div>
        </div>
        <!-- 轮播（Carousel）导航 -->
        <a class="carousel-control left" href="#myCarousel"
           data-slide="prev">&lsaquo;
        </a>
        <a class="carousel-control right" href="#myCarousel"
           data-slide="next">&rsaquo;
        </a>
    </div>
</div>
</body>
</html>