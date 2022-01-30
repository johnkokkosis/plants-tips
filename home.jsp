<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="omadiki_classes.*"%>
<%@ page import="java.util.List" %>

<%
PlantDAO plantDAO = new PlantDAO();
List<Plant> plants = plantDAO.getAllPlants();
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
        <%for (Plant plant: plants){%>
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
                    <hr>
                    <div class="row" style="text-align: center">
                        <a href="plant_details.jsp?plantId=<%=plant.getPlantId()%>" class="btn btn-lg btn-success">Λεπτομέριες</a>
                    </div>
                </div>
            </div>
        <%}%>
    </div>

    <%@include file="footer.jsp"%>
</body>
</html>