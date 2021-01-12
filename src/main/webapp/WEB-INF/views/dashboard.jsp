<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>DataTables</title>
    <script src="/echarts-4.2.1/dist/echarts.js"></script>
    <script src="/js/jquery-1.9.1.min.js"></script>
    <jsp:include page="/common/backend_common.jsp"/>
    <jsp:include page="/common/page.jsp"/>

    <style type="text/css">
        .TelVisitInfoByToday {
            margin-top: 20px;
            margin-left: 10px;
            float: left;
            width: 49%;
            border: 2px solid #66ac52
        }

        .TelVisitInfoByMonth {
            margin-top: 20px;
            margin-left: 10px;
            float: left;
            width: 49%;
            border: 2px solid #AFD8F8
        }

        .VisitInfoByToday {
            margin-top: 20px;
            margin-left: 10px;
            float: left;
            width: 49%;
            border: 2px solid #ABBAC3
        }

        .VisitInfoByMonth {
            margin-top: 20px;
            margin-left: 10px;
            float: left;
            width: 49%;
            border: 2px solid #438EB9
        }

        .countSuccessfulCus {
            margin-top: 20px;
            margin-left: 7px;
            float: left;
            width: 49%;
            border: 2px solid #07C289;
        }

        .countTenByUser {
            margin-top: 20px;
            margin-left: 7px;
            float: left;
            width: 49%;
            border: 2px solid #AFCA01;
        }

        .alert {
            margin-top: 10px;
            font-weight: bolder;
        }

        .deptAlert {
            color: #2679B5;
            margin-left: 15px;
            font-weight: bolder;
        }

        body {
            background: #ffffff
        }

    </style>

</head>
<body>
<div class="alert alert-info" style="font-size: 20px;text-align:center;">
    专&nbsp;&nbsp;业&nbsp;&nbsp;服&nbsp;&nbsp;务&nbsp;,&nbsp;&nbsp;&nbsp;&nbsp;卓&nbsp;&nbsp;越&nbsp;&nbsp;执&nbsp;&nbsp;行！
</div>
<div class="deptAlert" style="font-size: 30px;">
    所有部门业绩展示
