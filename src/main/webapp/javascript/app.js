function validateLegoInput() {
    var len = $("#lengthInput").val();
    var wid = $("#widthInput").val();
    var h = $("#heightInput").val();
    var door = $("#doorInput").is(":checked");
    var window = $("#windowInput").is(":checked");

    var err = $("#error");

    if (len.length < 1) {
        err.text("Udfyld venligst længde");
        return false;
    } else if (wid.length < 1) {
        err.text("Udfyld venligst bredde..");
        return false;
    } else if (h.length < 1) {
        err.text("Udfyld venligst højde..");
        return false;
    } else if ((len < 12 || wid < 12 || h < 8) && (door || window)) {
        err.text("Du skal bruge et større hus.. Mindst 12x12x8, hvis du vil have dør og/eller vindue");
        return false;
    } else {
        return true;
    }
}

function previewLegoHouseTable(length, width, height) {
    var len = length, wid = width-4, hei = height;

    var tbody = $("#tbody-demo");
    tbody.empty();
    var row = $("<tr></tr>");

    var big_len = (len - (len % 4)) / 4;
    var big_wid = (wid - (wid % 4)) / 4;

    var medium_len = ((len % 4) - ((len % 4) % 2)) / 2;
    var medium_wid = ((wid % 4) - ((wid % 4) % 2)) / 2;

    var small_len = len - ((big_len * 4) + (medium_len * 2));
    var small_wid = wid - ((big_wid * 4) + (medium_wid * 2));

    // 2x4
    var td_type = $("<td></td").text("2x4");
    var td_s1 = $("<td></td").text(big_len);
    var td_s2 = $("<td></td").text(big_wid);
    var td_s3 = $("<td></td").text(big_len);
    var td_s4 = $("<td></td").text(big_wid);
    var td_total = $("<td></td").text((big_len * 2) + (big_wid * 2));
    var td_totalTimesHeight = $("<td></td").text(((big_len * 2) + (big_wid * 2)) * hei);
    row.append(td_type, td_s1, td_s2, td_s3, td_s4, td_total, td_totalTimesHeight);
    tbody.append(row);

    // 2x2
    row = $("<tr></tr>");
    td_type = $("<td></td").text("2x2");
    td_s1 = $("<td></td").text(medium_len);
    td_s2 = $("<td></td").text(medium_wid);
    td_s3 = $("<td></td").text(medium_len);
    td_s4 = $("<td></td").text(medium_wid);
    td_total = $("<td></td").text((medium_len * 2) + (medium_wid * 2));
    td_totalTimesHeight = $("<td></td").text(((medium_len * 2) + (medium_wid * 2)) * hei);
    row.append(td_type, td_s1, td_s2, td_s3, td_s4, td_total, td_totalTimesHeight);
    tbody.append(row);

    // 2x1
    row = $("<tr></tr>");
    td_type = $("<td></td").text("2x1");
    td_s1 = $("<td></td").text(small_len);
    td_s2 = $("<td></td").text(small_wid);
    td_s3 = $("<td></td").text(small_len);
    td_s4 = $("<td></td").text(small_wid);
    td_total = $("<td></td").text((small_len * 2) + (small_wid * 2));
    td_totalTimesHeight = $("<td></td").text(((small_len * 2) + (small_wid * 2)) * hei);
    row.append(td_type, td_s1, td_s2, td_s3, td_s4, td_total, td_totalTimesHeight);
    tbody.append(row);
    
    $("#sidesTable").show();

}


