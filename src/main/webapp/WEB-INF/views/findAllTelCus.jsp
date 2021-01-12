<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/common/backend_common.jsp"/>
    <jsp:include page="/common/page.jsp"/>
</head>
<body class="no-skin" youdao="bind" style="background: white">
<input id="gritter-light" checked="" type="checkbox" class="ace ace-switch ace-switch-5"/>

<div class="page-header">
    <h1>
        数据汇总
        <small>
            <i class="ace-icon fa fa-angle-double-right"></i>
            电访客户历史
        </small>
    </h1>
</div>
<div class="main-content-inner">
    <div class="col-sm-12">
        <div class="col-xs-12">
            <div class="table-header">
                电访客户历史
            </div>
            <div>
                <div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline no-footer">
                    <div class="row">
                        <div class="col-xs-12">
                            <%--<button class="btn btn-info fa fa-plus-circle orange research cus-add"
                                    style="margin-bottom: 6px;" type="button">
                                客户新增
                            </button>&nbsp;&nbsp;&nbsp;&nbsp;--%>
                            <div class="dataTables_length" id="dynamic-table_length">
                                <label>行数：
                                    <select id="pageSize" name="dynamic-table_length" aria-controls="dynamic-table"
                                            class="form-control input-sm">
                                        <option value="15">15</option>
                                        <option value="25">25</option>
                                        <option value="50">50</option>
                                        <option value="100">100</option>
                                    </select>
                                </label>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <label>客户状态：
                                    <select id="search-cusstatus" name="dynamic-table_length"
                                            aria-controls="dynamic-table"
                                            class="form-control input-sm">
                                        <option value="0">全部</option>
                                        <option value="1">新增</option>
                                        <option value="2">跟踪</option>
                                        <option value="3">成交</option>
                                        <option value="4">流失</option>
                                    </select>
                                </label>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                部门：
                                <input id="search-deptName" type="search" name="deptName" class="form-control input-sm"
                                       placeholder="部门名称" aria-controls="dynamic-table">
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                姓名：
                                <input id="search-cusname" type="search" name="cusname" class="form-control input-sm"
                                       placeholder="客户姓名" aria-controls="dynamic-table">
                                <%--&nbsp;&nbsp;&nbsp;&nbsp;
                                电话：
                                <input id="search-cusPhone" type="search" name="cusPhone" class="form-control input-sm"
                                       placeholder="客户手机号" aria-controls="dynamic-table">--%>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                区间：
                                <input id="search-from" type="date" name="fromtime" class="form-control input-sm"
                                       placeholder="开始时间" aria-controls="dynamic-table"> ~
                                <input id="search-to" type="date" name="totime" class="form-control input-sm"
                                       placeholder="结束时间" aria-controls="dynamic-table">
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <button class="btn btn-info fa fa-check research" style="margin-bottom: 6px;"
                                        type="button">
                                    查找
                                </button>&nbsp;&nbsp;&nbsp;注：时间默认为该日期的0时
                            </div>
                        </div>
                        <table id="dynamic-table"
                               class="table table-striped table-bordered table-hover dataTable no-footer" role="grid"
                               aria-describedby="dynamic-table_info" style="font-size:14px;text-align:center;">
                            <thead>
                            <tr role="row">
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" style="text-align:center;">
                                    ID
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" style="text-align:center;">
                                    客户
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" style="text-align:center;">
                                    创建者
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" style="text-align:center;">
                                    部门
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" style="text-align:center;">
                                    代理人
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" style="text-align:center;">
                                    获知途径
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" style="text-align:center;">
                                    性别
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" style="text-align:center;">
                                    地址
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" style="text-align:center;">
                                    状态
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" style="text-align:center;">
                                    面积㎡
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" style="text-align:center;">
                                    关注点
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" style="text-align:center;">
                                    创建时间
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" style="text-align:center;">
                                    回访更新时间
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" style="text-align:center;">
                                    来访时间
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" style="text-align:center;">
                                    记录
                                </th>
                            </tr>
                            </thead>
                            <tbody id="cusList"></tbody>
                        </table>
                        <div class="row" id="cusPage">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--回访记录弹窗--%>
<div id="dialog-cusCallBack-form" style="display: none;">
    <form id="callRemarkForm">
        <table class="table table-striped table-bordered table-hover dataTable no-footer" role="grid">
            <tr>
                <td><textarea name="telCallRemark" id="telCallRemark" rows="10"
                              cols="85" readonly></textarea></td>
            </tr>
            <tr>
                <td>备注</td>
            </tr>
            <tr>
                <td><textarea name="remark" id="call_remark" rows="3"
                              cols="85" readonly></textarea></td>
            </tr>
        </table>
    </form>
</div>

