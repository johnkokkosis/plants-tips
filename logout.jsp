<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

    session.invalidate();
    request.setAttribute("success_message", "Η αποσύνδεση πραγματοποιήθηκε επιτυχώς!");
%>

<jsp:forward page="login.jsp" />