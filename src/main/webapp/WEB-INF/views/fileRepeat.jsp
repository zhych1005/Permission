<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传的文件不合法</title>
    <jsp:include page="/common/backend_common.jsp"/>
</head>
<body class="no-skin" youdao="bind" style="background: white">
<div class="main-content-inner">
    <div class="page-content">
        <!-- /.ace-settings-container -->

        <div class="row">
            <div class="col-xs-12">
                <!-- PAGE CONTENT BEGINS -->

                <div class="error-container">
                    <div class="well">
                        <h1 class="grey lighter smaller">
                            <span class="blue bigger-125">
                                <i class="ace-icon fa fa-random"></i>
                                系统中存在同名文件
                            </span>
                        </h1>

                        <div class="space"></div>
                        <div>
                            <h4 class="lighter smaller">可以尝试以下:</h4>
                            <ul class="list-unstyled spaced inline bigger-110 margin-15">
                                <li>
                                    <i class="ace-icon fa fa-hand-o-right blue"></i>
                                    修改文件名后再上传
                                </li>

                                <li>
                                    <i class="ace-icon fa fa-hand-o-right blue"></i>
                                    先删除系统中的同名文件再上传！
                                </li>
                            </ul>
                        </div>

                        <hr>
                        <div class="space"></div>

                        <div class="center">
                            <a href="javascript:history.back()" class="btn btn-grey">
                                <i class="ace-icon fa fa-arrow-left"></i>
                                继续上传，点击这里！
                            </a>

                            <%--<a href="#" class="btn btn-primary">
                                <i class="ace-icon fa fa-tachometer"></i>
                                Dashboard
                            </a>--%>
                        </div>
                    </div>
                </div>
                <!-- PAGE CONTENT ENDS -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div><!-- /.page-content -->
</div>
</body>
</html>
