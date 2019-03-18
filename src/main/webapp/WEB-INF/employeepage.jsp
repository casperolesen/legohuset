<%-- 
    Document   : employeepage
    Created on : 17-Mar-2019, 13:30:21
    Author     : Casper
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Page</title>
        <jsp:include page="header.jsp"></jsp:include>
    </head>
    <body>
        <div class="container">
        <jsp:include page="menu.jsp"></jsp:include>
        
        <h1>Hello <%=request.getParameter( "email")%></h1>
        You are now logged in as a EMPLOYEE of our wonderful site.
        </div>
    </body>
</html>
