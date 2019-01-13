<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/1/4
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="x-ua-compatible" content="ie=7" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户注册</title>
    <link href="${pageContext.request.contextPath}/static/css/main.css" type="text/css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/static/css/front.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/static/css/shop.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/login.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.4.2.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/front.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/static/js/memberhead.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/memberhead.css" rel="stylesheet">

    <style>
        .item{
            overflow: hidden;
        }
        .login-form-mask {
            z-index: 9998;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: #000;
            opacity: 0.4;
            filter: alpha(opacity=40);
            display: none
        }
        .login-form {
            z-index: 9999;
            position: fixed;
            top: 40%;
            left: 55%;

            width: 320px;
            height: 300px;
            margin: -180px 0 0 -330px;
            border-radius: 5px;
            border: solid 2px #666;
            background-color: #fff;
            display: none;
            box-shadow: 0 0 10px #666;
        }
        .login-close {
            margin-right: 15px;
        }
        .loginInput{ width:325px; height:35px; padding:5px; border:1px solid #d8d8d8; font-family:微软雅黑; color:#adadad;outline-width:medium; outline-style:none;}
        .codeInput{ width:180px; height:35px; padding:5px; border:1px solid #d8d8d8; font-family:微软雅黑; color:#adadad;outline-width:medium; outline-style:none;}
    </style>
</head>

<body>
<jsp:include page="../userincludes/head.jsp"></jsp:include>
<div style="width:1020px; margin:auto;">

    <div class="clear20"></div>
    <div style="margin:20px auto; width:997px; border:1px solid #eaeaea;">
        <form id="reg_form" action="#" method="post">
            <table width="900" border="0" align="center" cellpadding="0" cellspacing="2" style="margin:auto; color:#808080;">
                <tr>
                    <td colspan="3">
                        <div class="fl" style="font-size:18px; color:#484848; font-family:微软雅黑; line-height:94px;">新用户注册</div>
                        <div class="fr" style="color:#484848; line-height:94px;">我已经注册，现在就<a href="${pageContext.request.contextPath}/test" style="color:#ff3b1b;">登陆</a></div>
                        <div style="border-bottom:1px solid #e7e7e7; clear:both; width:100%; margin-bottom:30px;"></div>
                    </td>
                </tr>
                <tr>
                    <td height="75" width="150" align="right" style="font-size:14px;">用户名：</td>
                    <td><input type="text" id="reg_username" name="username" class="loginInput"/></td>
                    <td><font color="#FF0000">*</font><span style="color:#808080;" id="usernamemsg"> 用户名由3到20位的英文字母、数字、下划线组成。</span></td>
                </tr>
                <tr>
                    <td height="75" align="right" style="font-size:14px;">Email：</td>
                    <td><input type="text" name="email" id="reg_email" class="loginInput" /></td>
                    <td><font color="#FF0000">*</font><span style="color:#808080;" id="emailmsg"> 输入有效邮箱地址并成功激活，可用此找回密码</span></td>
                </tr>
                <tr>
                    <td height="75" align="right" style="font-size:14px;">密码：</td>
                    <td><input name="password" type="password" class="loginInput" id="reg_password" /></td>
                    <td><font color="#FF0000">*</font><span style="color:#808080;" id="passwordmsg"> 6－20位字符，可由大小写英文或数字组成 </span></td>
                </tr>
                <tr>
                    <td height="75" align="right" style="font-size:14px;">确认密码：</td>
                    <td><input type="password"id="repassword" class="loginInput" /></td>
                    <td><span style="color: red" id="repasswordmsg"></span></td>
                </tr>


                <tr>
                    <td height="75" align="right">&nbsp;</td>
                    <td colspan="2"><input type="button" onclick="reg()" value="注 册" style="width:335px; height:45px; text-align:center; color:#fff; background:#ff3b1b; cursor:pointer; border:0; font-size:16px;"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div class="clear20"></div>
</div>
<link href="${pageContext.request.contextPath}/static/css/foot.css" rel="stylesheet">
<div class="clearfix"></div>
<!-- 底部区域 -->
<jsp:include page="../userincludes/foot.jsp"></jsp:include>
<script>
    $("#lgbt").click(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/login",
            type:"post",
            data:$("#jvForm").serialize(),
            success:function (data) {
                if(data.msg=="success"){
                    window.location.reload();
                }else if(data.msg=="fail"){
                    $("#lg_msg").html("用户名或密码错误");
                }
            },
            dateType:"json"
        })
    })
    //设置登录页面弹出效果
    jQuery(document).ready(function($) {
        $('.nav-login').click(function() {
            $("#lg_msg").html("");
            $('.login-form-mask').fadeIn(100);
            $('.login-form').slideDown(200);
        })
        $('.login-close').click(function() {
            $('.login-form-mask').fadeOut(100);
            $('.login-form').slideUp(200);
        })
    })
