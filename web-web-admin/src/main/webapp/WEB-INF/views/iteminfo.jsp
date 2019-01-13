<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="x-ua-compatible" content="ie=7"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>商品详情</title>
    <link href="${pageContext.request.contextPath}/static/css/main.css" type="text/css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/css/front.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/static/css/shop.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/sort.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/product.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/login.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.4.2.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/memberhead.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/pinglun.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/memberhead.js"></script>

    <style>
        .item {
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

        .loginInput {
            width: 325px;
            height: 35px;
            padding: 5px;
            border: 1px solid #d8d8d8;
            font-family: 微软雅黑;
            color: #adadad;
            outline-width: medium;
            outline-style: none;
        }

        .codeInput {
            width: 180px;
            height: 35px;
            padding: 5px;
            border: 1px solid #d8d8d8;
            font-family: 微软雅黑;
            color: #adadad;
            outline-width: medium;
            outline-style: none;
        }

    </style>
</head>

<body style="background-color: white">
<jsp:include page="../userincludes/head.jsp"></jsp:include>
<div class="p_content" style="margin-top: 50px;background-color: white">
    <div class="p_contentbox">
        <div class="shopshow">
            <div class="shopbox">
                <div class="shopbox_left">
                    <div class="imgbox">
                        <div class="probox">
                            <img src="${pageContext.request.contextPath}/static/img/${ItemVO.item.image}" alt="">
                            <div class="hoverbox"></div>
                        </div>
                        <div class="showbox">
                            <img src="${pageContext.request.contextPath}/static/img/${ItemVO.item.image}"/>
                        </div>
                    </div>

                    <div class="shoppic">
                        <span class="picleft"></span>
                        <div class="picsmall">
                            <ul>
                                <li class="border2"><img src="${pageContext.request.contextPath}/static/img/${ItemVO.item.image}" alt="${ItemVO.item.title}"></li>

                            </ul>
                        </div>
                        <span class="picright"></span>
                    </div>


                </div>


                <div class="shopbox_right">
                    <p>

                        ${ItemVO.item.title}

                    </p>
                    <div class="shopprice" style="background-color: white">
                        <!--非预售商品情况-->
                        <div class="pricenum">
                            <div class="line1">
                                <!--款式商品标识影藏文本域-->
                                <input type="hidden" id="current_merchantId" value="169"/>
                                <p class="oldp">￥<span><b class="sys_item_price">${ItemVO.item.price}</b></span></p>


                            </div>
                            <div class="line2">
                                <p>累计评价<span>0</span></p>
                                <p>销量<span><b class="sys_item_saleCount">${99999-ItemVO.item.num}</b></span></p>
                            </div>
                        </div>


                        <div class="shopselect">
                            <div class="shopalert">
                                <p>请先选择您要的商品属性<i></i></p>
                            </div>
                            <ul>
                                <!--非预售商品情况-->
                                <li class="amount">
                                    <span>数量</span>
                                    <input type="number" id="product_amount" value="1"/>
                                    <a class="up">+</a>
                                    <a class="down">&nbsp;-</a>
                                    <em>件</em>
                                    <p class="stock">
                                        (库存
                                        <em>
                                            <b class="sys_item_stockCount">${ItemVO.item.num}</b>
                                        </em>
                                        件)
                                    </p>
                                    <div class="clearfix"></div>
                                </li>
                            </ul>


                            <div class="shopnum">
                                <span>商品编号</span>
                                ${ItemVO.item.id}
                            </div>
                        </div>
                    </div>

                    <button class="buy buyNow">立即购买</button>
                    <button class="add" onclick="fay()">加入购物车</button>
                    <div class="addcart">
                        <img src="${pageContext.request.contextPath}/static/img/${ItemVO.item.image}" alt="${ItemVO.item.title}" alt="">
                    </div>







                </div>

                <div class="clearfix"></div>

                <br/>
                <div class="topnav" style="text-align: center;">
                    <p style="padding: 0px"><a href="#" id="pro_category">用户评论</a><i></i></p>
                </div>
                <div style="width: 100%;height: 1013px">
                    <section class="wenku_w910">
                        <div class="doc_js"style="border:0px">

                                <div class="doc_js_list clearfix" >
                                    <label>全部评价</label>
                                    <label>好评</label>
                                    <label>差评</label>

                                </div>

                        </div>
                        <div class="wenku_item clearfix">

                                <div class="wenku_item_img"><img src="../../static/img/defavatar.png"></div>
                                <div>
                                    <div class="wt">xiaoli

                                    </div>

                                    <div class="wd">东西不错</div>
                                    <div class="wc">财富值：<span>110</span><em>2016-10-10</em></div>
                                </div>

                        </div>

                        <div class="pagenum" style="float: right">

                            <ul style="float:left;">
                                <li>1</li>
                                <li>2</li><li>3</li><li>4</li>
                                <li>2</li><li>3</li><li>4</li>

                            </ul>
                        </div>
                    </section>

                </div>
            </div>


            <div class="shoplook">

                <div class="colline"></div>
                <div class="looktitle">
                    <div class="leftline"></div>
                    <p>看了又看</p>
                    <div class="leftline"></div>
                </div>
                <div class="lookcon" id="liulan">
                   <c:forEach begin="0" end="4" var="i">
                    <ul>
                     <li><a  href="${pageContext.request.contextPath}/item/info?id=${ItemVO.recommend[i].id}&parent.id=${ItemVO.recommend[i].parent.id}"><img style="width:200px;height:200px;" src="${pageContext.request.contextPath}/static/img/${ItemVO.recommend[i].image}" alt="${ItemVO.recommend[i].title}"></a><a  href="${pageContext.request.contextPath}/item/info?id=${ItemVO.recommend[i].id}&parent.id=${ItemVO.recommend[i].parent.id}">${ItemVO.recommend[i].title}</a></li>
                     </ul>
                   </c:forEach>


                </div>
            </div>
        </div>
        <div class="clearfix"></div>

    </div>
    <div class="p_contentbox">

    </div>

</div>
<jsp:include page="../userincludes/foot.jsp"></jsp:include>
<script>
    var before=1;
    $("#jumptopage").click(function () {
        var search=$("#q").val();
        if(search=="请输入关键词")
            search="";
        var page=$("#goPs").val();
        if(page!="")
            location.href="${pageContext.request.contextPath}/item/getitembycid?draw=${pageVO.draw}&cid=${pageVO.cid}&search="+search+"&page="+page;
    })
    function draw(i) {
        var search=$("#q").val();
        if(search=="请输入关键词")
            search="";
        location.href="${pageContext.request.contextPath}/item/getitembycid?draw="+i+"&cid=${pageVO.cid}&search="+search;
    }
    function betweenPrice(){
        var startPrice=$("#startPrice").val();
        if(startPrice=="")
            startPrice=0;
        var endPrice=$("#endPrice").val();
        if(endPrice=="")
            endPrice=-1;
        location.href="${pageContext.request.contextPath}/item/getitembycid?cid=${pageVO.cid}&draw=${pageVO.draw}&startPrice="+startPrice+"&endPrice="+endPrice;
    }
    $("#goPs").bind('input propertychange',function () {
        var reg = /^[0-9]*$/;
        if($(this).val()==""){
            before=$(this).val();
        }else if(1 > parseInt($(this).val())){
            $(this).val(before);
        }else if(!($(this).val().match(reg))){
            $(this).val(before);
        }else if ($(this).val() > parseInt(${pageVO.maxPage })){
            $(this).val(${pageVO.maxPage })
        }else{
            before=$(this).val();
        }
    })
    $("#lgbt").click(function () {
        $.ajax({
            url: "${pageContext.request.contextPath}/login",
            type: "post",
            data: $("#jvForm").serialize(),
            success: function (data) {
                if (data.msg == "success") {
                    window.location.reload();
                } else if (data.msg == "fail") {
                    $("#lg_msg").html("用户名或密码错误");
                }
            },
            dateType: "json"
        })
    })
    //设置登录页面弹出效果
    jQuery(document).ready(function ($) {
        $('.nav-login').click(function () {
            $("#lg_msg").html("");
            $('.login-form-mask').fadeIn(100);
            $('.login-form').slideDown(200);
        })
        $('.login-close').click(function () {
            $('.login-form-mask').fadeOut(100);
            $('.login-form').slideUp(200);
        })
    })
    $(".mypage").click(function () {
        var id_str=$(this).attr("id");
        var id=id_str.substring(id_str.length-1);
        var search=$("#q").val();
        if(search=="请输入关键词")
            search="";
        location.href="${pageContext.request.contextPath}/item/getitembycid?draw=${pageVO.draw}&cid=${pageVO.cid}&page="+id+"&search="+search;
    })
    function menuSearch() {
        var search=$("#q").val();
        if(search=="请输入关键词")
            search="";
        location.href="${pageContext.request.contextPath}/item/getitembycid?draw=${pageVO.draw}&cid=${pageVO.cid}"+"&search="+search;

    }

    var liid;
    var id;
    $(".leftfirst li").mouseover(function () {

        $(".leftfirst li").attr("class", "");
        $(this).attr("class", "navred");
        $(".leftnavhide").show();
        liid = $(this).attr("id");
        id = "#info_" + liid;
        $(id).css("display", "list-item");


    });

    $("#pro_category").click(function () {
        $(".leftnav").toggle();
    });

    $(".leftfirst li").mouseleave(function () {

        $(".leftnavhide").hide();
        $(".leftfirst li").attr("class", "");
        liid = $(this).attr("id");
        id = "#info_" + liid;
        $(id).css("display", "none");


    });
    $(".leftnavhide").mouseover(function () {

        $(".leftfirst li").attr("class", "");
        $(liid).attr("class", "navred");
        $(".leftnavhide").show();
        $(id).css("display", "list-item");
    })
    $(".leftnavhide").mouseleave(function () {
        $(".leftnavhide").hide();
        $(".leftfirst li").attr("class", "");
        $(id).css("display", "none");

    })
</script>
<script src="${pageContext.request.contextPath}/static/js/jquery.fly.min.js"></script>
<script>

    function Zoom(imgbox, hoverbox, l, t, x, y, h_w, h_h, showbox) {
        var moveX = x - l - (h_w / 2);

        var moveY = y - t - (h_h / 2);

        if (moveX < 0) {
            moveX = 0
        }
        if (moveY < 0) {
            moveY = 0
        }
        if (moveX > imgbox.width() - h_w) {
            moveX = imgbox.width() - h_w
        }
        if (moveY > imgbox.height() - h_h) {
            moveY = imgbox.height() - h_h
        }

        var zoomX = showbox.width() / imgbox.width()

        var zoomY = showbox.height() / imgbox.height()

        showbox.css({
            left: -(moveX * zoomX),
            top: -(moveY * zoomY)
        })
        hoverbox.css({
            left: moveX,
            top: moveY
        })


    }
    function Zoomhover(imgbox, hoverbox, showbox) {
        var l = imgbox.offset().left;
        var t = imgbox.offset().top;
        var w = hoverbox.width();
        var h = hoverbox.height();
        var time;
        $(".probox img,.hoverbox").mouseover(function(e) {
            var x = e.pageX;
            var y = e.pageY;
            $(".hoverbox,.showbox").show();
            hoverbox.css("opacity", "0.3")
            time = setTimeout(function() {
                Zoom(imgbox, hoverbox, l, t, x, y, w, h, showbox)
            }, 1)
        }).mousemove(function(e) {
            var x = e.pageX;
            var y = e.pageY;
            time = setTimeout(function() {
                Zoom(imgbox, hoverbox, l, t, x, y, w, h, showbox)
            }, 1)
        }).mouseout(function() {
            showbox.parent().hide()
            hoverbox.hide();
        })
    }
    $(function() {
        Zoomhover($(".probox img"), $(".hoverbox"), $(".showbox img"));
    })
    function fay() {
        var offset = $(".mycart span").offset();
        var scT=$(window).scrollTop();
        var img = $(".addcart").children('img').attr('src');
        var flyer = $('<img class="flyer-img" src="' + img + '">');
        flyer.width(40);
        flyer.height(40);
        flyer.css("border-radius","50%");
        var imgl=$(".addcart").children('img')[0];
        var imglT=imgl.getBoundingClientRect().top;
        var imglL=imgl.getBoundingClientRect().left;

        flyer.fly({
            start: {
                left: imglL,
                top: imglT
            },
            end: {
                left: offset.left,
                top: offset.top-scT
            },
            onEnd: function() {
                flyer.fadeOut(1000)
                var cartnum=Number($(".mycart>span").html());
                cartnum+= 1;
                $(".mycart>span").html(cartnum);
                //$("imgl").show().animate({width: '200px'},300).fadeOut(500);
                //flyer.destory().bind(flyer);
            }
        });
    }
</script>
</body>
</html>
