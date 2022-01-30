<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="header.jsp"%>
</head>
<body>
 <%@include file="navbar.jsp"%>

 <div class="container">
     <div class="page-header">
         <h1>Oops something went wrong</h1>
     </div>

     <div class="row">

         <div class="col-xs-12">

             <h2>Description</h2>

             <% if(exception != null) { %>
             <p><code><%=exception %></code></p>
             <% } %>

         </div>

     </div>

 </div><!-- /.container -->
<%@include file="footer.jsp"%>
</body>