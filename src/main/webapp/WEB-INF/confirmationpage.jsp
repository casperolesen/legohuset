<%-- 
    Document   : confirmationpage
    Created on : 17-Mar-2019, 17:00:11
    Author     : Casper
--%>
<jsp:include page="checkLogin.jsp"></jsp:include>
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="header.jsp"></jsp:include>
    </head>
    <body>
        <jsp:include page="menu.jsp"></jsp:include>
        <h1>Tillykke med dit køb!</h1>
        
        <p>Hus: <%= request.getParameter("length") + "x" + request.getParameter("width") + "x" + request.getParameter("height") %></p>
        
        <table class="table" id="sidesTable" style="display: none">
                <thead>
                    <tr>
                        <th>type</th>
                        <th>side 1</th>
                        <th>side 2</th>
                        <th>side 3</th>
                        <th>side 4</th>
                        <th>total</th>
                        <th>total x højde</th>
                    </tr>
                </thead>
                <tbody id="tbody-demo">
                </tbody>
            </table>
        
        <script>
            $(document).ready(function(){
                previewLegoHouseTable(<%= request.getParameter("length") %>, <%= request.getParameter("width") %>, <%= request.getParameter("height") %>);
            });
        </script>
    </body>
</html>
