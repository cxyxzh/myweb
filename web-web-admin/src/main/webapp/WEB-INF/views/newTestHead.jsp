<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/1/4
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="modal fade modal-vertical-centered" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" style="display: none;">
    <div class="modal-dialog" role="document" style="width: 400px">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="exampleModalLabel">会员登录</h4>
            </div>
            <form id="form1" action="${pageContext.request.contextPath}/login" method="post">
                <div class="modal-body">

                    <div class="form-group" style="width: 80%;margin-top: 35px;margin-left: 10%">
                        <span style="color: red;display: none" id="lg-msg"></span>
                        <input type="text" class="form-control" id="username" name="username" placeholder="请输入用户名">
                    </div>
                    <div class="form-group" style="width: 80%;margin-top: 35px;margin-left: 10%">

                        <input type="password" class="form-control" name="password" id="password" placeholder="请输入密码">
                    </div>
                    <div  class="form-group" style="width: 80%;margin-top: 35px;margin-left: 10%">
                        <input type="radio" name="isRemember"/>
                    </div>

                </div>
                <div class="modal-footer" style="border-top: 0px">
                    <button type="button" class="btn btn-default" id="mylgbtn" >登录</button>
                    <input type="hidden" data-dismiss="modal" id="lghd"/>
                    <button type="button" class="btn btn-primary" style="margin-right: 10%;">注册</button>
                </div>
            </form>
        </div>
    </div>
</div>

