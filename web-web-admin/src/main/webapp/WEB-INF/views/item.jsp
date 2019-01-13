<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2019/1/5
  Time: 17:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="x-ua-compatible" content="ie=7"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>${treeMap[(pageVO.cid)].node.name}</title>
    <link href="${pageContext.request.contextPath}/static/css/main.css" type="text/css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/css/front.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/static/css/shop.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/sort.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/login.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.4.2.min.js"></script>
    <link href="${pageContext.request.contextPath}/static/css/memberhead.css" rel="stylesheet">

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
<div id="content" style="background-color: white">
    <div class="contentconbox">
        <div class="guide">





            <div class="guideright fr">
                <a href="${pageContext.request.contextPath}/index">首页</a> > <span><a href="#">${treeMap[(pageVO.cid)].node.name }</a></span>共<span>${pageVO.recordsTotal}</span>件商品
            </div>
        </div>

        <!-- 手机栏目 -->


        <div class="select">
            <input type="hidden" name="orderBy" id="orderBy" value="0"/>
            <ul>
                <li <c:if test="${pageVO.draw==0}">class="selall"</c:if> onclick="draw(0)">综合排序</li>
                <li <c:if test="${pageVO.draw==1}">class="selall"</c:if> onclick="draw(1)" title="7天销量降序排列">销量<i></i></li>
                <li <c:if test="${pageVO.draw==2}">class="selall"</c:if>onclick="draw(2)" title="上架时间降序排列">新品<i></i></li>
                <li <c:if test="${pageVO.draw==3}">class="selall"</c:if> onclick="draw(3)" title="价格降序排列" class="jiage jiage3">价格<i class="pup"></i><i
                        class="pdown"></i></li>
            </ul>
            <div class="priceinput">
                <span>￥</span>
                <input name="startPrice" id="startPrice" type="number" name="points" min="0" value="${pageVO.startPrice}"
                       class="pricefrom">
                <em>—</em>
                <span>￥</span>
                <input name="endPrice" id="endPrice" type="number" value="${pageVO.endPrice!=-1?pageVO.endPrice:""}" class="priceto">
            </div>
            <button type="button" class="editactive" onclick="betweenPrice()">确定</button>
            <button type="button" onclick="cleanPrice()">清除</button>
        </div>



            <!-- 衣服展示 -->
            <div class="clothes">
                <ul class="clothesbox">
                    <c:forEach items="${pageVO.data}" var="item">
                    <li>

                        <a href="${pageContext.request.contextPath}/item/info?id=${item.id}&parent.id=${item.parent.id}"  style="display:block;">
                            <div class="clothpic"><img src="${pageContext.request.contextPath}/static/img/${item.image}" alt=""></div>
                            <div class="clothtxt">
								<span class="price">￥
											${item.price}
								</span>
                                <p>${item.title.length()>20?item.title.substring(0,20):item.title}	${item.title.length()>20?"...":""}</p>
                                <span class="origin">
	                               	${item.sellPoint.length()>20?item.sellPoint.substring(0,20):item.sellPoint}	${item.sellPoint.length()>20?"...":""}
								</span>

                                <span class="prenum"><i class="preadd">自营</i>已售出${99999-item.num}件</span>
                            </div>
                        </a>
                    </li>
                    </c:forEach>
                </ul>
                <div class="clearfix"></div>
                <div class="clothpage">

                    <div class="pagenum">

                        <c:if test="${pageVO.page!=1 }">
                            <button style="margin-right: 10px"><a href="#" class="mypage" id="mypage${pageVO.page-1}">< 上一页</a></button>
                        </c:if>
                        <ul style="float:left;">

                            <c:choose>
                                <c:when test="${pageVO.maxPage>=10 }">
                                    <c:if test="${pageVO.page<5 }">
                                        <c:forEach  begin="1"  end="${pageVO.page+2 }"  var="i">
                                            <c:if test="${pageVO.page==i }">
                                               <li class="currentpage">${i }</li>
                                            </c:if>
                                            <c:if test="${pageVO.page!=i }">
                                                <a href="#" class="mypage" id="mypage${i}"><li>${i }</li></a>
                                            </c:if>
                                        </c:forEach>
                                        <li>...</li>
                                        <a href="#" class="mypage"id="mypage${pageVO.maxPage}"><li>${pageVO.maxPage }</li></a>
                                    </c:if>
                                    <c:if test="${pageVO.page>pageVO.maxPage-3 }">
                                        <a  href="#" class="mypage" id="mypage1"><li>1</li></a><li>...</li>
                                        <c:forEach begin="${pageVO.maxPage-2 }" end="${pageVO.maxPage }" var="i">
                                            <c:if test="${pageVO.page==i }">
                                               <li class="currentpage">${i }</li>
                                            </c:if>
                                            <c:if test="${pageVO.page!=i }">
                                                <a  href="#" class="mypage"id="mypage${i}"><li>${i }</li></a>
                                            </c:if>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${pageVO.page>=5&&pageVO.page<=pageVO.maxPage-3 }">
                                        <a href="#" class="mypage" id="mypage1"><li>1</li></a><li>...</li>
                                        <c:forEach begin="${pageVO.page-2 }" end="${pageVO.page+2 }" var="i">
                                            <c:if test="${pageVO.page==i }">
                                               <li class="currentpage">${i }</li>
                                            </c:if>
                                            <c:if test="${pageVO.page!=i }">
                                                <a  href="#" class="mypage" id="mypage${i}"><li>${i }</li></a>
                                            </c:if>
                                        </c:forEach>
                                        <li>...</li>
                                        <a  href="#" class="mypage" id="mypage${pageVO.maxPage}"><li>${pageVO.maxPage }</li></a>
                                    </c:if>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach begin="1" end="${pageVO.maxPage }" var="i">
                                        <c:if test="${pageVO.page==i }">
                                            <li class="currentpage">${i }</li>
                                        </c:if>
                                        <c:if test="${pageVO.page!=i }">
                                            <a href="#" class="mypage" id="mypage${i }"><li>${i }</li></a>
                                        </c:if>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                            <c:if test="${pageVO.page!=pageVO.maxPage }">
                                <button> <a href="#" class="mypage" id="mypage${pageVO.page+1}" >下一页 ></a></button>
                            </c:if>
                        </ul>

                    </div>
                    <span>共<em>${pageVO.maxPage}</em>页</span>
                    <span>到第<input type="text" id="goPs" /> 页</span>
                    <button id="jumptopage">确定</button>
                </div>
            </div>



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
</script>

<script>

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
</body>
</html>
