<%-- 
    Document   : orderspage
    Created on : 17-Mar-2019, 18:37:52
    Author     : Casper
--%>

<jsp:include page="checkLogin.jsp"></jsp:include>

<%@page import="FunctionLayer.User"%>
<%@page import="java.util.List"%>
<%@page import="FunctionLayer.Order"%>
<%  User user = (User) session.getAttribute("user");
    List<Order> orders = (List<Order>) request.getAttribute("orders"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Orders Page</title>
        <jsp:include page="header.jsp"></jsp:include>
        </head>
        <body>
            <div class="container">
            <jsp:include page="menu.jsp"></jsp:include>
                <h1>Ordrer</h1>
            <% if (orders.size() < 1) { %>
            <p>Ingen ordrer at vise endnu..</p>
            <% } %>
            <ul class="list-group">
                <% for (Order o : orders) {%>
                <li class="list-group-item" id="orderListItem"> <%= o.getId() + " " + o.getOdetail()%>

                    <% if (user.getRole().equals("employee")) {%>
                    <form method="POST" action="FrontController" class="form-inline">
                        <input type="hidden" name="command" value="orders">
                        <input type="hidden" name="orderToShip" value="<%= o.getId()%>">
                        <button type="button" class="btn btn-primary btn-sm" onclick="showOrderDetail(<%= o.getId()%>)">Info</button>
                        <% if (o.isSent()) { %>
                        <button type="button" class="btn btn-success btn-sm" disabled>Sendt</button>
                        <% } else { %>
                        <button type="submit" class="btn btn-success btn-sm">Send</button>
                        <% }%>
                    </form>
                    <% } else {%>
                    <button type="button" class="btn btn-primary btn-sm" onclick="showOrderDetail(<%= o.getId()%>)">Info</button>

                    <% if (o.isSent()) { %>

                    <button type="button" class="btn btn-success btn-sm" disabled="">Sendt</button>
                    <% } else { %>
                    <button type="button" class="btn btn-warning btn-sm" disabled="">Afventer</button>
                    <% }
                        }%>

                </li>
                <li class="list-group-item list-group-item-secondary odetailListItem" id="odetailListItem<%= o.getId()%>" style="display: none">
                    <span class="mr-auto">
                    <%= o.getOdetail().getLength() + " x "
                            + o.getOdetail().getWidth() + " x "
                            + o.getOdetail().getHeight()%>
                    </span>
                    <% if (o.getOdetail().hasDoor()) { %>
                    <div class="form-check-inline disabled">
                        <label class="form-check-label">
                            <input type="checkbox" class="form-check-input" checked disabled>Dør
                        </label>
                    </div>
                    <% } else { %>
                    <div class="form-check-inline disabled">
                        <label class="form-check-label">
                            <input type="checkbox" class="form-check-input" disabled>Dør
                        </label>
                    </div>
                    <% }
                        if (o.getOdetail().hasWindow()) { %>
                    <div class="form-check-inline disabled">
                        <label class="form-check-label">
                            <input type="checkbox" class="form-check-input" checked disabled>Vindue
                        </label>
                    </div>
                    <% } else { %>
                    <div class="form-check-inline disabled">
                        <label class="form-check-label">
                            <input type="checkbox" class="form-check-input" disabled>Vindue
                        </label>
                    </div>
                    <% } %>
                </li>
                <% }%>
            </ul>

        </div>

        <script>
            function showOrderDetail(id) {
                $("#odetailListItem" + id).toggle();
            }
        </script>
    </body>
</html>