</div>
<div id="countVisitInfoByToday" style="width:400px; height:300px;" class="VisitInfoByToday"></div>
<div id="countVisitInfoByMonth" style="width:400px; height:300px;" class="VisitInfoByMonth"></div>
<div id="countTelVisitInfoByToday" style="width:400px; height:300px;" class="TelVisitInfoByToday"></div>
<div id="countTelVisitInfoByMonth" style="width:400px; height:300px;" class="TelVisitInfoByMonth"></div>
<div id="countSuccessfulCus" style="width:1040px; height:400px;" class="countSuccessfulCus"></div>
<div id="countTenByUser" style="width:586px; height:400px;" class="countTenByUser"></div>
<script type="text/javascript">
    /*当日来访统计*/
    function countVisitInfoByToday() {
        var myChart = echarts.init(document.getElementById('countVisitInfoByToday'));
        myChart.setOption({
            title: {
                text: '日来访统计'
            },
            tooltip: {},
            legend: {
                data: ['日来访排行']
            },
            xAxis: {
                data: []
            },
            yAxis: {
                splitLine: {show: false},
                name: ''
            },
            series: [{
                barWidth: "30px",
                name: '日来访排行',
                type: 'bar',
                markLine: {
                    symbol: 'none',
                    itemStyle: {
                        normal: {
                            color: '#333',
                            label: {
                                show: true
                            }
                        }
                    },
                    data: [
                        {
                            name: '平均线',
                            type: 'average'
                        }
                    ]
                },
                itemStyle: {
                    normal: {
                        color: function (params) {
                            var colorList = ['#438EB9', '#EDDA59', '#66ac52', '#ffc032', '#549bd3', '#f47e39'];
                            return colorList[params.dataIndex];
                        },

                        label: {
                            show: true,
                            position: 'top',
                            textStyle: {
                                color: '#333'
                            }
                        }
                    }
                },
                data: []
            }]
        });
        myChart.showLoading();
        var names = [];
        var nums = [];
        $.ajax({
            type: 'post',
            url: '/user/form/countVisitInfoByToday.json',
            dataType: "json",
            success: function (result) {
                $.each(result.data, function (index, item) {
                    names.push(item.name);
                    nums.push(item.cou);
                });
                myChart.hideLoading();
                myChart.setOption({
                    xAxis: {
                        data: names
                    },
                    series: [{
                        name: '日来访排行',
                        data: nums
                    }]
                });
            },
            error: function (errorMsg) {
                alert("图表请求数据失败!");
                myChart.hideLoading();
            }
        });
    }

    /*当月来访统计*/
    function countVisitInfoByMonth() {
        var myChart = echarts.init(document.getElementById('countVisitInfoByMonth'));
        myChart.setOption({
            title: {
                text: '本月来访统计'
            },
            tooltip: {},
            legend: {
                data: ['本月来访排行']
            },
            xAxis: {
                data: []
            },
            yAxis: {
                splitLine: {show: false},
                name: ''
            },
            series: [{
                barWidth: "30px",
                name: '本月来访排行',
                type: 'bar',
                markLine: {
                    symbol: 'none',
                    itemStyle: {
                        normal: {
                            color: '#333',
                            label: {
                                show: true
                            }
                        }
                    },
                    data: [
                        {
                            name: '平均线',
                            type: 'average'
                        }
                    ]
                },
                itemStyle: {
                    normal: {
                        color: function (params) {
                            var colorList = ['#66ac52', '#EDDA59', '#438EB9', '#ffc032', '#549bd3', '#f47e39'];
                            return colorList[params.dataIndex];
                        },

                        label: {
                            show: true,
                            position: 'top',
                            textStyle: {
                                color: '#333'
                            }
                        }
                    }
                },
                data: []
            }]
        });
        myChart.showLoading();
        var names = [];
        var nums = [];
        $.ajax({
            type: 'post',
            url: '/user/form/countVisitInfoByMonth.json',
            dataType: "json",
            success: function (result) {
                $.each(result.data, function (index, item) {
                    names.push(item.name);
                    nums.push(item.cou);
                });
                myChart.hideLoading();
                myChart.setOption({
                    xAxis: {
                        data: names
                    },
                    series: [{
                        name: '本月来访排行',
                        data: nums
                    }]
                });
            },
            error: function (errorMsg) {
                alert("图表请求数据失败!");
                myChart.hideLoading();
            }
        });
    }

    /*当日电访统计*/
    function countTelVisitInfoByToday() {
        var myChart = echarts.init(document.getElementById('countTelVisitInfoByToday'));
        myChart.setOption({
            title: {
                text: '日电访统计'
            },
            tooltip: {},
            legend: {
                data: ['日电访排行']
            },
            xAxis: {
                data: []
            },
            yAxis: {
                splitLine: {show: false},
                name: ''
            },
            series: [{
                barWidth: "30px",
                name: '日电访排行',
                type: 'bar',
                markLine: {
                    symbol: 'none',
                    itemStyle: {
                        normal: {
                            color: '#333',
                            label: {
                                show: true
                            }
                        }
                    },
                    data: [
                        {
                            name: '平均线',
                            type: 'average'
                        }
                    ]
                },
                itemStyle: {
                    normal: {
                        color: function (params) {
                            var colorList = ['#ffc032', '#EDDA59', '#438EB9', '#66ac52', '#549bd3', '#f47e39'];
                            return colorList[params.dataIndex];
                        },

                        label: {
                            show: true,
                            position: 'top',
                            textStyle: {
                                color: '#333'
                            }
                        }
                    }
                },
                data: []
            }]
        });
        myChart.showLoading();
        var names = [];
        var nums = [];
        $.ajax({
            type: 'post',
            url: '/cusTel/form/countTelVisitInfoByToday.json',
            dataType: "json",
            success: function (result) {
                $.each(result.data, function (index, item) {
                    names.push(item.name);
                    nums.push(item.cou);
                });
                myChart.hideLoading();
                myChart.setOption({
                    xAxis: {
                        data: names
                    },
                    series: [{
                        name: '日电访排行',
                        data: nums
                    }]
                });
            },
            error: function (errorMsg) {
                alert("图表请求数据失败!");
                myChart.hideLoading();
            }
        });
    }

    /*当月电访统计*/
    function countTelVisitInfoByMonth() {
        var myChart = echarts.init(document.getElementById('countTelVisitInfoByMonth'));
        myChart.setOption({
            title: {
                text: '本月电访统计'
            },
            tooltip: {},
            legend: {
                data: ['本月电访排行']
            },
            xAxis: {
                data: []
            },
            yAxis: {
                splitLine: {show: false},
                name: ''
            },
            series: [{
                barWidth: "30px",
                name: '本月电访排行',
                type: 'bar',
                markLine: {
                    symbol: 'none',
                    itemStyle: {
                        normal: {
                            color: '#333',
                            label: {
                                show: true
                            }
                        }
                    },
                    data: [
                        {
                            name: '平均线',
                            type: 'average'
                        }
                    ]
                },
                itemStyle: {
                    normal: {
                        color: function (params) {
                            var colorList = ['#f47e39', '#EDDA59', '#438EB9', '#66ac52', '#ffc032', '#549bd3'];
                            return colorList[params.dataIndex];
                        },

                        label: {
                            show: true,
                            position: 'top',
                            textStyle: {
                                color: '#333'
                            }
                        }
                    }
                },
                data: []
            }]
        });
        myChart.showLoading();
        var names = [];
        var nums = [];
        $.ajax({
            type: 'post',
            url: '/cusTel/form/countTelVisitInfoByMonth.json',
            dataType: "json",
            success: function (result) {
                $.each(result.data, function (index, item) {
                    names.push(item.name);
                    nums.push(item.cou);
                });
                myChart.hideLoading();
                myChart.setOption({
                    xAxis: {
                        data: names
                    },
                    series: [{
                        name: '本月电访排行',
                        data: nums
                    }]
                });
            },
            error: function (errorMsg) {
                alert("图表请求数据失败!");
                myChart.hideLoading();
            }
        });
    }

    /*当月每日成交量走势图*/
    function countSuccessfulCus() {
        var myChart = echarts.init(document.getElementById('countSuccessfulCus'));
        myChart.setOption({
            title: {
                text: '当月每日成交统计'
            },
            tooltip: {},
            legend: {
                data: ['当月每日成交量排行']
            },
            xAxis: {
                data: []
            },
            yAxis: {
                splitLine: {show: false},
                name: ''
            },
            series: [{
                barWidth: "30px",
                name: '当月每日成交量排行',
                type: 'line',
                markLine: {
                    symbol: 'none',
                    itemStyle: {
                        normal: {
                            color: '#333',
                            label: {
                                show: true
                            }
                        }
                    },
                    data: [
                        {
                            name: '平均线',
                            type: 'average'
                        }
                    ]
                },
                itemStyle: {
                    normal: {
                        color: function (params) {
                            var colorList = ['#EDDA59', '#438EB9', '#66ac52', '#ffc032', '#549bd3', '#f47e39'];
                            return colorList[params.dataIndex];
                        },

                        label: {
                            show: true,
                            position: 'top',
                            textStyle: {
                                color: '#333'
                            }
                        }
                    }
                },
                data: []
            }]
        });
        myChart.showLoading();
        var names = [];
        var nums = [];
        $.ajax({
            type: 'post',
            url: '/user/form/countSuccessfulCus.json',
            dataType: "json",
            success: function (result) {
                $.each(result.data, function (index, item) {
                    names.push(item.name);
                    nums.push(item.num);
                });
                myChart.hideLoading();
                myChart.setOption({
                    xAxis: {
                        data: names
                    },
                    series: [{
                        name: '当月每日成交量排行',
                        data: nums
                    }]
                });
            },
            error: function (errorMsg) {
                alert("图表请求数据失败!");
                myChart.hideLoading();
            }
        });
    }

    /*当月排名前十的业务员*/
    function countTenByUser() {
        var myChart = echarts.init(document.getElementById('countTenByUser'));
        myChart.setOption({
            title: {
                text: '光荣榜'
            },
            tooltip: {},
            legend: {
                data: ['业绩排行']
            },
            xAxis: {
                data: []
            },
            yAxis: {
                splitLine: {show: false},
                name: ''
            },
            series: [{
                barWidth: "30px",
                name: '业绩排行',
                type: 'bar',
                markLine: {
                    symbol: 'none',
                    itemStyle: {
                        normal: {
                            color: '#333',
                            label: {
                                show: true
                            }
                        }
                    },
                    data: [
                        {
                            name: '平均线',
                            type: 'average'
                        }
                    ]
                },
                itemStyle: {
                    normal: {
                        color: function (params) {
                            var colorList = ['#EDDA59', '#EBE6D2', '#FFD7C3', '#DD6A95', '#438EB9', '#66ac52', '#ffc032', '#549bd3', '#f47e39', '#549bd3'];
                            return colorList[params.dataIndex];
                        },

                        label: {
                            show: true,
                            position: 'top',
                            textStyle: {
                                color: '#333'
                            }
                        }
                    }
                },
                data: []
            }]
        });
        myChart.showLoading();
        var names = [];
        var nums = [];
        $.ajax({
            type: 'post',
            url: '/user/form/countTenByUser.json',
            dataType: "json",
            success: function (result) {
                $.each(result.data, function (index, item) {
                    names.push(item.name);
                    nums.push(item.cou);
                });
                myChart.hideLoading();
                myChart.setOption({
                    xAxis: {
                        data: names
                    },
                    series: [{
                        name: '业绩排行',
                        data: nums
                    }]
                });
            },
            error: function (errorMsg) {
                alert("图表请求数据失败!");
                myChart.hideLoading();
            }
        });
    }

    countTenByUser();
    countVisitInfoByToday();
    countVisitInfoByMonth();
    countTelVisitInfoByToday();
    countTelVisitInfoByMonth();
    countSuccessfulCus()
</script>
</body>
</html>