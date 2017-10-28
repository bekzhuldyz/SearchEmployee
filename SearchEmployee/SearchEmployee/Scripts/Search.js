$(document).ready(function () {
    if($("#City").val() == "")
        $("#divCities").hide();

    $("#Country").change(function () {
        $("#City").empty();
        if ($("#Country option:selected").text() != "Select Country") {
            debugger;
            //var url = '@Url.Action("getCitiesByID", "Home")';
            var url = "Home/getCitiesByID"
            var data = { countryCode: $("#Country option:selected").val() }
            $.ajax({
                type: "POST",
                ContentType: 'application/json',
                url: url,
                data: data,
                success: function (data) {
                    $("#divCities").show();
                    $("#City").append($('<option></option>').val("").html("Select City"))
                    $.each($.parseJSON(data), function (i, city) {
                        $("#City").append
                            ($('<option></option>').val(city.Code).html(city.Name))
                    })
                },
                error: function (XMLHttpRequest, textStatus, errorThrown) {
                    debugger;
                    alert(XMLHttpRequest.responseText);
                }

            });

            //debugger;
            $("#PhoneNumber").empty();
            switch ($("#Country option:selected").val()) {
                case "1":
                    $("#PhoneNumber").mask("+7(999) 999-99-99", { placeholder: "+7(***) ***-**-**" });
                    break;
                case "2":
                    $("#PhoneNumber").mask("+7(999) 999-99-99", { placeholder: "+7(***) ***-**-**" });
                    break;
                case "3":
                    $("#PhoneNumber").mask("+1(999) 999-99-99", { placeholder: "+1(***) ***-**-**" });
                    break;
                case "4":
                    $("#PhoneNumber").mask("+34(99) 999-99-99", { placeholder: "+34(**) ***-**-**" });
                    break;
                case "5":
                    $("#PhoneNumber").mask("+33(999) 999-99-99", { placeholder: "+33(***) ***-**-**" });
                    break;
            }

        }
        else {
            $("#divCities").hide();
            alert("Select Country, please!");
            return;
        }
    });

    $("#City").change(function () {
        if ($("#City option:selected").text() == "Select City")
            alert("Select City, please!");
    });
});