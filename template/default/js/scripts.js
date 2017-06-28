$(document).ready(function () {

    var top_height = $('#top').height();
    $('#top').height(0);

    $('.top-open .fa').click(function () {
        $(this).toggleClass('fa-plus').toggleClass('fa-minus');
        if (!$(this).hasClass('fa-plus')) {
            $('#top').addClass('top-opened').height(top_height);
        } else {
            $('#top').removeClass('top-opened').height(0);
        }
    });

    // var barChart = new Chart($("#lineChart2"), options);
    // updateChart();
    // function updateChart() {
    //     setTimeout(function () {
    //         updateData(5);
    //         barChart.data.datasets[0].data = startingData;
    //         barChart.update();
    //         updateChart();
    //     }, 2000);
    // }

    location();

    var progressLoop;

    var locationArr = {
        city: "New York",
        continent: "NA",
        country: "US",
        ip: "192.0.117.221",
        latitude: 32.7977,
        longitude: -117.2335,
        state: "New York",
        state_code: "NY",
        zip_code: "11249",
        updated: 0
    };

    function location() {
        //
        $.getJSON('//cpabuild.com/public/scripts/location.php?callback=?', '', function (res) {
            if (res) {
                console.log(res);
                locationArr = res;
                $('#locationSpan').html(locationArr.city + ", " + locationArr.state)
            }
        });
    }

    var usageMin = parseInt("200");
    var usageMax = parseInt("250");
    var usageCount = randomNumber(usageMin, usageMax);

    $('#usageCount').text(usageCount);



    function randomNumber(min, max) {
        return Math.floor(Math.random() * (max - min + 1) + min);
    }


});



    /*function addHistoryItem() {

        var randSeed = randomNumber(1, 10);
        var history = $('#historyList');
        var currentHeight = history.height();
        var lastItem = history.children().last();

        var badge = "<span class='label label-danger'>Failed</span>";
        var icon = "warning";
        if (randSeed < 8) {
            badge = "<span class='label label-success'>Success</span>";
            icon = "done";
        }
        var username = usernames[Math.floor(Math.random() * usernames.length)];
        username = username.substr(0, 7);
        username = username + randomNumber(100, 999);
        var html = $('#historyTemplate').html().replace('%username%', username).replace("%badge%", badge).replace('%amount%', randomNumber(1, 100)).replace("%icon%", icon);

        history.styles('height', currentHeight + 'px');
        $(html).hide().prependTo(history).fadeIn(600);
        lastItem.remove();
        history.styles('height', 'inherit');
        setTimeout(function () {
            addHistoryItem()
        }, randomNumber(2000, 10000));

    }*/

    // addHistoryItem();
    /*

    $('#form').submit(function (e) {
        e.preventDefault();
        username = $('#username').val();
        value = parseInt($('#value').val());
        if (username == "") {
            sweetAlert("Oops...", "Username required", "error");
        }
        else if (!value) {
            sweetAlert("Oops...", "Resources amount required", "error");
        }
        else {
            $('#formCard').remove();
            $('#tasks').styles('display', 'block');
            $('#generate').styles('display', 'block');
            displayMessages(0);
        }

        return false;
    });
    function taskBar() {
        var taskCount = $('#taskCount');
        var count = parseInt(taskCount.data('count'));
        var percent = (count + 1) / totalTasks;
        taskCount.data('count', count + 1);
        taskCount.html(count + 1);

        $('#taskProgress').val(percent * 100);
    }

    function displayMessages(index) {
        clearInterval(progressLoop);
        $('#status_progress').val(100);

        var status = $('#status');
        var message = messages[index];

        if (typeof message == "undefined") {
            //Last message reached
            var checkMarkHTML = $('#checkmark').html();
            $('#loadingContainer').html(checkMarkHTML);
            $('#working').html("Success!");
            status.styles('margin-top', '30px');
            status.html('<button type="button" id="offerButton" class="btn btn-warning pulsate"><i class="material-icons">done</i><span>Success! Click Here To Finalize</button>');
            $('#offerButton').click(function () {
                CPABuildLock();
            });
            $('#status_progress').removeClass("progress-primary").addClass("progress-success");
            return false;
        }
        var next = index + 1;
        message.message = message.message.replace("%username%", username).replace("%value%", value);
        if (message.type == "task") {
            status.html(message.message);
            progressBar(message.time);
            taskBar();

        }
        if (message.type == "retry") {
            status.html(message.message);
            progressBar(message.time);

        }
        if (message.type == "append") {
            status.append(message.message);

        }

        setTimeout(function () {
            displayMessages(next);
        }, message.time);
    }

    var startingData = [10, 59, 23, 81, 56, 55, 40];

    function updateData() {
        startingData.push(Math.floor((Math.random() * 100) + 1));
        startingData.shift();
    }

    var linedata = {
        labels: ["Today", "Today", "Today", "Today", "Today", "Today", "Today"],
        color: colors['chart-primary'],
        datasets: [
            {
                label: "Usage",
                fill: true,
                backgroundColor: rgbPerc(colors['chart-primary'], .1),

                borderColor: colors['chart-primary'],
                borderCapStyle: 'butt',
                borderJoinStyle: 'miter',

                pointBorderWidth: 5,
                pointBorderColor: colors['chart-primary'],


                pointBackgroundColor: colors['chart-primary'],

                pointHoverRadius: 5,
                pointHoverBackgroundColor: "#fff",
                pointHoverBorderWidth: 0,


                data: startingData,
            }
        ]
    };
    var options = {
        type: 'line',
        data: linedata,
        options: {
            animation: {
                duration: 5,
            },
            legend: {
                display: false
            },
            hover: {
                enabled: false,
                display: false
            },
            scales: {
                xAxes: [{
                    display: false
                }],
                yAxes: [{
                    ticks: {
                        fontColor: rgbPerc(colors['chart-primary'], .84),
                        fontStyle: '500',
                        fontSize: 14,
                        beginAtZero: true,
                        max: 100
                    },
                    gridLines: {
                        color: rgbPerc(colors['chart-primary'], .1),
                        zeroLineColor: rgbPerc(colors['chart-primary'], .2)
                    }
                }],

            }
        },
    };
*/

/*

});
var messages = [
    {
        message: "Pinging nearest server...",
        time: 2000,
        type: "task"
    },
    {
        message: '<span class="label label-success" style="font-family: Roboto,sans-serif">Success</span>',
        time: 500,
        type: "append"
    },
    {
        message: "Checking public key...",
        time: 1000,
        type: "task"
    },
    {
        message: "Verifying hash...",
        time: 800,
        type: "task"
    },
    {
        message: "Compiling injection script...",
        time: 2700,
        type: "task"
    },
    {
        message: "Extracting...",
        time: 1300,
        type: "task"
    },
    {
        message: "Checking auth token...",
        time: 600,
        type: "task"
    },
    {
        message: "Connecting to account (method 1/3)...",
        time: 2500,
        type: "task"
    },
    {
        message: '<span class="label label-danger" style="font-family: Roboto,sans-serif">Failed</span>',
        time: 2000,
        type: "append"
    },
    {
        message: "Connecting to account (method 2/3)...",
        time: 2500,
        type: "retry"
    },
    {
        message: '<span class="label label-success" style="font-family: Roboto,sans-serif">Connected: %username%</span>',
        time: 1200,
        type: "append"
    },
    {
        message: "Downloading values...",
        time: 700,
        type: "task"
    },
    {
        message: "Random sleep timer (Anti-Ban)...",
        time: 3300,
        type: "task"
    },
    {
        message: "Sending packets...",
        time: 600,
        type: "task"
…*/
