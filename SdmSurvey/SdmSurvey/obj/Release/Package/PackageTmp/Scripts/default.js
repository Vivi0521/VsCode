function myformatter(date) {
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    var d = date.getDate();
    return y + '/' + (m < 10 ? ('0' + m) : m) + '/' + (d < 10 ? ('0' + d) : d);
}


function getParameterByName(name, url) {
    if (!url) url = window.location.href;
    name = name.replace(/[\[\]]/g, '\\$&');
    var regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, ' '));
}

function myparser(s) {
    if (!s) return new Date();
    var ss = (s.split('/'));
    var y = parseInt(ss[0], 10);
    var m = parseInt(ss[1], 10);
    var d = parseInt(ss[2], 10);
    if (!isNaN(y) && !isNaN(m) && !isNaN(d)) {
        return new Date(y, m - 1, d);
    } else {
        return new Date();
    }
}
/*
$(function () {

    var mydate = new Date();
    mydate.setDate(mydate.getDate() - 3);
    $('#txtStartDate').datebox({ editable: false, formatter: myformatter, parser: myparser });
    $('#txtStartDate').datebox('setValue', myformatter(mydate));
    $('#txtEndDate').datebox({ editable: false, formatter: myformatter, parser: myparser });
    $('#txtEndDate').datebox('setValue', myformatter(new Date()));
    $('#cbLine').combobox({ editable: false });
    $('#cbType').combobox({ editable: false });
    $('#processing').window({ modal: true, closed: true, border: 'thin', inline: false, collapsible: false, minimizable: false, maximizable: false, closable: false, title: '', resizable: false });

    var options = {
        chart: {
            type: 'line',
            borderWidth: 1
        },
        title: {
            x: -20 // center
        },
        subtitle: {
            text: '',
            x: -20
        },
        xAxis: {
            categories: [],
            labels: {
                style: {
                    fontSize: '15px'
                }
            }
        },
        yAxis: {
            title: {
                text: 'ms/cm'
            }
        },
        series: []
    };

    $('#btnSearch').click(function (e) {

        e.preventDefault();

        printChart();

    });

    function printChart() {

        var line = $('#cbLine').combobox('getValue');
        var type = $('#cbType').combobox('getValue');

        $.ajax({
            url: 'DefaultHandler.ashx?action=GetChart',
            data: { line: line, type: type },
            type: 'get',
            cache: false,
            async: true,
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            beforeSend: function () {

                $('#processing').window('open');

                if ($('#container').length) {
                    $('#container').remove();
                }
            },
            complete: function () {

                $('#processing').window('close');
            },
            error: function (xhr, status, error) {

                $('#processing').window('close');
            },
            success: function (result) {

                var jsonData = JSON.stringify(result);
                var jsonObj = JSON.parse(jsonData);

                getDiv(jsonObj);

                getData(jsonObj);

            }
        });
    }

    function getDiv(jsonObj) {

        var div = document.createElement('div');
        div.setAttribute("id", "container");
        document.body.appendChild(div);

        $.each(jsonObj, function (idx, obj) {

            $('#container').append('<div id="chart' + obj.colIndex + '" style="height: auto; min-width: 400px ;"></div><div style="margin: 10px 0;"></div>');

        });
    }

    function getData(jsonObj) {

        var start_date = $('#txtStartDate').datebox('getValue');
        var end_date = $('#txtEndDate').datebox('getValue');
        var line = $('#cbLine').combobox('getValue');
        var type = $('#cbType').combobox('getValue');
        var text = "";
        switch (parseInt(type)) {
            case 1:
                text = "ms/cm";
                break;
            case 2:
                text = "mA";
                break;
        }

        $.each(jsonObj, function (idx, obj) {

            $.ajax({
                url: 'DefaultHandler.ashx?action=GetData',
                data: {
                    start_date: start_date,
                    end_date: end_date,
                    line: line,
                    type: type,
                    text: text,
                    col_index: obj.colIndex,
                    col_name: obj.colName
                },
                type: 'get',
                cache: false,
                async: false,
                contentType: 'application/json; charset=utf-8',
                dataType: 'json',
                success: function (result) {

                    var jsonData = JSON.stringify(result);
                    var jsonObj = JSON.parse(jsonData);

                    getChart(jsonObj, obj.colIndex);

                },
                error: function (xhr, ajaxOptions, thrownError) {

                }
            });
        });
    }

    function getChart(jsonObj, colIndex)
    {
        if (jsonObj.xAxis) {

            options.chart.renderTo = 'chart' + colIndex;
            options.title.text = jsonObj.title;
            options.xAxis.categories = jsonObj.xAxis;
            options.yAxis.title.text = jsonObj.text;
            options.series = jsonObj.series;

            chart = new Highcharts.Chart(options);
        }
    }

});

*/