<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <link rel="icon" href="/img/pic.ico" type="image/x-icon"/>
    <title>今朝地产顾问</title>
    <meta name="description" content="top menu &amp; navigation"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="/font-awesome/4.5.0/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="/css/fonts.googleapis.com.css"/>
    <link rel="stylesheet" href="/assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style"/>
    <link rel="stylesheet" href="/assets/css/ace-skins.min.css"/>
    <link rel="stylesheet" href="/assets/css/ace-rtl.min.css"/>
    <script src="/assets/js/ace-extra.min.js"></script>
</head>

<body class="no-skin">
<div id="navbar" class="navbar navbar-default">
    <div class="navbar-container">
        <div class="navbar-header pull-left">
            <a href="#" class="navbar-brand">
                <small>
                    <i class="fa fa-users"></i>
                    今朝地产&nbsp;&nbsp;—&nbsp;&nbsp;客户管理系统
                </small>
            </a>
        </div>

        <div class="navbar-buttons navbar-header pull-right  collapse navbar-collapse" role="navigation">
            <ul class="nav ace-nav">
                <li class="light-blue dropdown-modal user-min">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">Welcome，${user.username}
                        <span class="user-info">
                            控制台
                        </span>
                        <i class="ace-icon fa fa-caret-down"></i>
                    </a>

                    <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="/chKey.page">
                                <i class="ace-icon fa fa-lock ch-key"></i>
                                密码修改
                            </a>
                        </li>

                        <%--<li>
                            <a href="">
                                <i class="ace-icon fa fa-user"></i>
                                详情
                            </a>
                        </li>--%>
                        <%--<li class="divider"></li>--%>

                        <li>
                            <a href="/logout.page">
                                <i class="ace-icon fa fa-power-off"></i>
                                登出
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>

