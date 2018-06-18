var barChartData = {
    labels: ['2015', '2016', '2017'],
    datasets: [{
        label: 'Youth Unemployment',
        backgroundColor: window.chartColors.blue,
        data: [
            11,
            25,
            33
        ]
    }, {
        label: 'Unemployment',
        backgroundColor: window.chartColors.purple,
        data: [
            8,
            11,
            18
        ]
        
    }]
};
window.onload = function () {
    var ctx = document.getElementById('canvas').getContext('2d');
    window.myBar = new Chart(ctx, {
        type: 'bar',
        data: barChartData,
        options: {
            title: {
                display: true,
            },
            tooltips: {
                mode: 'index',
                intersect: false
            },
            responsive: true,
            scales: {
                xAxes: [{
                    stacked: true,
                    barThickness: 50
                }],
                yAxes: [{
                    stacked: true,
                }]
            }
        }
    });
};
document.getElementById('randomizeData').addEventListener('click', function () {
    barChartData.datasets.forEach(function (dataset) {
        dataset.data = dataset.data.map(function () {
            console.log(randomScalingFactor());
            return randomScalingFactor();
        });
    });
    window.myBar.update();
});