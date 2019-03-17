<%-- 
    Document   : orderspage
    Created on : 17-Mar-2019, 18:37:52
    Author     : Casper
--%>
<%@page import="java.util.List"%>
<%@page import="FunctionLayer.Order"%>
<% List<Order> orders = (List<Order>) request.getAttribute("orders"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Orders Page</title>
        <jsp:include page="header.jsp"></jsp:include>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
        <h1>Ordrer</h1>
        <p>Liste med ordrer</p>
        
        <ul>
            <% for (Order o : orders) { %>
            <li> <%= o.toString() %></li>
            <% } %>
        </ul>
    </body>
</html>
