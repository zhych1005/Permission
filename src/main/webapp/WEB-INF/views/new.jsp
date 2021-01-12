<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<html>
<head>
    <jsp:include page="/common/backend_common.jsp"/>
    <jsp:include page="/common/page.jsp"/>
    <style type="text/css">
        input[type=date]::-webkit-inner-spin-button {
            visibility: hidden;
        }
    </style>
</head>
<body class="no-skin" youdao="bind" style="background: white">
<input id="gritter-light" checked="" type="checkbox" class="ace ace-switch ace-switch-5"/>

<div class="page-header">
    <h1>
        来访客户
        <small>
            <i class="ace-icon fa fa-angle-double-right"></i>
            来访客户登记
        </small>
    </h1>
</div>
<div class="main-content-inner">
    <div class="col-sm-12">
        <div class="col-xs-12">
            <div class="table-header">
                ${user.username}：来访客户登记
            </div>
            <div>
                <div id="dynamic-table_wrapper" class="dataTables_wrapper form-inline no-footer">
                    <div class="row">
                        <div class="col-xs-12">
                            <button class="ace-icon fa fa-plus-circle green bigger-130 cus-add" id="add"
                                    style="margin-bottom: 6px;" type="button">
                                客户新增
                            </button>&nbsp;&nbsp;&nbsp;&nbsp;
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
                                        <option value="">全部</option>
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
                                电话：
                                <input id="search-cusPhone" type="search" name="cusPhone" class="form-control input-sm"
                                       placeholder="客户手机号" aria-controls="dynamic-table">
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                区间：
                                <input id="search-from" type="date" name="fromTime" class="form-control input-sm"
                                       placeholder="开始时间" aria-controls="dynamic-table"> ~
                                <input id="search-to" type="date" name="toTime" class="form-control input-sm"
                                       placeholder="结束时间" aria-controls="dynamic-table">
                                &nbsp;&nbsp;&nbsp;&nbsp;
                                <button class="btn btn-sm btn-success research" style="margin-bottom: 2px;"
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
                                    来源
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
                                    手机
                                </th>
                                <th tabindex="0" aria-controls="dynamic-table" rowspan="1" colspan="1" style="text-align:center;">
                                    电话
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
                                    操作
                                </th>
                            </tr>
                            </thead>
                            <tbody id="cusList"></tbody>
                        </table>
                        <div class="row" id="cusPage">
                        </div>
                    </div>
                </div> <%----%>
            </div>
        </div>
    </div>
</div>

