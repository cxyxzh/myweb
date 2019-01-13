<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 头部区域 -->
<div id="header" style="background-color: #f2f2f2">
    <div class="headerbox">
        <div class="header_left">
            <ul>
                <c:if test="${user==null}">
                    <li>您好，欢迎来到JSPGOU商城！<a class="nav-login" href="#" >请登录</a></li>
                    <li class="regi"><a href="${pageContext.request.contextPath}/reg">免费注册</a></li>
                    <li><a href="#">找回密码</a></li>
                </c:if>
                <c:if test="${user!=null}">
                    <li>您好<font color="red">${user.username}</font>，欢迎来到JSPGOU商城！<a href="${pageContext.request.contextPath}/exit">注销</a></li>
                </c:if>
            </ul>
        </div>
        <div class="header_right">
            <ul>
                <li><a href="/shopMember/index.jspx" target="_self">个人中心</a></li>
                <li class="carticon"><a href="/cart/shopping_cart.jspx">购物车</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- 头部区域 -->
<!-- 搜索栏 -->
<div style="background:white;">
    <div class="search" style="width:1200px;margin:0 auto;">
        <div class="logo">
            <a href="http://dzd.jeecms.com"></a>
        </div>

        <!--搜索栏-->
        <div class="searchbox">
            <div class="searchcon indexsearch">

                    <input name="q" id="q" <c:if test="${pageVO.search!=null}">value="${pageVO.search}"</c:if> <c:if test="${pageVO.search==null}">value="请输入关键词" </c:if>type="text"
                           onfocus="if(this.value=='请输入关键词')this.value=''"
                           onblur="if(this.value=='')this.value='请输入关键词'" class="searchtxt indexinp" placeholder="请输入关键词">
                    <input type="button" class="searchbtn" onclick="menuSearch()" value="搜 索">

            </div>


        </div>
        <!--搜索栏-->

        <!-- 购物车 -->
        <div class="mycart">
            <a href="#" class="carticon">我的购物车</a>
            <span>0</span>
            <div class="cartitem cartitemnone">
                <img src="${pageContext.request.contextPath}/static/img/cartnone.png" alt="">
                <span>购物车中还没有商品，赶紧选购吧！</span>
            </div>

            <!-- 购物车 -->
        </div>
    </div>	<!-- <div id="indexbg"></div> -->
    <div id="content" style="margin-bottom: 0px;background-color: white">
        <div class="contentbox">
            <div class="myclearfix"></div>
            <div class="detail" style="height: 0px">
                <div class="topnav">
                    <p><a href="#" id="pro_category">商品分类</a><i></i></p>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/index">首页</a></li>
                        <li><a href="/gift.jspx">礼品</a></li>
                        <li><a href="/hotSaleList.jspx">预售</a></li>
                    </ul>
                    <div class="rubtic">
                        <a href="/coupon/platformCoupon.jspx" target="_blank"><img src="/r/gou/pc/newdzd/images/rubtic.png" alt=""></a>
                    </div>
                </div>
                <div class="navcontent" style="position: absolute;z-index: 1">
                    <div class="leftnav" style="display: none">
                        <ul class="leftfirst">
                            <c:forEach items="${myTree.child }" var="ic">
                                <li id="category_${ic.node.id}" style="padding-top: 1px;padding-bottom: 1px"><a href="${pageContext.request.contextPath}/item/getitembycid?cid=${ic.node.id}">${ic.node.name}</a></li>
                            </c:forEach>

                        </ul>
                        <div class="leftnavhide">
                            <ul class="hidenav">
                                <c:forEach items="${myTree.child}" var="level_1">
                                    <li id="info_category_${level_1.node.id}">
                                        <c:forEach items="${level_1.child}" var="level_2">
                                            <div class="item ">

                                                <span><a target="_blank" href="${pageContext.request.contextPath}/item/getitembycid?cid=${level_2.node.id}">${level_2.node.name}></a></span>
                                                <ul>
                                                    <c:forEach items="${level_2.child}" var="level_3">
                                                        <li><a target="_blank" href="${pageContext.request.contextPath}/item/getitembycid?cid=${level_3.node.id}">${level_3.node.name}</a></li>
                                                    </c:forEach>
                                                </ul>

                                            </div>

                                        </c:forEach>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="login-form register-box login-box" style="padding-bottom: 0;padding-top: 0">

    <a href="javascript:;" title="关闭" class="login-close close" style="position: absolute;right: 0px;color: black">×</a>


    <div class="register-nav" style="margin-top: 25px">
        <span>会员登录</span><div class="register-login">没有账号，<a class="tc" href="${pageContext.request.contextPath}/reg">立即注册 ></a></div>
    </div>

    <form id="jvForm" action="#" method="post">
        <div class="inf-message" style="height: 40px;line-height: 40px;color: red">
            <span id="lg_msg"> </span>
        </div>
        <div class="username-con" style="margin-top: 0"><i></i><input id="username" name="username" class="required login-input" type="text" placeholder="用户名"></div>
        <div class="password-con"><i></i><input id="password" name="password" class="required password-input" type="password" placeholder="密码"></div>
        <div class="login-rem clearfix">
            <div class="next-day"><input type="checkbox" class="login-checkbox" value="true" name="isRemember">下次自动登录</div>
            <a href="/member/forgot_password.jspx">忘记密码</a>
        </div>
        <input type="button" class="login-btn" id="lgbt" value="登 录">

    </form>

</div>
<div class="login-form-mask"></div>
<script>
    $(".mycart").mouseover(function(){
        $(".mycart .cartitem").show();
        $(".mycart").css("border","1px solid #fff");
        $(".mycart").css("box-shadow","0 -1px 2px #eaeaea");
    })
    $(".mycart").mouseout(function(){
        $(".mycart .cartitem").hide();
        $(".mycart").css("border","1px solid #d8d8d8");
        $(".mycart").css("box-shadow","none");
    })

</script>
