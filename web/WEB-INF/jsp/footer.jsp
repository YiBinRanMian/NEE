<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <!-- Copyright info -->
                <p class="copy">Copyright &copy; 2012 | <a href="#">Your Site</a> </p>
            </div>
        </div>
    </div>
</footer>

<!-- Footer ends -->

<!-- Scroll to top -->
<span class="totop"><a href="#"><i class="icon-chevron-up"></i></a></span>

<!-- JS -->
<script src="../../static/js/jquery.js"></script> <!-- jQuery -->
<script src="../../static/js/bootstrap.js"></script> <!-- Bootstrap -->
<script src="../../static/js/jquery-ui-1.9.2.custom.min.js"></script> <!-- jQuery UI -->
<script src="static/fullcalendar.min.js"></script> <!-- Full Google Calendar - Calendar -->
<script src="../../static/js/jquery.rateit.min.js"></script> <!-- RateIt - Star rating -->
<script src="../../static/js/jquery.prettyPhoto.js"></script> <!-- prettyPhoto -->

<!-- jQuery Flot -->
<script src="../../static/js/excanvas.min.js"></script>
<script src="../../static/js/jquery.flot.js"></script>
<script src="../../static/js/jquery.flot.resize.js"></script>
<script src="../../static/js/jquery.flot.pie.js"></script>
<script src="../../static/js/jquery.flot.stack.js"></script>

<!-- jQuery Notification - Noty -->
<script src="../../static/js/jquery.noty.js"></script> <!-- jQuery Notify -->
<script src="../../static/js/themes/default.js"></script> <!-- jQuery Notify -->
<script src="../../static/js/layouts/bottom.js"></script> <!-- jQuery Notify -->
<script src="../../static/js/layouts/topRight.js"></script> <!-- jQuery Notify -->
<script src="../../static/js/layouts/top.js"></script> <!-- jQuery Notify -->
<!-- jQuery Notification ends -->

<script src="../../static/js/sparklines.js"></script> <!-- Sparklines -->
<script src="../../static/js/jquery.cleditor.min.js"></script> <!-- CLEditor -->
<script src="../../static/js/bootstrap-datetimepicker.min.js"></script> <!-- Date picker -->
<script src="../../static/js/jquery.uniform.min.js"></script> <!-- jQuery Uniform -->
<script src="../../static/js/bootstrap-switch.min.js"></script> <!-- Bootstrap Toggle -->
<script src="../../static/js/filter.js"></script> <!-- Filter for support page -->
<script src="../../static/js/custom.js"></script> <!-- Custom codes -->
<script src="../../static/js/charts.js"></script> <!-- Charts & Graphs -->

<!-- Script for this page -->
<script type="text/javascript">
    $(function () {

        /* Bar Chart starts */

        var d1 = [];
        for (var i = 0; i <= 20; i += 1)
            d1.push([i, parseInt(Math.random() * 30)]);

        var d2 = [];
        for (var i = 0; i <= 20; i += 1)
            d2.push([i, parseInt(Math.random() * 30)]);


        var stack = 0, bars = true, lines = false, steps = false;

        function plotWithOptions() {
            $.plot($("#bar-chart"), [ d1, d2 ], {
                series: {
                    stack: stack,
                    lines: { show: lines, fill: true, steps: steps },
                    bars: { show: bars, barWidth: 0.8 }
                },
                grid: {
                    borderWidth: 0, hoverable: true, color: "#777"
                },
                colors: ["#ff6c24", "#ff2424"],
                bars: {
                    show: true,
                    lineWidth: 0,
                    fill: true,
                    fillColor: { colors: [ { opacity: 0.9 }, { opacity: 0.8 } ] }
                }
            });
        }

        plotWithOptions();

        $(".stackControls input").click(function (e) {
            e.preventDefault();
            stack = $(this).val() == "With stacking" ? true : null;
            plotWithOptions();
        });
        $(".graphControls input").click(function (e) {
            e.preventDefault();
            bars = $(this).val().indexOf("Bars") != -1;
            lines = $(this).val().indexOf("Lines") != -1;
            steps = $(this).val().indexOf("steps") != -1;
            plotWithOptions();
        });

        /* Bar chart ends */

    });


    /* Curve chart starts */

    $(function () {
        var sin = [], cos = [];
        for (var i = 0; i < 14; i += 0.5) {
            sin.push([i, Math.sin(i)]);
            cos.push([i, Math.cos(i)]);
        }

        var plot = $.plot($("#curve-chart"),
            [ { data: sin, label: "sin(x)"}, { data: cos, label: "cos(x)" } ], {
                series: {
                    lines: { show: true, fill: true},
                    points: { show: true }
                },
                grid: { hoverable: true, clickable: true, borderWidth:0 },
                yaxis: { min: -1.2, max: 1.2 },
                colors: ["#1eafed", "#1eafed"]
            });

        function showTooltip(x, y, contents) {
            $('<div id="tooltip">' + contents + '</div>').css( {
                position: 'absolute',
                display: 'none',
                top: y + 5,
                left: x + 5,
                border: '1px solid #000',
                padding: '2px 8px',
                color: '#ccc',
                'background-color': '#000',
                opacity: 0.9
            }).appendTo("body").fadeIn(200);
        }

        var previousPoint = null;
        $("#curve-chart").bind("plothover", function (event, pos, item) {
            $("#x").text(pos.x.toFixed(2));
            $("#y").text(pos.y.toFixed(2));

            if ($("#enableTooltip:checked").length > 0) {
                if (item) {
                    if (previousPoint != item.dataIndex) {
                        previousPoint = item.dataIndex;

                        $("#tooltip").remove();
                        var x = item.datapoint[0].toFixed(2),
                            y = item.datapoint[1].toFixed(2);

                        showTooltip(item.pageX, item.pageY,
                            item.series.label + " of " + x + " = " + y);
                    }
                }
                else {
                    $("#tooltip").remove();
                    previousPoint = null;
                }
            }
        });

        $("#curve-chart").bind("plotclick", function (event, pos, item) {
            if (item) {
                $("#clickdata").text("You clicked point " + item.dataIndex + " in " + item.series.label + ".");
                plot.highlight(item.series, item.datapoint);
            }
        });

    });

    /* Curve chart ends */
</script>
