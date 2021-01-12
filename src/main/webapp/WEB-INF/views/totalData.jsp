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

        /*.font{
            margin-top: 30px;
            color: #DD5A43;
            font-weight: bolder;
        }*/
        body {
            background: #ffffff
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
        /*.alert1{
            margin-top: 720px;
        }*/
    </style>

</head>
<body>
<div class="alert alert-info" style="font-size: 20px;text-align:center;">
    努&nbsp;&nbsp;力&nbsp;&nbsp;到&nbsp;&nbsp;无&nbsp;&nbsp;能&nbsp;&nbsp;为&nbsp;&nbsp;力&nbsp;,&nbsp;&nbsp;&nbsp;&nbsp;拼&nbsp;&nbsp;搏&nbsp;&nbsp;到&nbsp;&nbsp;感&nbsp;&nbsp;动&nbsp;&nbsp;自&nbsp;&nbsp;己！
</div>
<div class="deptAlert" style="font-size: 30px;">
    部门业绩展示
</div>
<div id="countVisitInfoByToday" style="width:525px; height:300px;" class="VisitInfoByToday"></div>
<div id="countVisitInfoByMonth" style="width:525px; height:300px;" class="VisitInfoByMonth"></div>
<div id="countTelVisitInfoByToday" style="width:525px; height:300px;" class="TelVisitInfoByToday"></div>
<div id="countSuccessfulCus" style="width:1600px; height:400px;" class="countSuccessfulCus"></div>
<%--<div class="alert1" style="font-size: 20px;text-align:center; color: grey;">
   专业服务，卓越执行！
</div>--%>
<script type="text/javascript">
    /*当日来访统计*/
    function countVisitInfoByToday() {
        var myChart = echarts.init(document.getElementById('countVisitInfoByToday'));
        myChart.setOption({
            title: {
                text: '当月接访量排行'
            },
            tooltip: {},
            legend: {
                data: ['当月接访量排行']
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
                name: '当月接访量排行',
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
            url: '/user/form/deptVisitByMon.json',
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
                        name: '当月接访量排行',
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
                text: '当月部门成交排行'
            },
            tooltip: {},
            legend: {
                data: ['当月部门成交排行']
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
                name: '当月部门成交排行',
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
            url: '/user/form/monthDealByDept.json',
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
                        name: '当月部门成交排行',
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

    /*本部门每个人的成交率*/
    function countTelVisitInfoByToday() {
        var myChart = echarts.init(document.getElementById('countTelVisitInfoByToday'));
        myChart.setOption({
            title: {
                text: '转化率排行（百分比:%）'
            },
            tooltip: {},
            legend: {
                data: ['转化率排行']
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
                name: '转化率排行',
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
            url: '/user/form/findDepartmentPerformanceByOne.json',
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
                        name: '转化率排行',
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


    /*当月本部门接访量走势图*/
    function countSuccessfulCus() {
        var myChart = echarts.init(document.getElementById('countSuccessfulCus'));
        myChart.setOption({
            title: {
                text: '部门年度成交量排行'
            },
            tooltip: {},
            legend: {
                data: ['部门年度成交量排行']
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
                name: '部门年度成交量排行',
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
            url: '/user/form/annualTurnover.json',
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
                        name: '部门年度成交量排行',
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

    countVisitInfoByToday();
    countVisitInfoByMonth();
    countTelVisitInfoByToday();
    countSuccessfulCus()
</script>
</body>
</html>