<%-- 
    Document   : customerpage
    Created on : 17-Mar-2019, 15:28:11
    Author     : Casper
--%>
<jsp:include page="checkLogin.jsp"></jsp:include>

<%@page import="FunctionLayer.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer home page</title>
        <jsp:include page="header.jsp"></jsp:include>
        </head>
        <body>
            <div class="container">
            <jsp:include page="menu.jsp"></jsp:include>

                <h1>Hello <%= ((User) session.getAttribute("user")).getEmail()%> </h1>
            You are now logged in as a customer of our wonderful site.

            <form method="POST" action="FrontController" class="form-inline mb-2" id="legoForm">
                <input type="hidden" name="command" value="buy">
                <input type="text" class="form-control mr-sm-2" name="length" id="lengthInput" placeholder="Længde">
                <input type="text" class="form-control mr-sm-2" name="width" id="widthInput" placeholder="Bredde">
                <input type="text" class="form-control mr-sm-2" name="height" id="heightInput" placeholder="Højde">
                <div class="form-check-inline disabled">
                    <label class="form-check-label">
                        <input type="checkbox" class="form-check-input" name="door" id="doorInput" value="true">Dør 6x4
                    </label>
                </div>
                <div class="form-check-inline disabled">
                    <label class="form-check-label">
                        <input type="checkbox" class="form-check-input" name="window" id="windowInput" value="true">Vindue 4x4
                    </label>
                </div>
                <button type="button" class="btn btn-primary btn-sm mr-sm-2" id="previewBtn">Vis</button>
                <button type="submit" class="btn btn-success btn-sm" id="buyBtn">Bestil</button>
            </form>

            <% String error = (String) request.getAttribute("error");
                if (error != null) {
            %>
            <div class="alert alert-warning">
                <strong>Error!</strong> <%= error%>
            </div>

            <% }%>
            <span id="error"></span>
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

            <div id="houseBuilderContainer">
                <div class="row">
                    <div class="col">
                        <div id="houseBuilderFront"></div>
                    </div>

                    <div class="col">
                        <div id="houseBuilderSide"></div>
                    </div>
                </div>
            </div>

            <script>

                $(document).ready(function () {

                    $("#legoForm").submit(function () {
                        return validateLegoInput();
                    });

                    $("#previewBtn").click(function () {
                        var len = $("#lengthInput").val();
                        var wid = $("#widthInput").val();
                        var h = $("#heightInput").val();
                        var err = $("#error");
                        var door = $("#doorInput").is(":checked");
                        var window = $("#windowInput").is(":checked");

                        $("#houseBuilderFront").empty();
                        $("#sidesTable").hide();
                        err.empty();

                        if (len.length < 1) {
                            err.text("Udfyld venligst længde..");
                            return;
                        } else if (wid.length < 1) {
                            err.text("Udfyld venligst bredde..");
                            return;
                        } else if ((len < 12 || wid < 12 || h < 8) && (door || window)) {
                            err.text("Du skal bruge et større hus.. Mindst 12x12x8, hvis du vil have dør og/eller vindue");
                            return false;
                        } else if (h.length < 1) {
                            err.text("Udfyld venligst højde..");
                            return;
                        }

                        previewLego();
                        previewLegoHouseTable(len, wid, h);

                    });
                });

            </script>

            <script>

            </script>

            <script>
                function previewLego() {
                    var len = $("#lengthInput").val();
                    var wid = $("#widthInput").val() - 4;
                    var h = $("#heightInput").val();
                    var big_len = 0, medium_len = 0, small_len = 0;
                    var big_wid = 0, medium_wid = 0, small_wid = 0;

                    var width = $("#widthInput").val();
                    var height = $("#heightInput").val();

                    var build = $("#houseBuilderFront");
                    var row;



                    for (var i = 1; i <= h; i++) {
                        big_len = 0, medium_len = 0, small_len = 0;
                        big_wid = 0, medium_wid = 0, small_wid = 0;

                        console.log("lag " + i);
                        if (i % 2 > 0) {
                            var l = len;
                            var w = width - 4;

                            // siden med evt. dør
                            while (l > 0) {
                                if (l >= 4) {
                                    big_len++;
                                    l -= 4;
                                } else if (l >= 2) {
                                    medium_len++;
                                    l -= 2;
                                } else {
                                    small_len++;
                                    l -= 1;
                                }
                            }

                            // siden med evt. vindue
                            while (w > 0) {
                                if (w >= 4) {
                                    big_wid++;
                                    w -= 4;
                                } else if (w >= 2) {
                                    medium_wid++;
                                    w -= 2;
                                } else {
                                    small_wid++;
                                    w -= 1;
                                }
                            }

                            var big_count = big_len, medium_count = medium_len, small_count = small_len;
                            var blocks = big_count + medium_count + small_count;
                            var line = $("<div></div>").addClass("progress");
                            var row;
                            var big_size = (4 / len) * 100;
                            var medium_size = (2 / len) * 100;
                            var small_size = (1 / len) * 100;

                            var colorChanger = 1;

                            while (blocks > 0) {

                                while (big_count > 0) {
                                    if (colorChanger % 2 > 0) {
                                        row = $("<div></div>").addClass("progress-bar").css("width", big_size + "%").text("2x4");
                                    } else {
                                        row = $("<div></div>").addClass("progress-bar bg-success").css("width", big_size + "%").text("2x4");
                                    }

                                    colorChanger++;
                                    big_count--;
                                    blocks -= 4;
                                    line.append(row);
                                }

                                while (medium_count > 0) {
                                    if (colorChanger % 2 > 0) {
                                        row = $("<div></div>").addClass("progress-bar bg-info").css("width", medium_size + "%").text("2x2");
                                    } else {
                                        row = $("<div></div>").addClass("progress-bar bg-warning").css("width", medium_size + "%").text("2x2");
                                    }

                                    colorChanger++;
                                    medium_count--;
                                    blocks -= 2;
                                    line.append(row);
                                }

                                while (small_count > 0) {
                                    if (colorChanger % 2 > 0) {
                                        row = $("<div></div>").addClass("progress-bar bg-danger").css("width", small_size + "%").text("2x1");
                                    } else {
                                        row = $("<div></div>").addClass("progress-bar bg-dark").css("width", small_size + "%").text("2x1");
                                    }

                                    colorChanger++;
                                    small_count--;
                                    blocks -= 1;
                                    line.append(row);
                                }

                            }

                            build.prepend(line);

                            console.log("big_len: " + big_len + " medium_len: " + medium_len + " small_len: " + small_len);
                            console.log("big_wid: " + big_wid + " medium_wid: " + medium_wid + " small_wid: " + small_wid);

                        } else {
                            var l = len - 4;
                            var w = width;

                            // siden med evt. vindue
                            while (w > 0) {
                                if (w >= 4) {
                                    big_wid++;
                                    w -= 4;
                                } else if (w >= 2) {
                                    medium_wid++;
                                    w -= 2;
                                } else {
                                    small_wid++;
                                    w -= 1;
                                }
                            }

                            // siden med evt. dør
                            while (l > 0) {
                                if (l >= 4) {
                                    big_len++;
                                    l -= 4;
                                } else if (l >= 2) {
                                    medium_len++;
                                    l -= 2;
                                } else {
                                    small_len++;
                                    l -= 1;
                                }
                            }

                            var big_count = big_len, medium_count = medium_len, small_count = small_len;
                            var blocks = big_count + medium_count + small_count;
                            var line = $("<div></div>").addClass("progress");
                            var row;
                            var end_size = (2 / len) * 100;
                            var big_size = (4 / len) * 100;
                            var medium_size = (2 / len) * 100;
                            var small_size = (1 / len) * 100;
                            var procent = 100;

                            var startPiece = $("<div></div>").addClass("progress-bar bg-secondary startPiece").css("width", end_size + "%").text("side");
                            var endPiece = $("<div></div>").addClass("progress-bar bg-secondary endPiece").css("width", end_size + "%").text("side");

                            line.append(startPiece);
                            var colorChanger = 1;

                            while (blocks > 0) {

                                while (big_count > 0) {
                                    if (colorChanger % 2 > 0) {
                                        row = $("<div></div>").addClass("progress-bar").css("width", big_size + "%").text("2x4");
                                    } else {
                                        row = $("<div></div>").addClass("progress-bar bg-success").css("width", big_size + "%").text("2x4");
                                    }

                                    colorChanger++;
                                    big_count--;
                                    blocks -= 4;
                                    line.append(row);
                                }

                                while (medium_count > 0) {
                                    if (colorChanger % 2 > 0) {
                                        row = $("<div></div>").addClass("progress-bar bg-info").css("width", medium_size + "%").text("2x2");
                                    } else {
                                        row = $("<div></div>").addClass("progress-bar bg-warning").css("width", medium_size + "%").text("2x2");
                                    }

                                    colorChanger++;
                                    medium_count--;
                                    blocks -= 2;
                                    line.append(row);
                                }

                                while (small_count > 0) {
                                    if (colorChanger % 2 > 0) {
                                        row = $("<div></div>").addClass("progress-bar bg-danger").css("width", small_size + "%").text("2x1");
                                    } else {
                                        row = $("<div></div>").addClass("progress-bar bg-dark").css("width", small_size + "%").text("2x1");
                                    }

                                    colorChanger++;
                                    small_count--;
                                    blocks -= 1;
                                    line.append(row);
                                }

                            }

                            line.append(endPiece);
                            build.prepend(line);

                            console.log("big_len: " + big_len + " medium_len: " + medium_len + " small_len: " + small_len);
                            console.log("big_wid: " + big_wid + " medium_wid: " + medium_wid + " small_wid: " + small_wid);
                        }


                    }
                }
            </script>

        </div>
    </body>
</html>
