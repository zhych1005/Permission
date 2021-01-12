<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <script type="text/javascript"></script>
    <jsp:include page="/common/backend_common.jsp"/>
    <jsp:include page="/common/page.jsp"/>
</head>
<body>
<div class="main-content-inner">
    <div class="col-sm-12">
        <div class="col-xs-12">
            <div>
                <div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline no-footer">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="dataTables_length" id="dynamic-table_length">
                                <label>行数：
                                    <select id="pageSize" name="dynamic-table_length" aria-controls="dynamic-table"
                                            class="form-control input-sm">
                                        <option value="10">10</option>
                                        <option value="20">20</option>
                                        <option value="50">50</option>
                                    </select>
                                </label>
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
                                    文件名
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" style="text-align:center;">
                                    点击查看
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" style="text-align:center;">
                                    上传时间
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
<script id="fileTemplate" type="x-tmpl-mustache">
{{#cusList}}
<tr role="row" class="cus-name odd" data-id="{{id}}"><!--even -->
    <td>{{fileid}}</td>
    <td>{{filename}}</td>
    <td><a href={{fileurl}}>{{fileurl}}</a></td>
    <td>{{time}}</td>
</tr>
{{/cusList}}
</script>
<script type="application/javascript">
    $(function () {
        var fileTemplate = $('#fileTemplate').html();
        Mustache.parse(fileTemplate);
        var cusMap = {};
        loadCusList();
        $(".research").click(function (e) {
            e.preventDefault();
            loadCusList();
        });

        function loadCusList() {
            var pageSize = $("#pageSize").val();
            var pageNo = $("#cusPage .pageNo").val() || 1;
            var url = "/file/findAllFile.json";
            $.ajax({
                url: url,
                data: {
                    pageNo: pageNo,
                    pageSize: pageSize
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
                    var rendered = Mustache.render(fileTemplate, {
                        cusList: result.data.data,
                        "time": function () {
                            if (this.uplodetime == null) {
                                return "";
                            }
                            return new Date(this.uplodetime).Format("yyyy-MM-dd hh:mm:ss");
                        }
                    });
                    $('#cusList').html(rendered);

                    $.each(result.data.data, function (i, cus) {
                        cusMap[cus.id] = cus;
                    });
                } else {
                    $('#cusList').html('');
                }
                var pageSize = $("#pageSize").val();
                var pageNo = $("#cusPage .pageNo").val() || 1;
                renderPage(url, result.data.total, pageNo, pageSize, result.data.total > 0 ? result.data.data.length : 0, "cusPage", renderCusListAndPage);
            } else {
                showMessage("获取图片列表", result.msg, false);
            }
        }
    })
</script>
</body>
</html>