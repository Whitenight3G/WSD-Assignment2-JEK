<%@page import="uts.wsd.*" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main Page</title>
    <h1 align="center" style="font-size:185px; background-color:white"><img src="Images/uts.jpg" alt="uts">Tutor</h1>
</head>

<p>Click <a href="logout.jsp">here</a> to log out your account</p>
<%if (session.getAttribute("user") != null) {
        if (session.getAttribute("user").getClass().toString().equals("class uts.wsd.Tutor")) {
            //check if the "user" is a tutor
            Tutor tutor = (Tutor) session.getAttribute("user");

            if (tutor != null) {
                String filePathT = application.getRealPath("WEB-INF/tutors.xml");
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String dob = request.getParameter("dob");
                String subject = request.getParameter("subject");
                String status = request.getParameter("status");%>
<body background="Images/wool.jpg">

    <%

        if (request.getParameter("email") != null) {
            tutor.setName(name);
            tutor.setEmail(email);
            tutor.setPassword(password);
            tutor.setDob(dob);

    %>
    <p>Details updated.</p>
    <%            }
    %>

    <h1>My Account</h1>

    <form action="account.jsp" method="POST">

        <table>

            <tr><td>Name</td><td><input type="text" value="<%= tutor.getName()%>" name="name"></td></tr>
            <tr><td>Email</td><td><input type="email" value="<%= tutor.getEmail()%>" name="email"></td></tr>
            <tr><td>Password</td><td><input type="password" value="<%= tutor.getPassword()%>" name="password"></td></tr>
            <tr><td>Date of birth</td><td><input type="date" value="<%= tutor.getDob()%>" name="dob"></td></tr>
            <tr><td>Your chosen subject: <%=tutor.getSubject()%></td></tr>
            <tr><td>You current status: <%=tutor.getStatus()%></td></tr>
            
            <tr><td></td><td><input type="submit" value="Save"></td></tr>
        </table>

        <%
            tutor.setName(name);
            tutor.setEmail(email);
            tutor.setPassword(password);
            tutor.setDob(dob);
            session.setAttribute("user", tutor);
        %>

        <input type="hidden" name="submitted" value="yes">
        <p>Return to the <a href="Main.jsp">main page</a>.</p>

    </form>
</body>
<%}
} else if (session.getAttribute("user").getClass().toString().equals("class uts.wsd.Student")) {
    //check if the "user" is a student

    Student student = (Student) session.getAttribute("user");
    if (student != null) {
        String filePathS = application.getRealPath("WEB-INF/students.xml");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String dob = request.getParameter("dob");
        String user = request.getParameter("user");%>

<body background="Images/wool.jpg">
    
    <%

        if (request.getParameter("email") != null) {
            student.setName(name);
            student.setEmail(email);
            student.setPassword(password);
            student.setDob(dob);

    %>
    <p>Details updated.</p>
    <%            }
    %>
    
    <h1>My Account</h1>

    <form action="account.jsp" method="POST">

        <table>

            <tr><td>Name</td><td><input type="text" value="<%= student.getName()%>" name="name"></td></tr>
            <tr><td>Email</td><td><input type="email" value="<%= student.getEmail()%>" name="email"></td></tr>
            <tr><td>Password</td><td><input type="password" value="<%= student.getPassword()%>" name="password"></td></tr>
            <tr><td>Date of birth</td><td><input type="date" value="<%= student.getDob()%>" name="dob"></td></tr>
            
            <tr><td></td><td><input type="submit" value="Save"></td></tr>
        </table>

        <%
            student.setName(name);
            student.setEmail(email);
            student.setPassword(password);
            student.setDob(dob);
            session.setAttribute("user", student);
        %>

        <input type="hidden" name="submitted" value="yes">
        <p>Return to the <a href="Main.jsp">main page</a>.</p>

    </form>
</body>

<%}
    }
} else if (session.getAttribute("user") == null) {
    //check if the "user" is neither
%>
<head>
<h1 align="center" style="font-size:185px">
    Session expired
</h1>
</head>
<body background="Images/wool.jpg">
    <p align="center" style="font-size:100px">Click <a href="index.jsp"><u>here</u></a> to go back.</p>

</body>
<%}%>
</html>
