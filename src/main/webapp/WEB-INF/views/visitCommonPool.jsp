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
        公共池
        <small>
            <i class="ace-icon fa fa-angle-double-right"></i>
            来访客户
        </small>
    </h1>
</div>
<div class="main-content-inner">
    <div class="col-sm-12">
        <div class="col-xs-12">
            <div class="table-header">
                来访客户
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
                                <%--<label>客户状态：
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
                                姓名：
                                <input id="search-cusname" type="search" name="cusname" class="form-control input-sm"
                                       placeholder="客户姓名" aria-controls="dynamic-table">
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                区间：
                                <input id="search-from" type="search" name="fromTime" class="form-control input-sm"
                                       placeholder="开始时间" aria-controls="dynamic-table"> ~
                                <input id="search-to" type="search" name="toTime" class="form-control input-sm"
                                       placeholder="结束时间" aria-controls="dynamic-table">
                                &nbsp;&nbsp;&nbsp;&nbsp;--%>
                                <button class="btn btn-info fa fa-check research" style="margin-bottom: 6px;"
                                        type="button">
                                    刷新
                                </button>
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
                                    代理人
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" style="text-align:center;">
                                    性别
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" style="text-align:center;">
                                    年龄
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" style="text-align:center;">
                                    职业
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" style="text-align:center;">
                                    地址
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" style="text-align:center;">
                                    状态
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" style="text-align:center;">
                                    创建时间
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" style="text-align:center;">
                                    回访更新时间
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" style="text-align:center;">
                                    认购时间
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" style="text-align:center;">
                                    签约时间
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
                <td><textarea name="callRemark" id="callRemark" rows="10"
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

<%--公共池客户获取弹窗--%>
<div id="dialog-comon_cus-form" style="display: none;">
    <form id="com_cusForm">
        <table class="table table-striped table-bordered table-hover dataTable no-footer" role="grid" style="font-size:14px;text-align:center;">
            <tr>
                <input type="hidden" name="userid" id="com_userid" value="${user.id}" />
                <input type="hidden" name="deptId" id="com_deptId" value="${user.deptId}" />
                <input type="hidden" name="operator" id="com_username" value="${user.username}" />
                <input type="hidden" name="cusstatus" id="com_cusstatus" value="1" />
                <input type="hidden" name="cusSource" id="com_cusSource" value="3" />
                <input type="hidden" name="id" id="com_cusid" value="" />
                <td><label for="com_cusname">客户</label></td>
                <td><input type="text" name="cusname" id="com_cusname" value="" readonly style="font-size:14px;text-align:center;"/></td>
            </tr>
        </table>
    </form>
</div>

<script id="cusListTemplate" type="x-tmpl-mustache">
{{#cusList}}
<tr role="row" class="cus-name odd" data-id="{{id}}"><!--even -->
    <td>{{id}}</a></td>
    <td><a href="#" class="cus-edit" data-id="{{id}}">{{cusname}}</a></td>
    <td>{{operator}}</a></td><%--创建者--%>
    <td>{{proxy}}</td><%--代理人--%>
    <td>{{cusSex}}</td><%--性别--%>
    <td>{{age}}</td><%--年龄--%>
    <td>{{profession}}</td><%--职业--%>
    <td>{{area}}</td><%--地址--%>
    <td>{{cusStatus}}</td><%--状态--%>
    <td>{{showNow}}</td><%--创建时间--%>
    <td>{{showUpdate}}</td><%--更新时间--%>
    <td>{{showOrder}}</td><%--认购时间--%>
    <td>{{showOk}}</td><%--签约时间--%>
    <td>
       <div class="hidden-sm hidden-xs action-buttons" style="text-align:center;">
            <a class="get_cus" href="#" data-id="{{id}}">
                <i class="label label-sm label-success">获取</i>
            </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
            var url = "/user/form/timeOutVisitCus.json?deptId=${user.deptId}";
            $.ajax({
                url: url,
                data: {
                    pageNo: pageNo,
                    pageSize: pageSize,
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
                if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length === 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
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
                            } else if (this.cusstatus === 7) {
                                return "公共池";
                            } else {
                                return "其他"
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
                            if (this.operatortime == null){
                                return "";
                            }
                            return new Date(this.operatortime).Format("yyyy-MM-dd hh:mm:ss");
                        },

                        "showUpdate" :function () {
                            if (this.updateTime == null){
                                return "";
                            }
                            return new Date(this.updateTime).Format("yyyy-MM-dd hh:mm:ss");
                        },

                        "showOrder" :function () {
                            if (this.orderDate == null){
                                return "";
                            }
                            return new Date(this.orderDate).Format("yyyy-MM-dd");
                        },

                        "showOk" :function () {
                            if (this.dateOfContract == null) {
                                return "";
                            }
                            return new Date(this.dateOfContract).Format("yyyy-MM-dd");
                        }
                    });
                    $('#cusList').html(rendered);

                    $.each(result.data.data, function (i, cus) {
                        cusMap[cus.id] = cus;
                        bindCallBackInfoClick();
                        commonPoolClick();
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
                            $("#callRemark").val(targetCus.callRemark);
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

        /*公共池客户获取操作*/
        function commonPoolClick() {
            $(".get_cus").click(function (e) {
                e.preventDefault();
                e.stopPropagation();
                var cusId = $(this).attr("data-id");
                $("#dialog-comon_cus-form").dialog({
                    modal: true,
                    title: "是否获取该客户？",
                    open: function (event, ui) {
                        $(".ui-dialog-titlebar-close", $(this).parent()).hide();
                        optionStr = "";
                        $("#com_cusForm")[0].reset();
                        var targetCus = cusMap[cusId];
                        if (targetCus) {
                            $("#com_cusid").val(targetCus.id);
                            $("#com_cusname").val(targetCus.cusname);
                        }
                    },
                    buttons: {
                        "获取": function (e) {
                            e.preventDefault();
                            updateUser(false, function (data) {
                                $("#dialog-comon_cus-form").dialog("close");
                            }, function (data) {
                                showMessage("用户获取异常,刷新后重试！", data.msg, false);
                            })
                        },
                        "取消": function () {
                            $("#dialog-comon_cus-form").dialog("close");
                        }
                    }
                });
            });
        }

        /*公共池客户提交连接*/
        function updateUser(isCreate, successCallback, failCallback) {
            $.ajax({
                url: "/user/form/updateVisitCommonPool.json",
                data: $("#com_cusForm").serializeArray(),
                type: 'POST',
                success: function (result) {
                    if (result.ret) {
                        loadCusList();
                        if (successCallback) {
                            successCallback(result);
                        }
                    } else {
                        if (failCallback) {
                            failCallback(result);
                        }
                    }
                }
            })
        }
    })
</script>
</body>
</html>