</script>

<script>
    var liid;
    var id;
    $(".leftfirst li").mouseover(function (){

        $(".leftfirst li").attr("class","");
        $(this).attr("class","navred");
        $(".leftnavhide").show();
        liid=$(this).attr("id");
        id="#info_"+liid;
        $(id).css("display","list-item");



    });

    $("#pro_category").click(function () {
        $(".leftnav").toggle();
    });

    $(".leftfirst li").mouseleave(function (){

        $(".leftnavhide").hide();
        $(".leftfirst li").attr("class","");
        liid=$(this).attr("id");
        id="#info_"+liid;
        $(id).css("display","none");


    });
    $(".leftnavhide").mouseover(function () {

        $(".leftfirst li").attr("class","");
        $(liid).attr("class","navred");
        $(".leftnavhide").show();
        $(id).css("display","list-item");
    })
    $(".leftnavhide").mouseleave(function () {
        $(".leftnavhide").hide();
        $(".leftfirst li").attr("class","");
        $(id).css("display","none");

    })

</script>

<script type="text/javascript">
    var result1,result2,result3,result4;
    var userNameReg=/^[a-zA-Z0-9_-]{3,20}$/;
    var emailReg=/^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
    var passwordReg=/^[A-Za-z0-9]{6,20}$/;
    $("#reg_username").blur(function () {
        if(!$(this).val().match(userNameReg)){
            $("#usernamemsg").css("color","red");
            $("#usernamemsg").html("用户名由3到20位的英文字母、数字、下划线组成。");
            result1=false;
        }else{

            $.ajax({
                "url":"${pageContext.request.contextPath}/rename",
                "type":"get",
                "data":{"username":$(this).val()},
                "success":function (d) {
                    if(d.status==200){
                        result1=true;
                        $("#usernamemsg").css("color","rgb(153,153,153)");
                        $("#usernamemsg").html("用户名由3到20位的英文字母、数字、下划线组成。");
                    }else{
                        result1=false;
                        $("#usernamemsg").css("color","red");
                        $("#usernamemsg").html("用户名已存在");
                    }

                },
                "dataType":"json"
            })

        }
    })
    $("#reg_email").blur(function () {
        if(!$(this).val().match(emailReg)){
            $("#emailmsg").css("color","red");
            result2=false;
        }else{
            $("#emailmsg").css("color","rgb(153,153,153)");
            result2=true;
        }
    })
    $("#reg_password").blur(function () {
        if(!$(this).val().match(passwordReg)){
            $("#passwordmsg").css("color","red");
            result3=false;
        }else{
            $("#passwordmsg").css("color","rgb(153,153,153)");
            result3=true;
        }
    })
    $("#repassword").blur(function () {
        if(!($(this).val()==$("#reg_password").val())){
            $("#repasswordmsg").css("color","red");
            $("#repasswordmsg").html("两次输入密码不一致");
            result4=false;
        }else{
            $("#repasswordmsg").html("");
            result4=true;
        }
    })
    function reg(){
        $("#reg_username").blur();
        $("#reg_email").blur();
        $("#reg_password").blur();
        $("#repassword").blur();
        if(result1&&result2&&result3&&result4){
         $.ajax({
             "url":"${pageContext.request.contextPath}/reg",
             "type":"post",
             "data":$("#reg_form").serialize(),
             "success":function (d) {
                 if(d.status==200){
                     location.href="${pageContext.request.contextPath}/index";
                 }else {
                     alert(d.message);
                 }
             },
             "dataType":"json"
         })
        }
    }
</script>
</body>
</html>