<div class="main-container" id="main-container">

    <script type="text/javascript">
        try {
            ace.settings.check('main-container', 'fixed')
        } catch (e) {
        }
    </script>

    <div id="sidebar" class="sidebar responsive">
        <script type="text/javascript">
            try {
                ace.settings.check('sidebar', 'fixed')
            } catch (e) {
            }
        </script>


        <ul class="nav nav-list">
            <li class="active">
                <a class="popstyle" href="/admin/totalData.page" target="_blank">&nbsp;
                    <i class="ace-icon fa fa-desktop green bigger-140"></i>
                    <span class="menu-text"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;首页 </span>
                </a>
                <b class="arrow"></b>
            </li>
            <li class="">
                <a href="#" class="dropdown-toggle">&nbsp;
                    <i class="ace-icon fa fa-key green bigger-150"></i>
                    <span class="menu-text"> &nbsp;&nbsp;权限管理 </span>
                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">
                    <li class="">
                        <a class="popstyle" href="/sys/dept/dept.page" >
                            <i class="menu-icon fa fa-caret-right"></i>
                            用户管理
                        </a>
                        <b class="arrow"></b>
                    </li>
                    <li class="">
                        <a class="popstyle" href="/sys/role/role.page" >
                            <i class="menu-icon fa fa-caret-right"></i>
                            角色管理
                        </a>
                        <b class="arrow"></b>
                    </li>
                    <li class="">
                        <a class="popstyle" href="/sys/aclModule/acl.page" >
                            <i class="menu-icon fa fa-caret-right"></i>
                            权限管理
                        </a>
                        <b class="arrow"></b>
                    </li>
                    <li class="">
                        <a class="popstyle" href="/sys/log/log.page" >
                            <i class="menu-icon fa fa-caret-right"></i>
                            权限更新记录
                        </a>
                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>

            <li class="">
                <a href="#" class="dropdown-toggle">&nbsp;
                    <i class="ace-icon glyphicon glyphicon-user green bigger-130"></i>
                    <span class="menu-text"> &nbsp;&nbsp;&nbsp;来访客户 </span>
                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">
                    <li class="">
                        <a class="popstyle" href="/user/form/addForm.page" >
                            <i class="menu-icon fa fa-caret-right"></i>
                            来访客户登记
                        </a>
                        <b class="arrow"></b>
                    </li>
                    <li class="">
                        <a class="popstyle" href="/user/form/dayForm.page" >
                            <i class="menu-icon fa fa-caret-right"></i>
                            当日来访统计
                        </a>
                        <b class="arrow"></b>
                    </li>
                    <li class="">
                        <a class="popstyle" href="/user/form/monForm.page" >
                            <i class="menu-icon fa fa-caret-right"></i>
                            月度来访统计
                        </a>
                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>

            <li class="">
                <a href="#" class="dropdown-toggle">&nbsp;
                    <i class="ace-icon fa fa-phone green bigger-150"></i>
                    <span class="menu-text">&nbsp;&nbsp;&nbsp;电访客户</span>
                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">
                    <li class="">
                        <a class="popstyle" href="/cusTel/form/addTelForm.page" >
                            <i class="menu-icon fa fa-caret-right"></i>
                            电访客户登记
                        </a>
                        <b class="arrow"></b>
                    </li>
                    <li class="">
                        <a class="popstyle" href="/cusTel/form/todayTelForm.page" >
                            <i class="menu-icon fa fa-caret-right"></i>
                            当日电访统计
                        </a>
                        <b class="arrow"></b>
                    </li>
                    <li class="">
                        <a class="popstyle" href="/cusTel/form/monthTelForm.page" >
                            <i class="menu-icon fa fa-caret-right"></i>
                            月度电访统计
                        </a>
                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>
            <li class="">
                <a href="#" class="dropdown-toggle">&nbsp;
                    <i class="ace-icon fa fa-users green bigger-150"></i>
                    <span class="menu-text">&nbsp;数据汇总</span>
                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">
                    <li class="">
                        <a class="popstyle" href="/user/form/sumTodayForm.page" >
                            <i class="menu-icon fa fa-caret-right"></i>
                            当日来访合计
                        </a>
                        <b class="arrow"></b>
                    </li>
                    <li class="">
                        <a class="popstyle" href="/cusTel/form/sumTodayTelForm.page" >
                            <i class="menu-icon fa fa-caret-right"></i>
                            当日电访合计
                        </a>
                        <b class="arrow"></b>
                    </li>
                    <li class="">
                        <a class="popstyle" href="/user/form/sumMonthForm.page" >
                            <i class="menu-icon fa fa-caret-right"></i>
                            当月来访合计
                        </a>
                        <b class="arrow"></b>
                    </li>
                    <li class="">
                        <a class="popstyle" href="/cusTel/form/sumMonthTelForm.page" >
                            <i class="menu-icon fa fa-caret-right"></i>
                            当月电访合计
                        </a>
                        <b class="arrow"></b>
                    </li>
                    <li class="">
                        <a class="popstyle" href="/user/form/findAllCusPage.page" >
                            <i class="menu-icon fa fa-caret-right"></i>
                            来访客户历史
                        </a>
                        <b class="arrow"></b>
                    </li>
                    <li class="">
                        <a class="popstyle" href="/cusTel/form/findAllTelCusPage.page" >
                            <i class="menu-icon fa fa-caret-right"></i>
                            电访客户历史
                        </a>
                        <b class="arrow"></b>
                    </li>
                    <li class="">
                        <a class="popstyle" href="/admin/first.page" >
                            <i class="menu-icon fa fa-caret-right"></i>
                            图表展示
                        </a>
                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>

            <li class="">
                <a href="#" class="dropdown-toggle">&nbsp;
                    <i class="ace-icon fa fa-exchange green bigger-170"></i>
                    <span class="menu-text">&nbsp;公共池</span>
                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">
                    <li class="">
                        <a class="popstyle" href="/common/visitCommonPool.page" target="_blank">
                            <i class="menu-icon fa fa-caret-right"></i>
                            来访客户
                        </a>
                        <b class="arrow"></b>
                    </li>
                    <li class="">
                        <a class="popstyle" href="/common/telCommonPool.page" target="_blank">
                            <i class="menu-icon fa fa-caret-right"></i>
                            电访客户
                        </a>
                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>

            <li class="">
                <a href="#" class="dropdown-toggle">&nbsp;
                    <i class="ace-icon fa fa-folder-open green bigger-170"></i>
                    <span class="menu-text">&nbsp;&nbsp;文件</span>
                    <b class="arrow fa fa-angle-down"></b>
                </a>

                <b class="arrow"></b>

                <ul class="submenu">
                    <li class="">
                        <a class="popstyle" href="/file/consult.page" target="_blank">
                            <i class="menu-icon fa fa-caret-right"></i>
                            查阅
                        </a>
                        <b class="arrow"></b>
                    </li>
                    <li class="">
                        <a class="popstyle" href="/file/addFile.page" target="_blank">
                            <i class="menu-icon fa fa-caret-right"></i>
                            文件管理
                        </a>
                        <b class="arrow"></b>
                    </li>
                </ul>
            </li>

        </ul>
        <!-- /.nav-list -->

        <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse">
            <i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left"
               data-icon2="ace-icon fa fa-angle-double-right"></i>
        </div>

        <script type="text/javascript">
            try {
                ace.settings.check('sidebar', 'collapsed')
            } catch (e) {
            }
        </script>
    </div>

    <%--设置默认打开页--%>
    <div class="main-content" style="display: none;" id="gw">
        <iframe id="innerFrame" src="/admin/totalData.page" width="100%" style="min-height: 890px;"></iframe>
    </div>

    <div class="main-content" style="display: none;" id="ld">
        <iframe id="innerFrame1" src="/admin/first.page" width="100%" style="min-height: 890px;"></iframe>
    </div>
    <!-- /.main-content -->

    <%--<a href="index.html" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse display">--%>
    <%--<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>--%>
    <%--</a>--%>