<%--添加表单--%>
<div id="dialog-cus-form" style="display: none;">
    <form id="cusForm">
        <table class="table table-striped table-bordered table-hover dataTable no-footer" role="grid">
            <tr>
                <td><label for="cusname">客户姓名</label></td>
                <input type="hidden" name="id" id="cusid"/>
                <input type="hidden" name="userid" id="userid" value="${user.id}" />
                <input type="hidden" name="deptId" id="deptId" value="${user.deptId}" />
                <input type="hidden" name="cusSource" id="cusSource" value="1"/>
                <td><input type="text" name="cusname" id="cusname" value=""
                           class="text ui-widget-content ui-corner-all"/>☀
                </td>
                <td><label for="proxy">代理人</label></td>
                <td><input type="text" name="proxy" id="proxy" value=""/></td>
            </tr>

            <tr>
                <td><label for="cussex">性别</label></td>
                <td>
                    <select id="cussex" name="cussex" data-placeholder="客户性别" style="width: 150px;">
                        <option value="" disabled selected hidden>选择</option>
                        <option value="1">男</option>
                        <option value="2">女</option>
                    </select>☀
                </td>

                <td><label for="cusstatus">状态</label></td>
                <td>
                    <select id="cusstatus" name="cusstatus" data-placeholder="客户状态" style="width: 150px">
                        <option value="" disabled selected hidden>选择</option>
                        <option value="1">新增</option>
                        <option value="2">跟踪</option>
                        <option value="3">成交</option>
                        <option value="4">流失</option>
                    </select>☀
                </td>
            </tr>

            <tr>
                <td><label for="cusPhone">手机</label></td>
                <td><input type="text" name="cusPhone" id="cusPhone" value=""
                           class="text ui-widget-content ui-corner-all">☀
                </td>
                <td><label for="custel">电话</label></td>
                <td><input type="text" name="custel" id="custel" value=""
                           class="text ui-widget-content ui-corner-all"></td>
            </tr>

            <tr>
                <td><label for="ownProperty">置业次数</label></td>
                <td>
                    <select name="ownProperty" id="ownProperty" data-placeholder="置业次数" style="width: 150px">
                        <option value="" disabled selected hidden>选择</option>
                        <option value="首次置业">首次置业</option>
                        <option value="二次置业">二次置业</option>
                        <option value="多次置业">多次置业</option>

                    </select>
                </td>

                <td><label for="age">年龄</label></td>
                <td><input type="text" name="age" id="age" value=""/>岁</td>
            </tr>

            <tr>
                <td><label for="profession">职业</label></td>
                <td>
                    <select name="profession" id="profession" data-placeholder="职业" style="width: 150px">
                        <option value="" disabled selected hidden>选择</option>
                        <option value="外地上班">外地上班</option>
                        <option value="外地个体">外地个体</option>
                        <option value="公务员">公务员</option>
                        <option value="本地个体">本地个体</option>
                        <option value="私营单位">私营单位</option>
                        <option value="无业">无业</option>
                        <option value="老师">老师</option>
                        <option value="医生">医生</option>
                    </select>☀
                </td>

                <td><label for="purpose">目的</label></td>
                <td>
                    <select name="purpose" id="purpose" data-placeholder="目的" style="width: 150px">
                        <option value="" disabled selected hidden>选择</option>
                        <option value="自住">自住</option>
                        <option value="投资">投资</option>
                        <option value="婚房">婚房</option>
                    </select>☀
                </td>
            </tr>

            <tr>
                <td><label for="firstVisit">首访渠道</label></td>
                <td>
                    <select name="firstVisit" id="firstVisit" data-placeholder="首访渠道" style="width: 150px">
                        <option value="" disabled selected hidden>选择</option>
                        <option value="路过">路过</option>
                        <option value="楼体">楼体</option>
                        <option value="朋介">朋介</option>
                        <option value="网络">网络</option>
                        <option value="户外大牌">户外大牌</option>
                        <option value="单页">单页</option>
                        <option value="老带新">老带新</option>
                        <option value="车体">车体</option>
                        <option value="拓客">拓客</option>
                        <option value="飞播">飞播</option>
                        <option value="call客">call客</option>
                        <option value="公交站牌">公交站牌</option>
                        <option value="经纪人">经纪人</option>
                        <option value="道旗">道旗</option>
                        <option value="内部推介">内部推介</option>
                        <option value="墙体">墙体</option>
                    </select>☀
                </td>


                <td><label for="focus">关注点</label></td>
                <td>
                    <select name="focus" id="focus" data-placeholder="关注点" style="width: 150px">
                        <option value="" disabled selected hidden>选择</option>
                        <option value="价位">价位</option>
                        <option value="位置">位置</option>
                        <option value="户型">户型</option>
                        <option value="物业">物业</option>
                        <option value="绿化">绿化</option>
                        <option value="附加值">附加值</option>
                        <option value="投资前景">投资前景</option>
                    </select>☀
                </td>
            </tr>

            <tr>
                <td><label for="desirable">意向户型</label></td>
                <td><input type="text" name="desirable" id="desirable" value=""/>☀</td>

                <td><label for="price">意向价位</label></td>
                <td><input type="text" name="price" id="price" value=""/>万☀</td>
            </tr>

            <tr>
                <td><label for="paymentMethod">付款方式</label></td>
                <td>
                    <select id="paymentMethod" name="paymentMethod" data-placeholder="付款方式" style="width: 150px;">
                        <option value="" disabled selected hidden>选择</option>
                        <option value="按揭">按揭</option>
                        <option value="一次性">一次性</option>
                        <option value="公积金">公积金</option>
                    </select>
                </td>

                <td><label for="restrictedPurchase">限购</label></td>
                <td>
                    <select id="restrictedPurchase" name="restrictedPurchase" data-placeholder="限购" style="width: 150px;">
                        <option value="" disabled selected hidden>选择</option>
                        <option value="是">是</option>
                        <option value="否">否</option>
                    </select>☀
                </td>
            </tr>

            <tr>
                <td><label for="area">地址</label></td>
                <td><input type="text" name="area" id="area" value=""/>区/县☀</td>

                <td><label for="familyStructure">家庭结构</label></td>
                <td>
                    <select name="familyStructure" id="familyStructure" data-placeholder="家庭结构" style="width: 150px">
                        <option value="" disabled selected hidden>选择</option>
                        <option value="单身独居">单身独居</option>
                        <option value="单身且与父母">单身且与父母</option>
                        <option value="两口与孩子">两口与孩子</option>
                        <option value="三代同堂">三代同堂</option>
                    </select>
                </td>
            </tr>


            <tr>
                <td><label for="placeOfDomicile">籍贯</label></td>
                <td><input type="text" name="placeOfDomicile" id="placeOfDomicile" value=""/>省</td>

                <td><label for="maritalStatus">婚姻状况</label></td>
                <td>
                    <select id="maritalStatus" name="maritalStatus" data-placeholder="婚姻状况" style="width: 150px;">
                        <option value="" disabled selected hidden>选择</option>
                        <option value="未婚">未婚</option>
                        <option value="已婚">已婚</option>
                        <option value="离异">离异</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td><label for="orderDate">认购日期</label></td>
                <td><input type="date" name="orderDate" id="orderDate" value=""/></td>

                <td><label for="dateOfContract">签约日期</label></td>
                <td><input type="date" name="dateOfContract" id="dateOfContract" value=""/></td>
            </tr>

            <tr>
                <td><label for="defect">置业抗性</label></td>
                <td><textarea name="defect" id="defect" rows="3"
                              cols="25"></textarea></td>

                <td><label for="remark">备注</label></td>
                <td><textarea name="remark" id="remark" rows="3"
                              cols="25"></textarea></td>
            </tr>
        </table>
    </form>
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

