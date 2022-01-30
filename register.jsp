<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="header.jsp"%>
</head>
<body>
<%@include file="navbar.jsp"%>

<div class="container">
    <div class="alert alert-warning" role="alert">
        <p class="alert-text">Please fill in the following form to create an account</p>
    </div>


    <form action="registerController.jsp" method="POST" class="form-horizontal">

        <!-- firstname -->
        <div class="form-group">
            <label for="firstname" class="col-sm-2 control-label main-label">Name </label>
            <div class="col-sm-10">
                <input type="text" name="firstname" id="firstname" class="form-control" placeholder="your name">
            </div>
        </div>

        <!-- surname -->
        <div class="form-group">
            <label for="lastname" class="col-sm-2 control-label main-label">Surname </label>
            <div class="col-sm-10">
                <input type="text" name="lastname" id="lastname" class="form-control" placeholder="your surname">
            </div>
        </div>

        <!-- username -->
        <div class="form-group">
            <label for="username" class="col-sm-2 control-label main-label">Username </label>
            <div class="col-sm-10">
                <input type="text" name="username" id="username" class="form-control" placeholder="your username">
            </div>
        </div>

        <!-- email -->
        <div class="form-group">
            <label for="email" class="col-sm-2 control-label main-label">Email </label>
            <div class="col-sm-10">
                <input type="email" name="email" id="email" class="form-control" placeholder="your email">
            </div>
        </div>


        <!-- phone -->
        <div class="form-group">
            <label for="phone" class="col-sm-2 control-label main-label">Phone </label>
            <div class="col-sm-10">
                <input type="text" name="phone" id="phone" class="form-control" placeholder="your username">
            </div>
        </div>

        <!-- password -->
        <div class="form-group">
            <label for="password" class="col-sm-2 control-label main-label">Password </label>
            <div class="col-sm-10">
                <input type="password" name="password" id="password" class="form-control" placeholder="your password">
            </div>
        </div>

        <!-- confirm password -->
        <div class="form-group">
            <label for="confirm" class="col-sm-2 control-label main-label">Confirm </label>
            <div class="col-sm-10">
                <input type="password" name="confirm" id="confirm" class="form-control" placeholder="confirm your password">
            </div>
        </div>

        <%-- Consents --%>
        <div class="form-group">
            <label for="consents" class="col-sm-2 control-label main-label"></label>
            <div class="col-sm-10">
                <label class="checkbox-inline">
                    <input type="checkbox" name="consents" id="consents" value="SQL"> <p class="checkbox-text"> I agree to the terms and conditions</p>
                </label>
            </div>
        </div>

        <!-- buttons -->
        <div class="form-group">
            <div class="col-sm-10 col-sm-offset-2">
                <button type="submit" class="btn btn-success">
                    <span class="glyphicon glyphicon-ok"></span> Submit
                </button>
                <button type="reset" class="btn btn-danger">
                    <span class="glyphicon glyphicon-remove"></span> Cancel
                </button>
            </div>
        </div>

    </form>
</div>

<%@include file="footer.jsp"%>
</body>
</html>


