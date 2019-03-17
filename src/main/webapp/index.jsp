<%-- 
    Document   : index
    Created on : 16-Mar-2019, 18:50:57
    Author     : Casper
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="WEB-INF/header.jsp"></jsp:include>
        </head>
        <body>
            <div class="container">
                <h1>Hello World!</h1>

                <form method="POST" action="FrontController" class="form-inline">
                    <input type="hidden" name="command" value="login">
                    <input type="text" class="form-control mb-2 mr-sm-2" name="email" id="email-login" placeholder="Email">
                    <input type="password" class="form-control mb-2 mr-sm-2" name="password" id="password-login" placeholder="Password">
                    <button type="submit" class="btn btn-success mb-2">Login</button>
                </form>
                
                <span>eller..</span><button type="button" class="btn btn-link" data-toggle="modal" data-target="#registerModal">Opret</button>

                <div class="modal" id="registerModal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Opret Bruger</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <form method="POST" action="FrontController">
                                    <input type="hidden" name="command" value="register">
                                    <div class="form-group">
                                        <input type="text" class="form-control" name="email" id="username-reg" placeholder="Email">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" name="password-1" id="password-1-reg" placeholder="Password">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control" name="password-2" id="password-2-reg" placeholder="Password">
                                    </div>

                            </div>
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-success btn-sm">Opret</button>
                                </form>
                                <button type="button" class="btn btn-danger btn-sm" data-dismiss="modal">Luk</button>
                            </div>
                        </div>
                    </div>
                </div>
            <% String error = (String) request.getAttribute("error");
                if (error != null) {
                    out.println("<H2>Error!!</h2>");
                    out.println(error);
                }
            %>
        </div>

        <!-- Popper JS -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </body>
</html>