<%--添加回访记录--%>
<div id="dialog-callBack-form" style="display: none;">
    <form id="callBackForm">
        <table class="table table-striped table-bordered table-hover dataTable no-footer" role="grid">
            <tr>
                <td>
                    <label for="cusname">客户姓名</label>
                    <input type="hidden" name="userid" id="ca_userid" value="${user.id}" />
                    <input type="hidden" name="deptId" id="ca_deptId" value="${user.deptId}" />
                    <input type="hidden" name="username" id="username" value="${user.username}" />
                    <input type="hidden" name="cusId" id="ca_cusId" value="" />
                    <input type="text" name="cusname" id="ca_cusname" value="" readonly/>
                </td>
                <td><label for="remark">回访内容</label></td>
                <td><textarea name="remark" id="ca_remark" rows="5"
                              cols="25"></textarea></td>
            </tr>
        </table>
    </form>
</div>

<%--修改表单--%>
<div id="dialog-ch_cus-form" style="display: none;">
    <form id="ch_cusForm">
        <table class="table table-striped table-bordered table-hover dataTable no-footer" role="grid">
            <tr>
                <td><label for="cusname">客户姓名</label></td>
                <input type="hidden" name="id" id="c_cusid"/>
                <input type="hidden" name="userid" id="c_userid" value="${user.id}" />
                <input type="hidden" name="deptId" id="c_deptId" value="${user.deptId}" />
                <input type="hidden" name="cusSource" id="c_cusSource" value=""/>
                <td><input type="text" name="cusname" id="c_cusname" value=""
                           class="text ui-widget-content ui-corner-all">☀
                </td>
                <td><label for="proxy">代理人</label></td>
                <td><input type="text" name="proxy" id="c_proxy" value=""/></td>
            </tr>

            <tr>
                <td><label for="cussex">性别</label></td>
                <td>
                    <select id="c_cussex" name="cussex" data-placeholder="客户性别" style="width: 150px;">
                        <option value="" disabled selected hidden>选择</option>
                        <option value="1">男</option>
                        <option value="2">女</option>
                    </select>☀
                </td>

                <td><label for="cusstatus">状态</label></td>
                <td>
                    <select id="c_cusstatus" name="cusstatus" data-placeholder="客户状态" style="width: 150px;">
                        <option value="" disabled selected hidden>选择</option>
                        <option value="1">新增</option>
                        <option value="2">跟踪</option>
                        <option value="3">成交</option>
                        <option value="4">流失</option>
                    </select>☀
                </td>
            </tr>

            <tr>
                <td><label for="cusPhone">手机</label></td>
                <td><input type="text" name="cusPhone" id="c_cusPhone" value=""
                           class="text ui-widget-content ui-corner-all">☀
                </td>
                <td><label for="custel">电话</label></td>
                <td><input type="text" name="custel" id="c_custel" value=""
                           class="text ui-widget-content ui-corner-all"></td>
            </tr>

            <tr>
                <td><label for="ownProperty">置业次数</label></td>
                <td>
                    <select name="ownProperty" id="c_ownProperty" data-placeholder="置业次数" style="width: 150px">
                        <option value="" disabled selected hidden>选择</option>
                        <option value="首次置业">首次置业</option>
                        <option value="二次置业">二次置业</option>
                        <option value="多次置业">多次置业</option>
                    </select>
                </td>

                <td><label for="age">年龄</label></td>
                <td><input type="text" name="age" id="c_age" value=""/>岁</td>
            </tr>

            <tr>
                <td><label for="profession">职业</label></td>
                <td>
                    <select name="profession" id="c_profession" data-placeholder="职业" style="width: 150px">
                        <option value="" disabled selected hidden>选择</option>
                        <option value="外地上班">外地上班</option>
                        <option value="外地个体">外地个体</option>
                        <option value="公务员">公务员</option>
                        <option value="本地个体">本地个体</option>
                        <option value="私营单位">私营单位</option>
                        <option value="无业">无业</option>
                        <option value="老师">老师</option>
                        <option value="医生">医生</option>
                    </select>☀
                </td>

                <td><label for="purpose">目的</label></td>
                <td>
                    <select name="purpose" id="c_purpose" data-placeholder="目的" style="width: 150px">
                        <option value="" disabled selected hidden>选择</option>
                        <option value="自住">自住</option>
                        <option value="投资">投资</option>
                        <option value="婚房">婚房</option>
                    </select>☀
                </td>
            </tr>

            <tr>
                <td><label for="firstVisit">首访渠道</label></td>
                <td>
                    <select name="firstVisit" id="c_firstVisit" data-placeholder="首访渠道" style="width: 150px">
                        <option value="" disabled selected hidden>选择</option>
                        <option value="路过">路过</option>
                        <option value="楼体">楼体</option>
                        <option value="朋介">朋介</option>
                        <option value="网络">网络</option>
                        <option value="户外大牌">户外大牌</option>
                        <option value="单页">单页</option>
                        <option value="老带新">老带新</option>
                        <option value="车体">车体</option>
                        <option value="拓客">拓客</option>
                        <option value="飞播">飞播</option>
                        <option value="call客">call客</option>
                        <option value="公交站牌">公交站牌</option>
                        <option value="经纪人">经纪人</option>
                        <option value="道旗">道旗</option>
                        <option value="内部推介">内部推介</option>
                        <option value="墙体">墙体</option>
                    </select>☀
                </td>

                <td><label for="focus">关注点</label></td>
                <td>
                    <select name="focus" id="c_focus" data-placeholder="关注点" style="width: 150px">
                        <option value="" disabled selected hidden>选择</option>
                        <option value="价位">价位</option>
                        <option value="位置">位置</option>
                        <option value="户型">户型</option>
                        <option value="物业">物业</option>
                        <option value="绿化">绿化</option>
                        <option value="附加值">附加值</option>
                        <option value="投资前景">投资前景</option>
                    </select>☀
                </td>
            </tr>

            <tr>
                <td><label for="desirable">意向户型</label></td>
                <td><input type="text" name="desirable" id="c_desirable" value=""/>☀</td>

                <td><label for="price">意向价位</label></td>
                <td><input type="text" name="price" id="c_price" value=""/>万☀</td>
            </tr>

            <tr>
                <td><label for="paymentMethod">付款方式</label></td>
                <td>
                    <select id="c_paymentMethod" name="paymentMethod" data-placeholder="付款方式" style="width: 150px;">
                        <option value="" disabled selected hidden>选择</option>
                        <option value="按揭">按揭</option>
                        <option value="一次性">一次性</option>
                        <option value="公积金">公积金</option>
                    </select>
                </td>

                <td><label for="restrictedPurchase">限购</label></td>
                <td>
                    <select id="c_restrictedPurchase" name="restrictedPurchase" data-placeholder="限购"
                            style="width: 150px;">
                        <option value="" disabled selected hidden>选择</option>
                        <option value="是">是</option>
                        <option value="否">否</option>
                    </select>☀
                </td>
            </tr>

            <tr>
                <td><label for="area">地址</label></td>
                <td><input type="text" name="area" id="c_area" value=""/>区/县☀</td>

                <td><label for="familyStructure">家庭结构</label></td>
                <td>
                    <select name="familyStructure" id="c_familyStructure" data-placeholder="家庭结构" style="width: 150px">
                        <option value="" disabled selected hidden>选择</option>
                        <option value="单身独居">单身独居</option>
                        <option value="单身且与父母">单身且与父母</option>
                        <option value="两口与孩子">两口与孩子</option>
                        <option value="三代同堂">三代同堂</option>
                    </select>
                </td>
            </tr>
            </tr>


            <tr>
                <td><label for="placeOfDomicile">籍贯</label></td>
                <td><input type="text" name="placeOfDomicile" id="c_placeOfDomicile" value=""/>省</td>

                <td><label for="maritalStatus">婚姻状况</label></td>
                <td>
                    <select id="c_maritalStatus" name="maritalStatus" data-placeholder="婚姻状况" style="width: 150px;">
                        <option value="" disabled selected hidden>选择</option>
                        <option value="未婚">未婚</option>
                        <option value="已婚">已婚</option>
                        <option value="离异">离异</option>
                    </select>
                </td>
            </tr>

            <tr>
                <td><label for="orderDate">认购日期</label></td>
                <td><input type="date" name="orderDate" id="c_orderDate" value=""/></td>

                <td><label for="dateOfContract">签约日期</label></td>
                <td><input type="date" name="dateOfContract" id="c_dateOfContract" value=""/></td>
            </tr>

            <tr>
                <td><label for="defect">置业抗性</label></td>
                <td><textarea name="defect" id="c_defect" rows="3"
                              cols="25"></textarea></td>

                <td><label for="remark">备注</label></td>
                <td><textarea name="remark" id="c_remark" rows="3"
                              cols="25"></textarea></td>
            </tr>
        </table>
    </form>
