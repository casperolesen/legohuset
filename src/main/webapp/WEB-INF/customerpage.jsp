<%-- 
    Document   : customerpage
    Created on : 17-Mar-2019, 15:28:11
    Author     : Casper
--%>

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

                <h1>Hello <%=request.getParameter("email")%> </h1>
            You are now logged in as a customer of our wonderful site.

            <form method="POST" action="FrontController" class="form-inline mb-2">
                <input type="hidden" name="command" value="buy">
                <input type="text" class="form-control mr-sm-2" name="length" id="lengthInput" placeholder="Længde">
                <input type="text" class="form-control mr-sm-2" name="width" id="widthInput" placeholder="Bredde">
                <input type="text" class="form-control mr-sm-2" name="height" id="heightInput" placeholder="Højde">
                <input type="submit" value="Bestil">
            </form>

            <button type="button" class="btn btn-primary btn-sm mr-sm-2" id="previewBtn">Vis</button><span id="error"></span>
            <div id="demo"></div>

            <table class="table" id="sidesTable">
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

                $(document).ready(function () {
                    $("#sidesTable").hide();

                    $("#previewBtn").click(function () {
                        var div, l, w, h, pl, pw, ph;
                        var total, rest;
                        var big_l, medium_l, small_l;
                        var big_w, medium_w, small_w;

                        var err = $("#error");

                        $("#sidesTable").hide();
                        err.empty();
                        div = $("#demo");
                        div.empty();

                        l = $("#lengthInput").val();
                        w = $("#widthInput").val();
                        h = $("#heightInput").val();

                        if (l.length < 1) {
                            err.text("Udfyld venligst længde..");
                            return;
                        }

                        if (w.length < 1) {
                            err.text("Udfyld venligst bredde..");
                            return;
                        }

                        if (h.length < 1) {
                            err.text("Udfyld venligst højde..");
                            return;
                        }

                        // length
                        pl = $("<p></p>").text("length: " + l);

                        total = l;

                        if (total < 4) {
                            big_l = 0;
                            rest = total;
                        } else {
                            big_l = (total - (total % 4)) / 4;
                            rest = total % 4;
                        }

                        if (rest < 2) {
                            medium_l = 0;
                            small_l = rest;
                        } else {
                            medium_l = (rest - (rest % 2)) / 2;
                            rest = rest % 2;
                            small_l = rest;
                        }

                        pl.append(" Store: " + big_l);
                        pl.append(" Mellem: " + medium_l);
                        pl.append(" Små: " + small_l);


                        // width
                        pw = $("<p></p>").text("width: " + w);

                        if (w == 4) {
                            big_w = 0;
                            medium_w = 0;
                            small_w = 0;
                        } else {
                            total = w - 4;

                            if (total < 4) {
                                big_w = 0;
                                rest = total;
                            } else {
                                big_w = (total - (total % 4)) / 4;
                                rest = total % 4;
                            }

                            if (rest < 2) {
                                medium_w = 0;
                                small_w = rest;
                            } else {
                                medium_w = (rest - (rest % 2)) / 2;
                                rest = rest % 2;
                                small_w = rest;
                            }
                        }



                        pw.append(" Store: " + big_w);
                        pw.append(" Mellem: " + medium_w);
                        pw.append(" Små: " + small_w);

                        ph = $("<p></p>").text("height: " + h);
                        div.append(pl, pw, ph);

                        $("#sidesTable").show();
                        var tbody = $("#tbody-demo");
                        tbody.empty();
                        var row = $("<tr></tr>");

                        // 2x4
                        var td_type = $("<td></td").text("2x4");
                        var td_s1 = $("<td></td").text(big_l);
                        var td_s2 = $("<td></td").text(big_w);
                        var td_s3 = $("<td></td").text(big_l);
                        var td_s4 = $("<td></td").text(big_w);
                        var td_total = $("<td></td").text((big_l * 2) + (big_w * 2));
                        var td_totalTimesHeight = $("<td></td").text(((big_l * 2) + (big_w * 2)) * h);
                        row.append(td_type, td_s1, td_s2, td_s3, td_s4, td_total, td_totalTimesHeight);
                        tbody.append(row);

                        // 2x2
                        row = $("<tr></tr>");
                        td_type = $("<td></td").text("2x2");
                        td_s1 = $("<td></td").text(medium_l);
                        td_s2 = $("<td></td").text(medium_w);
                        td_s3 = $("<td></td").text(medium_l);
                        td_s4 = $("<td></td").text(medium_w);
                        td_total = $("<td></td").text((medium_l * 2) + (medium_w * 2));
                        td_totalTimesHeight = $("<td></td").text(((medium_l * 2) + (medium_w * 2)) * h);
                        row.append(td_type, td_s1, td_s2, td_s3, td_s4, td_total, td_totalTimesHeight);
                        tbody.append(row);

                        // 2x1
                        row = $("<tr></tr>");
                        td_type = $("<td></td").text("2x1");
                        td_s1 = $("<td></td").text(small_l);
                        td_s2 = $("<td></td").text(small_w);
                        td_s3 = $("<td></td").text(small_l);
                        td_s4 = $("<td></td").text(small_w);
                        td_total = $("<td></td").text((small_l * 2) + (small_w * 2));
                        td_totalTimesHeight = $("<td></td").text(((small_l * 2) + (small_w * 2)) * h);
                        row.append(td_type, td_s1, td_s2, td_s3, td_s4, td_total, td_totalTimesHeight);
                        tbody.append(row);

                    });
                });

            </script>
        </div>
    </body>
</html>
