
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>首页</title>
    <meta name="description" content="">
    <meta name="keywords" content="">

    <link href="${pageContext.request.contextPath}/static/css/shop.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/login.css" rel="stylesheet">


    <!-- Bootstrap -->



    <script src="${pageContext.request.contextPath}/static/js/jquery-1.4.2.min.js"></script>



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


    </style>
</head>
<body style="background-color: white">
<script type="text/javascript" src="http://qzonestyle.gtimg.cn/qzone/openapi/qc_loader.js#appId=1111" charset="utf-8"></script>
<script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js?appkey=1111" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="http://mat1.gtimg.com/app/openjs/openjs.js"></script>
<script src="${pageContext.request.contextPath}/static/js/front.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/static/css/memberhead.css" rel="stylesheet">
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

                    <input name="q" id="q" value="请输入关键词" type="text"
                           onfocus="if(this.value=='请输入关键词')this.value=''"
                           onblur="if(this.value=='')this.value='请输入关键词'" class="searchtxt indexinp" placeholder="请输入关键词">
                    <input type="button" class="searchbtn" onclick="menuSearch()" value="搜 索">

            </div>


        </div>
        <!--搜索栏-->

        <!-- 购物车 -->
        <div class="mycart">
            <a href="#" class="carticon">我的购物车</a>
            <span>
						0
					</span>
            <div class="cartitem cartitemnone">
                <img src="${pageContext.request.contextPath}/static/img/cartnone.png" alt="">
                <span>购物车中还没有商品，赶紧选购吧！</span>
            </div>
            <div class="cartitem">
                <p>最新加入的商品</p>
                <ul>
                    <li>
                        <img src="/u/201801/291433092bxf.jpg" alt="">
                        <div class="itemtxt">
                            <p>九阳（Joyoung） 原汁机JYZ-V907 大口径 赠</p>
                            <span>￥
													599
												</span>
                            <span>1件</span>
                            <span class="shopdelete" onclick="ajaxDeleteCartItem('',143);">删除</span>
                        </div>
                    </li>

                </ul>
                <p class="allnum">共
                    <span>
									6
								</span>件商品</p>
                <button class="gocart" onclick="window.location.href='/cart/shopping_cart.jspx'">去购物车</button>
        </div>
        <!-- 购物车 -->
    </div>
