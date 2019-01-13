<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>

    <title>我的商城 | 内容管理</title>
    <jsp:include page="../includes/header.jsp"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/plugins/treeTable/themes/vsStyle/treeTable.css"/>

</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

    <jsp:include page="../includes/nav.jsp"/>
    <jsp:include page="../includes/menu.jsp"/>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                内容分类
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">分类列表</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">

            <c:if test="${baseResult.status==200}">
                <div class="row">
                    <div class="box-body">
                        <div class="alert alert-${baseResult.status==200?"success":"danger"} alert-dismissible">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${baseResult.message}
                        </div>
                    </div>
                </div>
            </c:if>


            <!-- Small boxes (Stat box) -->
            <!-- /.row -->
            <div class="row">
                <div class="col-xs-12">
                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">分类列表</h3>



                        </div>
                        <div class="row">
                            <div class="col-sm-12" style="padding-left: 25px">
                                <a href="${pageContext.request.contextPath}/admin/item/form" type="button" class="btn btn-sm btn-default"><i
                                        class="fa fa-plus"></i> 新增</a>&nbsp;&nbsp;
                                <a type="button" onclick="deleteItem()" class="btn btn-sm btn-default"><i class="fa fa-trash"></i> 删除</a>&nbsp;&nbsp;
                                <a type="button" class="btn btn-sm btn-default"><i class="fa fa-download"></i> 导入</a>&nbsp;&nbsp;
                                <a type="button" class="btn btn-sm btn-default"><i class="fa fa-upload"></i> 导出</a>


                            </div>

                        </div>
                        <!-- /.box-header -->

                        <div class="box-body table-responsive no-padding">
                            <table id="treeTable" class="table table-hover">
                                <thead>
                                <tr>

                                    <th>ID</th>
                                    <th>名称</th>
                                    <th>排序</th>
                                    <th>管理</th>

                                </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${itemcats}" var="itemcat">
                                        <tr id="${itemcat.id}" pId="${itemcat.parentItemCat.id}">
                                            <td>${itemcat.id}</td>
                                            <td>${itemcat.name}</td>
                                            <td>${itemcat.sortOrder}</td>
                                            <td>
                                                <a type="button" href="${pageContext.request.contextPath}/admin/item/form?id=${itemcat.id}" class="btn btn-sm btn-primary"><i class="fa fa-edit"></i>编辑</a>
                                                <a type="button" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i>删除</a>
                                                <button type="button" class="btn btn-sm btn-default"><i class="fa fa-plus"></i>新建一下级分类</button>
                                            </td>
                                        </tr>


                                    </c:forEach>
                                </tbody>


                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
            </div>
            <!-- /.row (main row) -->

        </section>
        <!-- /.content -->
    </div>
    <jsp:include page="../includes/copyright.jsp"/>


    <!-- Add the sidebar's background. This div must be placed
         immediately after the control sidebar -->
    <div class="control-sidebar-bg"></div>
</div>
<!-- ./wrapper -->
<!--modal-->
<div class="modal fade" id="modal-default">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">友情提醒</h4>
            </div>
            <div class="modal-body">
                <p id="model-message"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                <button type="button" onclick="btnModalClick()" class="btn btn-primary">确定</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!--/.modal-->


<jsp:include page="../includes/footer.jsp"/>


<script src="/static/assets/plugins/treeTable/jquery.treeTable.js"></script>
<script>


    function icheckfun() {
        //iCheck for checkbox and radio inputs
        $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
            checkboxClass: 'icheckbox_minimal-blue',
            radioClass: 'iradio_minimal-blue'
        })

        //全选/全不选
        _checkboxMaster = $(".checkbox-master");
        _checkbox = $("tbody").find("[type='checkbox']").not("[disabled]");
        _checkboxMaster.on("ifClicked", function (e) {
            // 当前状态已选中，点击后应取消选择
            if (e.target.checked) {
                _checkbox.iCheck("uncheck");
            }

            // 当前状态未选中，点击后应全选
            else {
                _checkbox.iCheck("check");
            }
        });
    }


    function deleteItem() {
        var _idArray = new Array();
        _checkbox.each(function () {
            //判断当前复选框有没有被选中
            var delFlag = $(this).is(":checked");
            if (delFlag) {
                _idArray.push($(this).attr("id"));
            }
        })
        if (_idArray.length == 0) {//弹出莫泰框
            $("#model-message").html("请至少选中一个");
            //弹出
            $("#modal-default").modal("show");

        } else {
            //ajax
            $.ajax({
                "url": "/user/deletemulti",
                "type": "GET",
                "data": {"ids": _idArray.toString()},
                "dataType": "JSON",
                "success": function (data) {
                    //BaseResult  : status   message
                    //更新页面
                    window.location.reload();

                    alert(data.message);

                }


            });
        }
    }

    function btnModalClick() {
        //隐藏
        $("#modal-default").modal("hide");
    }



    function showDetail(id){
        $.ajax({
            "url":"/user/detail?id="+id,
            "type":"GET",
            "dataType":"HTML",
            "success":function(data){
                $("#modal-user-detail").html(data);
                $("#modal-user").modal("show");
            }

        });


    }


    var option = {
        expandLevel : 2,
        column:1
    };
    $('#treeTable').treeTable(option);

</script>

</body>
</html>
