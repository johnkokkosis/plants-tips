<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="omadiki_classes.*" %>


<%
    String firstname = request.getParameter("firstname");
    String lastname = request.getParameter("lastname");
    String username = request.getParameter("username");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String password = request.getParameter("password");
    String confirm = request.getParameter("confirm");
    String consents = request.getParameter("consents");

// convert to UTF-8 to support Greek characters
    if (firstname != null) {
        firstname = new String(firstname.getBytes("ISO-8859-1"), "UTF-8");
    }

    if (lastname != null) {
        lastname = new String(lastname.getBytes("ISO-8859-1"), "UTF-8");
    }

    int counter = 0;

    try {

        // firstname
        if (firstname == null || firstname.length() < 3) {
            counter++;
        }

        // lastname
        if (lastname == null || lastname.length() < 3) {
            counter++;
        }

        // username
        if (username == null || username.length() < 5) {
            counter++;
        }

        /*
         * Validating email address
         * Reference: https://stackoverflow.com/questions/624581/what-is-the-best-java-email-address-validation-method
         */
        String ePattern = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$";
        java.util.regex.Pattern p = java.util.regex.Pattern.compile(ePattern);
        java.util.regex.Matcher m = p.matcher(email);

        if (!m.matches()) {
            counter++;
        }

        // password
        if (password == null || password.length() < 5) {
            counter++;
        }

        // password matches confirm
        if (password == null || !password.equals(confirm)) {
            counter++;
        }
        // consents
        if (consents == null) {
            counter++;
        }

        // check if form has errors
        if (counter > 0) {
            throw new Exception("<b>" + counter + " " + (counter == 1 ? "error" : "errors") + " detected!</b>");
        }

        UserDAO userdao = new UserDAO();

        User user = new User(firstname, lastname, username, email, phone, password);

        userdao.registerUser(user); // save user to db

        request.setAttribute("success_message", "Woo hoo! Your registration has been completed successfully!");
        session.setAttribute("authentication", user);

%>
<jsp:forward page="home.jsp"/>
<%
} catch (Exception e) {
    request.setAttribute("error_message", e.getMessage());
%>

<jsp:forward page="register.jsp"/>

<%
    }

%>