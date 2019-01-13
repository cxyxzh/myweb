<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<div class="row  form-horizontal">
    <div class="box-body">
        <div class="form-group">
            <label class="col-sm-2 control-label">姓名</label>

            <div class="col-sm-10">
                ${user.username}
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">电话</label>

            <div class="col-sm-10">
                ${user.phone}
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">邮箱</label>

            <div class="col-sm-10">
                ${user.email}
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">创建时间</label>

            <div class="col-sm-10">
                ${user.created}
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">更新时间</label>

            <div class="col-sm-10">
                ${user.updated}
            </div>
        </div>

    </div>

</div>


