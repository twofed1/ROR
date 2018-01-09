jQuery(function ($) {
    $("#search").on('input', function() {
        var search_val = $("#search").val().toLowerCase();
        $( ".worker" ).each(function() {
            var my_string = $(this).find("h3").html().toLowerCase();
            var n = my_string.search(search_val);
            if(search_val !== ""){
                if (n === -1) {
                    $(this).css("display", "none");
                }
            } else {
                $(this).css("display", "block");
            }
        });
    });

    $("#add_new_worker").click(function(){
        $.ajax({
            type: 'POST',
            url: '/worker/ajax/',
            data: {type: "add", fio: $("#fio").val(), email: $("#email").val(), phone: $("#phone").val(), info: $("#info").val(), city: $("#city").val(), image: $("#image").val() },
            success: function (data) {
                $(".workers").append("<div class=\"worker\">\n" +
                    "          <div class=\"row\">\n" +
                    "            <div class=\"col-sm-6\">\n" +
                    "              <img>\n" +
                    "            </div>\n" +
                    "            <div class=\"col-sm-6\">\n" +
                    "              <h3>" + data.fio + "</h3>\n" +
                    "              <small>" + data.email + "</small>\n" +
                    "              <small>" + data.phone + "</small>\n" +
                    "              <small>" + data.city + "</small>\n" +
                    "            </div>\n" +
                    "          </div>\n" +
                    "        </div>");
            },
            error: function (data) {
                console.log('An error occurred.');
                console.log(data);
            },
        });
    });

    $(".change_user").click(function(){
        var curr_id = $(this).attr("user_id");
        $("#fio").val($("#worker_" + curr_id + "_fio").text());
        $("#email").val($("#worker_" + curr_id + "_email").text());
        $("#phone").val($("#worker_" + curr_id + "_phone").text());
        $("#city").val($("#worker_" + curr_id + "_city").text());
        $("#image").val($("#worker_" + curr_id + "_image").attr("file_name"));
        $("#info").val($("#worker_" + curr_id + "_info").text());
        $("#add_new_worker").toggle();
        $("#edit_worker").toggle();

        $("#user_id").val(curr_id);
        return false;
    });

    $("#edit_worker").click(function(){
        $.ajax({
            type: 'POST',
            url: '/worker/ajax/',
            data: {type: "edit", fio: $("#fio").val(), email: $("#email").val(), phone: $("#phone").val(), info: $("#info").val(), city: $("#city").val(), image: $("#image").val(), id: $("#user_id").val() },
            success: function (data) {
                $("#worker_" + data.id + "_fio").text(data.fio);
                $("#worker_" + data.id + "_email").text(data.email);
                $("#worker_" + data.id + "_phone").text(data.phone);
                $("#worker_" + data.id + "_city").text(data.city);
                $("#worker_" + data.id + "_info").text(data.info);
            },
            error: function (data) {
                console.log('An error occurred.');
                console.log(data);
            },
        });
    });
});
