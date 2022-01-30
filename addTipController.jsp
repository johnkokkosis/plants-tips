<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="omadiki_classes.*"%>
<%@ page import="jdk.nashorn.internal.runtime.ECMAException" %>

<%
String tipContent = request.getParameter("content");
String date = request.getParameter("date");
String email = request.getParameter("email");
String plantId = request.getParameter("plantId");
int userId = 0;
int plantCode = 0;


try {
    UserDAO userDAO = new UserDAO();
    TipDAO tipDAO = new TipDAO();
    userId = userDAO.getUserIdByEmail(email);
    plantCode = Integer.parseInt(plantId);

    Tip tip = new Tip(
            tipContent,
            date,
            userId,
            plantCode
    );

    tipDAO.createNewTip(tip);
%>
<jsp:forward page="home.jsp"/>
<%}catch (Exception e) {
    request.setAttribute("error_message", e.getMessage());
%>
<jsp:forward page="add_tip.jsp"/>
<%}%>
