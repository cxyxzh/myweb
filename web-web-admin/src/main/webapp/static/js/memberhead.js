$(function(){
    //瀵艰埅鏍�
    $(".p_navbox ul li").click(function(){
        $(this).addClass("navcheck").siblings().removeClass("navcheck");
    })
    //瀹濊礉鍒嗙被
    $(".p_navbox span").mouseenter(function(){
        $(".navitem").show();

    })
    $(".p_navbox .itemleft").mouseenter(function(){
        $(".navitem").show();

    })

    $(".p_navbox span").mouseleave(function(){
        $(".navitem").hide();
        $(".itembox").hide();
    })
    $(".p_navbox .itemleft").mouseleave(function(){
        $(".navitem").hide();
        $(".itembox").hide();
    })

    var num=null;
    $(".p_navbox .navitem .navleft").mouseenter(function(){
        num=$(this).index();
        $(".itembox").eq(num).show().siblings(".itembox").hide();
        $(this).siblings().children(".itembox").hide();
        $(this).find("a").addClass("navred");
    }).mouseleave(function(){
        $(this).find("a").removeClass("navred");
    })

    //鍟嗗搧鍒嗙被
    $(".nav .shopsort").mouseenter(function(){
        $(".navitem").show();

    })
    $(".nav .itemleft").mouseenter(function(){
        $(".navitem").show();

    })

    $(".nav .shopsort").mouseleave(function(){
        $(".navitem").hide();
        $(".itembox").hide();
    })
    $(".nav .itemleft").mouseleave(function(){
        $(".navitem").hide();
        $(".itembox").hide();
    })

    var num=null;
    $(".nav .navitem .navleft").mouseenter(function(){
        num=$(this).index();
        $(".itembox").eq(num).show().siblings(".itembox").hide();
        $(this).siblings().children(".itembox").hide();
        $(this).find("a").addClass("navred");
    }).mouseleave(function(){
        $(this).find("a").removeClass("navred");
    })

    //鎴戠殑璐墿杞�
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
})