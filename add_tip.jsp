<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="omadiki_classes.*"%>

<%@ include file="check_authentication.jsp"%>

<%
    String plantId = request.getParameter("plantId");
    PlantDAO plantDAO = new PlantDAO();
    Plant plant = plantDAO.getPlantByID(plantId);
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
            </div>
        </div>
        <h1 style="text-align: center">Μουράσου μερικά tips για το συγκεκριμένο φυτό</h1>
        <br>
        <form action="addTipController.jsp" method="POST" class="form-horizontal">
            <div class="form-group">
                <label for="date" class="col-sm-2 control-label main-label">Ημερομηνία </label>
                <div class="col-sm-10">
                    <input type="date" name="date" id="date" class="form-control" required>
                </div>
            </div>
            <div class="form-group">
                <label for="content" class="col-sm-2 control-label main-label">Περιεχόμενο Tip </label>
                <div class="col-sm-10">
                    <textarea name="content" id="content" class="form-control" placeholder="πληκτορλόγησε το tip εδώ..." required></textarea>
                </div>
            </div>
            <div class="form-group">
                <label for="plantId" class="col-sm-2 control-label main-label">Για το φυτό </label>
                <div class="col-sm-10">
                    <input type="text" name="plantId" id="plantId" class="form-control" value="<%=plant.getPlantId()%>" required>
                </div>
            </div>

            <div class="form-group">
                <label for="email" class="col-sm-2 control-label main-label">Email Δημοσίευσης </label>
                <div class="col-sm-10">
                    <input type="email" name="email" id="email" class="form-control" value="<%=user.getEmail()%>" required>
                </div>
            </div>

            <!-- buttons -->
            <div class="form-group">
                <div class="col-sm-10 col-sm-offset-2" style="text-align: center">
                    <button  type="submit" class="btn btn-success">
                        <span class="glyphicon glyphicon-ok"></span> Υποβολή
                    </button>
                </div>
            </div>
        </form>
    </div>

    <%@include file="footer.jsp"%>
</body>
</html>