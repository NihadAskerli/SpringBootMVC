<%@page import="com.example.entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
<%
    User u=(User) request.getAttribute("user");
%>
<div>
    <form action="userdetail" method="POST">
        <input type="hidden" name="action" value="update"/>
        <input type="hidden" name="id" value="<%=u.getId()%>"/>
        <label>name:</label>
        <input type="text" name="name" value="<%=u.getName()%>"/>
        <br>
        <label>surname:</label>
        <input type="text" name=surname value="<%=u.getSurname()%>"/>
        <input type="submit" name="save" value="Save"/>

    </form>
</div>

</body>
</html>
