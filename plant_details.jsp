<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="omadiki_classes.*"%>
<%@ page import="java.util.List" %>

<%
    String plantId = request.getParameter("plantId");
    PlantDAO plantDAO = new PlantDAO();
    Plant plant = plantDAO.getPlantByID(plantId);
    int plantCode = Integer.parseInt(plant.getPlantId());
    TipDAO tipDAO = new TipDAO();
    UserDAO userDAO = new UserDAO();

    List<Tip> tips = tipDAO.getTipsByPlantId(plantCode);
%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <%@ include file="header.jsp"%>
        <style>
            .image-container{
                display: flex;
                justify-content: center;
            }

            .image-content{
                border-radius: 20%;
            }

            .content__style {
                text-align: center;
                font-size: large;
            }
        </style>
    </head>
<body>
    <%@include file="navbar.jsp"%>

    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title"><%=plant.getPlantName()%></h3>
            </div>
            <div class="panel-body">
                <div class="image-container">
                    <img class="image-content" src="images/roses-2.jpg" alt="">
                </div>
                <hr>
                <div class="row">
                    <p class="content__style"><%=plant.getPlantSmallDescription()%></p>
                </div>
                <div class="row">
                    <p class="content__style"><%=plant.getPlantFullDescription()%></p>
                </div>
                <hr>
                <div class="row" style="text-align: center">
                    <a href="add_tip.jsp?plantId=<%=plant.getPlantId()%>" class="btn btn-lg btn-success">Προσθήκη Tip</a>
                </div>
            </div>
        </div>
        <br>
        <h2 style="text-align: center">Tips για το φυτό <%=plant.getPlantName()%></h2>
        <br>
        <%for (Tip tip: tips) {%>
                <div class="panel panel-primary">
                    <div class="panel-heading">
                        <h3 class="panel-title">Δημοσιέυτηκε στις <code><%=tip.getTipDatePosted()%></code> από <code><%=userDAO.getUsernameById(tip.getUserPosted())%></code></h3>
                    </div>
                    <div class="panel-body">
                        <p><%=tip.getTipContent()%></p>
                    </div>
                </div>
        <%}%>
    </div>

    <%@include file="footer.jsp"%>
</body>
</html>