</div>

<script id="cusListTemplate" type="x-tmpl-mustache">
{{#cusList}}
<tr role="row" class="cus-name odd" data-id="{{id}}"><!--even -->
 <td>{{id}}</td>
<td><a href="#" class="cus-edit" data-id="{{id}}">{{cusname}}</a></td>
    <td>{{cus_Source}}</td><%--客户来源--%>
    <td>{{proxy}}</td><%--代理人--%>
    <td>{{cusSex}}</td><%--性别--%>
    <td>{{age}}</td><%--年龄--%>
    <td>{{profession}}</td><%--职业--%>
    <td>{{area}}</td><%--地址--%>
    <td>{{cusPhone}}</td><%--电话--%>
    <td>{{custel}}</td><%--电话--%>
    <td>{{cusStatus}}</td><%--状态--%>
    <td>{{showNow}}</td><%--创建时间--%>
    <td>{{showUpdate}}</td><%--更新时间--%>
    <td>{{showOrder}}</td><%--认购时间--%>
    <td>{{showOk}}</td><%--签约时间--%>
    <td>
       <div class="hidden-sm hidden-xs action-buttons" style="text-align:center;">
           <a class="green cus-edit" href="#" data-id="{{id}}">
               <i class="ace-icon fa fa-pencil-square-o bigger-130"></i>
           </a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a class="cus-callBack" href="#" data-id="{{id}}">
                <i class="badge badge-danger">客户回访</i>
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
            loadCusList();
        });

        function loadCusList() {
            var pageSize = $("#pageSize").val();
            var pageNo = $("#cusPage .pageNo").val() || 1;
            var url = "/user/form/addFormPage.json?userid=${user.id}&deptId=${user.deptId}";
            var cusstatus = $("#search-cusstatus").val();
            var cusname = $("#search-cusname").val();
            var fromtime = $("#search-from").val();
            var totime = $("#search-to").val();
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
                    cusPhone: cusPhone
                },
                cusstatus: 'POST',
                success: function (result) {
                    renderCusListAndPage(result, url);
                }
            });
        }

        function renderCusListAndPage(result, url) {
            if (result.ret) {
                if (result.data.total > 0) {
                    var rendered = Mustache.render(cusListTemplate, {
                        cusList: result.data.data,
                        "cusStatus": function () {
                            if (this.cusstatus === 1) {
                                return "新增";
                            } else if (this.cusstatus === 2) {
                                return "跟踪";
                            } else if (this.cusstatus === 3) {
                                return "成交";
                            } else if (this.cusstatus === 4) {
                                return "流失";
                            } else {
                                return "其他"
                            }
                        },

                        "cus_Source": function () {
                            if (this.cusSource === 1) {
                                return "来访";
                            } else if (this.cusSource === 2) {
                                return "电转访";
                            } else if (this.cusSource === 3) {
                                return "公共池";
                            } else {
                                return "其他"
                            }
                        },

                        "cusSex": function () {
                            if (this.cussex === 1) {
                                return "男";
                            } else if (this.cussex === 2) {
                                return "女";
                            } else {
                                return "其他"
                            }
                        },
                        "showNow": function () {
                            return new Date(this.operatortime).Format("yyyy-MM-dd hh:mm:ss");
                        },

                        "showUpdate": function () {
                            return new Date(this.updateTime).Format("yyyy-MM-dd hh:mm:ss");
                        },

                        "showOrder": function () {
                            if (this.orderDate == null) {
                                return "";
                            }
                            return new Date(this.orderDate).Format("yyyy-MM-dd");
                        },

                        "showOk": function () {
                            if (this.dateOfContract == null) {
                                return "";
                            }
                            return new Date(this.dateOfContract).Format("yyyy-MM-dd");
                        }

                    });
                    $('#cusList').html(rendered);

                    $.each(result.data.data, function (i, cus) {
                        cusMap[cus.id] = cus;
                    });
                    $("#cusList").html(rendered);
                    bindcusClick();
                    bindCallBackClick();
                    bindCallBackInfoClick();
                    $.each(result.data.data, function (i, cus) {
                        cusMap[cus.id] = cus;
                    })
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

        /*用户修改*/
        function bindcusClick() {
            $(".cus-edit").click(function (e) {
                e.preventDefault();
                e.stopPropagation();
                var cusId = $(this).attr("data-id");
                $("#dialog-ch_cus-form").dialog({
                    modal: true,
                    title: "用户修改",
                    open: function (event, ui) {
                        $(".ui-dialog-titlebar-close", $(this).parent()).hide();
                        optionStr = "";
                        $("#ch_cusForm")[0].reset();
                        var targetCus = cusMap[cusId];
                        if (targetCus) {
                            $("#c_cusid").val(targetCus.id);
                            $("#c_deptId").val(targetCus.deptId);
                            $("#c_cussex").val(targetCus.cussex);
                            $("#c_custel").val(targetCus.custel);
                            $("#c_cusPhone").val(targetCus.cusPhone);
                            $("#c_cusname").val(targetCus.cusname);
                            $("#c_age").val(targetCus.age);
                            $("#c_profession").val(targetCus.profession);
                            $("#c_ownProperty").val(targetCus.ownProperty);
                            $("#c_purpose").val(targetCus.purpose);
                            $("#c_area").val(targetCus.area);
                            $("#c_familyStructure").val(targetCus.familyStructure);
                            $("#c_placeOfDomicile").val(targetCus.placeOfDomicile);
                            $("#c_maritalStatus").val(targetCus.maritalStatus);
                            $("#c_restrictedPurchase").val(targetCus.restrictedPurchase);
                            $("#c_proxy").val(targetCus.proxy);
                            $("#c_cusstatus").val(targetCus.cusstatus);
                            $("#c_remark").val(targetCus.remark);
                            $("#id").val(targetCus.id);
                            $("#c_firstVisit").val(targetCus.firstVisit);
                            $("#c_focus").val(targetCus.focus);
                            $("#c_desirable").val(targetCus.desirable);
                            $("#c_price").val(targetCus.price);
                            $("#c_paymentMethod").val(targetCus.paymentMethod);
                            $("#c_defect").val(targetCus.defect);

                            var order = targetCus.orderDate;
                            var contract = targetCus.dateOfContract;
                            if (order == null && contract != null) {
                                $("#c_dateOfContract").val(new Date(contract).Format("yyyy-MM-dd"));
                            } else if (contract == null && order != null) {
                                $("#c_orderDate").val(new Date(order).Format("yyyy-MM-dd"));
                            } else if (order != null && contract != null) {
                                $("#c_dateOfContract").val(new Date(contract).Format("yyyy-MM-dd"));
                                $("#c_orderDate").val(new Date(order).Format("yyyy-MM-dd"));
                            } else {
                                return "";
                            }
                        }
                    },
                    buttons: {
                        "更新": function (e) {
                            e.preventDefault();
                            updateUser(false, function (data) {
                                $("#dialog-ch_cus-form").dialog("close");
                            }, function (data) {
                                showMessage("更新用户", data.msg, false);
                            })
                        },
                        "取消": function () {
                            $("#dialog-ch_cus-form").dialog("close");
                        }
                    }
                });
            });
        }

        /*添加用户*/
        $(".cus-add").click(function () {
            $("#dialog-cus-form").dialog({
                modal: true,
                title: "新增用户",
                open: function (event, ui) {
                    $(".ui-dialog-titlebar-close", $(this).parent()).hide();
                    optionStr = "";
                    $("#cusForm")[0].reset();
                },
                buttons: {
                    "添加": function (e) {
                        e.preventDefault();
                        addCus(true, function (data) {
                            $("#dialog-cus-form").dialog("close");
                        }, function (data) {
                            showMessage("请将以下信息补充完成, “ ☀ ” 为必填项目", data.msg, false);
                        })
                    },
                    "取消": function () {
                        $("#dialog-cus-form").dialog("close");
                    }
                }
            });
        });

        function updateUser(isCreate, successCallback, failCallback) {
            $.ajax({
                url: "/user/form/updateForm.json",
                data: $("#ch_cusForm").serializeArray(),
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

        function addCus(isCreate, successCallback, failCallback) {
            $.ajax({
                url: "/user/form/newForm.json",
                data: $("#cusForm").serializeArray(),
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


        /*添加回访记录表单*/
        function bindCallBackClick() {
            $(".cus-callBack").click(function (e) {
                e.preventDefault();
                e.stopPropagation();
                var cusId = $(this).attr("data-id");
                $("#dialog-callBack-form").dialog({
                    modal: true,
                    title: "客户回访",
                    open: function (event, ui) {
                        $(".ui-dialog-titlebar-close", $(this).parent()).hide();
                        optionStr = "";
                        $("#callBackForm")[0].reset();
                        var targetCus = cusMap[cusId];
                        if (targetCus) {
                            $("#ca_cusname").val(targetCus.cusname);
                            $("#ca_cusId").val(targetCus.id);
                        }
                    },
                    buttons: {
                        "记录": function (e) {
                            e.preventDefault();
                            callBackCus(false, function (data) {
                                $("#dialog-callBack-form").dialog("close");
                            }, function (data) {
                                showMessage("“补充回访记录” 或 “关闭”", data.msg, false);
                            })
                        },
                        "取消": function () {
                            $("#dialog-callBack-form").dialog("close");
                        }
                    }
                });
            });
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

        function callBackCus(isCreate, successCallback, failCallback) {
            $.ajax({
                url: "/callBack/addCallBack.json",
                data: $("#callBackForm").serializeArray(),
                type: 'POST',
                success: function (result) {
                    if (result.ret) {
                        if (successCallback) {
                            loadCusList();
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
    });
</script>
</body>
</html>