</div>	<!-- <div id="indexbg"></div> -->
<div id="content" style="background-color: white">
    <div class="contentbox">
        <div class="myclearfix"></div>
        <div class="detail">
            <div class="topnav">
                <p><a href="/allProductCategory.jspx">商品分类</a><i></i></p>
                <ul>
                    <li><a href="http://dzd.jeecms.com">首页</a></li>
                    <li><a href="/gift.jspx">礼品</a></li>
                    <li><a href="/hotSaleList.jspx">预售</a></li>
                </ul>
                <div class="rubtic">
                    <a href="/coupon/platformCoupon.jspx" target="_blank"><img src="/r/gou/pc/newdzd/images/rubtic.png" alt=""></a>
                </div>
            </div>
            <div class="navcontent">
                <div class="leftnav">
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


                <div class="cenbanner">
                    <ul class="ban_img">
                        <li style="display: list-item" id="lb1"><a href="http://dzd.jeecms.com/homeAppliances/index.jhtml" target="_blank" ><img style="width: 100%" src="${pageContext.request.contextPath}/static/img/1.jpg" alt=""></a></li>
                        <li id="lb2"><a href="http://dzd.jeecms.com/homefurniture/index.jhtml" target="_blank"><img src="${pageContext.request.contextPath}/static/img/2.jpg" alt=""></a></li>
                        <li id="lb3"><a href="http://dzd.jeecms.com/hydrating/index.jhtml" target="_blank"><img src="${pageContext.request.contextPath}/static/img/3.jpg" alt=""></a></li>
                    </ul>
                    <div class="ban_guide">
                        <ul>
                            <li id="btlb1" class="curban"></li>
                            <li id="btlb2"></li>
                            <li id="btlb3"></li>

                        </ul>
                    </div>
                </div>
                <div class="rightnav">
                    <div class="loginbox">
                        <img src="${pageContext.request.contextPath}/static/img/defavatar.png" alt="">
                        <c:if test="${user==null}">
                            <p>Hi，欢迎来到商城</p>
                            <button class="log"><a class="nav-login" href="#">登录</a></button>
                            <button class="reg"><a href="${pageContext.request.contextPath}/reg">注册</a></button>
                        </c:if>
                        <c:if test="${user!=null}">
                            <p>Hi,<font color="red">${user.username}</font>，欢迎来到商城</p>
                            <button class="log"><a href="/register.jspx">个人中心</a></button>
                            <button class="reg"><a href="${pageContext.request.contextPath}/exit">注销</a></button>
                        </c:if>
                    </div>
                    <div class="hotnews">
                        <div class="hottitle">
                            <ul>
                                <li class="hotcur"><a href="javascript:;">热门活动</a></li>

                            </ul>
                        </div>
                        <ul class="actitem">
                            <li><a href="/remenhuodong/1.jhtml">海泰克初秋大放假2.9折起噢</a></li>
                            <li><a href="/remenhuodong/2.jhtml">耐克新品男女款POLO衫4折起</a></li>
                            <li><a href="/remenhuodong/3.jhtml">乐卡克2011秋季新品5折起</a></li>
                            <li><a href="/remenhuodong/4.jhtml">酷爽夏日，惊喜好礼大馈赠</a></li>
                        </ul>

                    </div>
                    <a href="/registerStore.jspx" target="_self"><img src="/r/gou/pc/newdzd/images/bshop.jpg" alt=""></a>
                </div>
            </div>

        </div>
        <div class="reco">
            <!--今日推荐开始-->
            <div class="recoL">
                <a href="#"><img  width="100%" height="100%" src="${pageContext.request.contextPath}/static/img/yundong.jpg" alt=""></a>
                <!--今日推荐结束-->
            </div>
            <div class="recoC">
                <ul>
                    <li>
                        <a href="#">
                            <div class="recotxt">
                                <p>电脑专区</p>
                                <span>中端吃鸡3000起</span>
                                <button>3000+元</button>
                            </div>
                            <div class="recoimg">
                                <img width="100%" src="${pageContext.request.contextPath}/static/img/diannao.jpg" alt="">
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="recotxt">
                                <p>特产中国</p>
                                <span>全国特产仍你挑</span>
                                <button>150+元</button>
                            </div>
                            <div class="recoimg">
                                <img  width="100%" src="${pageContext.request.contextPath}/static/img/techan.jpg" alt="">
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="recotxt">
                                <p>家用电器</p>
                                <span>全款家用小电器</span>
                                <button>200+元</button>
                            </div>
                            <div class="recoimg">
                                <img  width="100%" src="${pageContext.request.contextPath}/static/img/dianqi.jpg" alt="">
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="recotxt">
                                <p>数码产品</p>
                                <span>限量发售智能设备</span>
                                <button>2000+</button>
                            </div>
                            <div class="recoimg">
                                <img  width="100%" src="${pageContext.request.contextPath}/static/img/shuma.jpg" alt="">
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#">
                            <div class="recotxt">
                                <p>时尚潮流</p>
                                <span>秋冬新品全场七折</span>
                                <button style="background-color: #81e06c">-30%</button>
                            </div>
                            <div class="recoimg">
                                <img  width="100%" src="${pageContext.request.contextPath}/static/img/shishang.jpg" alt="">
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="/jinkouhaigou/index.jhtml">
                            <div class="recotxt">
                                <p>母婴用品</p>
                                <span>安全健康的母婴用品</span>
                                <button>100+元</button>
                            </div>
                            <div class="recoimg">
                                <img  width="100%" src="${pageContext.request.contextPath}/static/img/muying.jpg" alt="">
                            </div>
                        </a>
                    </li>
                </ul>
            </div>
            <div class="recoR">
                <a href="#">
                    <div class="recoRtxt">
                        <button>优雅清新服装</button>
                        <p class="tits">2019新品热卖中袖上衣</p>
                        <p class="titb">来一场优雅的邂逅</p>
                    </div>
                    <div class="recoRbox">
                        <img height="100%" width="100%" src="${pageContext.request.contextPath}/static/img/yifu.jpg" alt="">
                    </div>
                </a>
            </div>
        </div>
        <!-- 中间图片栏 -->

    </div>
</div>


</div>

<div class="login-form register-box login-box" style="padding-bottom: 0;padding-top: 0">

        <a href="javascript:;" title="关闭" class="login-close close" style="position: absolute;right: 0px;color: black">×</a>


        <div class="register-nav" style="margin-top: 25px">
            <span>会员登录</span><div class="register-login">没有账号，<a class="tc" href="/register.jspx">立即注册 ></a></div>
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
    var int=self.setInterval("lb()",5000);
    var array_lb=new Array("#lb1","#lb2","#lb3");
    var array_lbbt=new Array("#btlb1","#btlb2","#btlb3");
    var i=0;
    $(".ban_guide li").click(function () {
        i=parseInt($(this).attr("id").substring(4))-1;
        $(".ban_img li").css("display","none");
        $(".ban_guide li").attr("class","");
        $(array_lbbt[i]).attr("class","curban");
        $(array_lb[i]).css("display","list-item");
    })
    function lb(){
       i++;
       if(i==3){
           i=0;
       }
       $(".ban_img li").css("display","none");
       $(".ban_guide li").attr("class","");
       $(array_lbbt[i]).attr("class","curban");
       $(array_lb[i]).css("display","list-item");

    }
    $(".leftfirst li").mouseover(function (){

        $(".leftfirst li").attr("class","");
        $(this).attr("class","navred");
        $(".leftnavhide").show();
        liid=$(this).attr("id");
        id="#info_"+liid;
        $(id).css("display","list-item");



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
</body>
</html>