</div>

<script src="/assets/js/jquery-2.1.0.min.js"></script>
<script src="/assets/js/bootstrap.min.js"></script>
<script src="/assets/js/ace-elements.min.js"></script>
<script src="/assets/js/ace.min.js"></script>
<script type="application/javascript">

    $(document).ready(function () {
        $(".popstyle").removeAttr("target");
        $(".popstyle").each(function () {
            var $this = $(this);
            tmp = $this.attr("href");
            $this.attr("data", tmp);
            $this.attr("href", "javascript:void(0)");
        });

        $(".popstyle").click(function () {
            var $this = $(this);
            $("iframe").attr(
                'src',
                $this.attr("data")
            );
        });

        $(".direct").click(function () {
            var $this = $(this);
            $("iframe").attr(
                'src',
                $this.attr("data-value")
            );
        });
    });

    $(".ch-key").click(function () {
        $("#dialog-key-form").dialog({
            modal: true,
            title: "新增用户",
            open: function (event, ui) {
                $(".ui-dialog-titlebar-close", $(this).parent()).hide();
                optionStr = "";
                $("#keyForm")[0].reset();
            },
            buttons: {
                "修改": function (e) {
                    addCus(true, function (data) {
                        $("#dialog-key-form").dialog("close");
                    }, function (data) {
                        showMessage("提交的信息有误，请检查！", data.msg, false);
                    })
                },
                "取消": function () {
                    $("#dialog-key-form").dialog("close");
                }
            }
        });
    });

    var s1 = document.getElementById('gw');
    var s2 = document.getElementById('ld');
    var deptId = ${user.deptId};
    console.log(deptId);
    if (deptId < 7) {
        s1.style.display = '';
        s2.style.display = 'none';
    } else {
        s1.style.display = 'none';
        s2.style.display = '';
    }

</script>
</body>
</html>