<script id="cusListTemplate" type="x-tmpl-mustache">
{{#cusList}}
<tr role="row" class="cus-name odd" data-id="{{id}}"><!--even -->
 <td>{{id}}</td>
<td><a href="#" class="cus-edit" data-id="{{id}}">{{cusname}}</a></td>
    <td>{{operator}}</td><%--创建者--%>
    <td>{{name}}</td><%--部门--%>
    <td>{{proxy}}</td><%--代理人--%>
    <td>{{grundlagen}}</td><%--客户来源--%>
    <td>{{cusSex}}</td><%--性别--%>
    <td>{{area}}</td><%--地址--%>
    <td>{{cusStatus}}</td><%--状态--%>
    <td>{{acreage}}</td><%--面积--%>
    <td>{{focus}}</td><%--关注点--%>
    <td>{{showNow}}</td><%--创建时间--%>
    <td>{{showUpdate}}</td><%--更新时间--%>
    <td>{{showVisit}}</td><%--来访时间--%>
    <td>
       <div class="hidden-sm hidden-xs action-buttons" style="text-align:center;">
            <a class="call-info" href="#" data-id="{{id}}">
                <i class="badge badge-yellow">回访记录</i>
            </a>
       </div>
    </td>
</tr>
{{/cusList}}

</script>
<script type="application/javascript">
    $(function () {
        var cusListTemplate = $('#cusListTemplate').html();
        Mustache.parse(cusListTemplate);
        var cusMap = {};
        loadCusList();
        $(".research").click(function (e) {
            e.preventDefault();
            loadCusList();
        });

        function loadCusList() {
            var pageSize = $("#pageSize").val();
            var pageNo = $("#cusPage .pageNo").val() || 1;
            var url = "/cusTel/form/findAllTelCus.json";
            var cusstatus = $("#search-cusstatus").val();
            var cusname = $("#search-cusname").val();
            var fromtime = $("#search-from").val();
            var totime = $("#search-to").val();
            var deptName = $("#search-deptName").val();
            var cusPhone = $("#search-cusPhone").val();
            $.ajax({
                url: url,
                data: {
                    pageNo: pageNo,
                    pageSize: pageSize,
                    cusstatus: cusstatus,
                    cusname: cusname,
                    fromtime: fromtime,
                    totime: totime,
                    deptName: deptName,
                    cusPhone: cusPhone
                },
                success: function (result) {
                    renderCusListAndPage(result, url);
                }
            });
        }

        Date.prototype.Format = function (fmt) { //author: meizz
            var o = {
                "M+": this.getMonth() + 1, //月份
                "d+": this.getDate(), //日
                "h+": this.getHours(), //小时
                "m+": this.getMinutes(), //分
                "s+": this.getSeconds(), //秒
                "q+": Math.floor((this.getMonth() + 3) / 3), //季度
                "S": this.getMilliseconds() //毫秒
            };
            if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
            for (var k in o)
                if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
            return fmt;
        };

        function renderCusListAndPage(result, url) {
            if (result.ret) {
                if (result.data.total > 0) {
                    var rendered = Mustache.render(cusListTemplate, {
                        cusList: result.data.data,
                        "cusStatus": function() {
                            if (this.cusstatus === 1) {
                                return "新增";
                            } else if (this.cusstatus === 2) {
                                return "跟踪";
                            } else if (this.cusstatus === 3) {
                                return "成交";
                            } else if (this.cusstatus === 4) {
                                return "流失";
                            } else {
                                return "已到访"
                            }
                        },

                        "cusSex": function() {
                            if (this.cussex === 1) {
                                return "男";
                            } else if (this.cussex === 2) {
                                return "女";
                            } else {
                                return "其他"
                            }
                        },
                        "showNow" :function () {
                            return new Date(this.operatortime).Format("yyyy-MM-dd hh:mm:ss");
                        },

                        "showUpdate" :function () {
                            return new Date(this.updateTime).Format("yyyy-MM-dd hh:mm:ss");
                        },

                        "showVisit" :function () {
                            if (this.timeOfVisit == null) {
                                return "";
                            }
                            return new Date(this.timeOfVisit).Format("yyyy-MM-dd");
                        }
                    });
                    $('#cusList').html(rendered);

                    $.each(result.data.data, function (i, cus) {
                        cusMap[cus.id] = cus;
                        bindCallBackInfoClick();
                    });
                } else {
                    $('#cusList').html('');
                }
                var pageSize = $("#pageSize").val();
                var pageNo = $("#cusPage .pageNo").val() || 1;
                renderPage(url, result.data.total, pageNo, pageSize, result.data.total > 0 ? result.data.data.length : 0, "cusPage", renderCusListAndPage);
            } else {
                showMessage("获取客户的列表", result.msg, false);
            }
        }

        /*客户回访记录详情*/
        function bindCallBackInfoClick() {
            $(".call-info").click(function (e) {
                e.preventDefault();
                e.stopPropagation();
                var cusId = $(this).attr("data-id");
                $("#dialog-cusCallBack-form").dialog({
                    modal: true,
                    title: "客户回访记录",
                    open: function (event, ui) {
                        $(".ui-dialog-titlebar-close", $(this).parent()).hide();
                        optionStr = "";
                        $("#callRemarkForm")[0].reset();
                        var targetCus = cusMap[cusId];
                        if (targetCus) {
                            $("#telCallRemark").val(targetCus.telCallRemark);
                            $("#call_remark").val(targetCus.remark);
                        }
                    },
                    buttons: {
                        "关闭": function () {
                            $("#dialog-cusCallBack-form").dialog("close");
                        }
                    }
                });
            });
        }
    })
</script>
</body>
</html>