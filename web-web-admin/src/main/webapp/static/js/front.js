Cms = {};
/**
 * 娴忚娆℃暟
 */
Cms.viewCount = function(base, contentId, viewId, commentId, downloadId, upId,
                         downId) {
    viewId = viewId || "views";
    commentId = commentId || "comments";
    downloadId = downloadId || "downloads";
    upId = upId || "ups";
    downId = downId || "downs";
    $.getJSON(base + "/content_view.jspx", {
        contentId : contentId
    }, function(data) {
        if (data.length > 0) {
            $("#" + viewId).text(data[0]);
            $("#" + commentId).text(data[1]);
            $("#" + downloadId).text(data[2]);
            $("#" + upId).text(data[3]);
            $("#" + downId).text(data[4]);
        }
    });
}
/**
 * 绔欑偣娴侀噺缁熻
 */
Cms.siteFlow = function(base, page, referer,flag,pvId, visitorId) {
    pvId = pvId || "pv";
    visitorId = visitorId || "visitor";
    flag = flag || 1;
    $.getJSON(base + "/flow_statistic.jspx", {
        page : page,
        referer : referer
    }, function(data) {
        if(flag==1){
            if (data.length > 0) {
                $("#" + pvId).text(data[0]);
                $("#" + visitorId).text(data[1]);
            }
        }
    });
}
/**
 * 鎴愬姛杩斿洖true锛屽け璐ヨ繑鍥瀎alse銆�
 */
Cms.up = function(base, contentId, origValue, upId) {
    upId = upId || "ups";
    var updown = $.cookie("_cms_updown_" + contentId);
    if (updown) {
        return false;
    }
    $.cookie("_cms_updown_" + contentId, "1");
    $.get(base + "/content_up.jspx", {
        "contentId" : contentId
    }, function(data) {
        $("#" + upId).text(origValue + 1);
    });
    return true;
}
/**
 * 鎴愬姛杩斿洖true锛屽け璐ヨ繑鍥瀎alse銆�
 */
Cms.down = function(base, contentId, origValue, downId) {
    downId = downId || "downs";
    var updown = $.cookie("_cms_updown_" + contentId);
    if (updown) {
        return false;
    }
    $.cookie("_cms_updown_" + contentId, "1");
    $.get(base + "/content_down.jspx", {
        contentId : contentId
    }, function(data) {
        $("#" + downId).text(origValue + 1);
    });
    return true;
}
/**
 * 鑾峰彇璇勫垎閫夐」鎶曠エ鏁�
 */
Cms.scoreCount = function(base, contentId,itemPrefix) {
    itemPrefix=itemPrefix||"score-item-";
    $.getJSON(base + "/content_score_items.jspx", {
        contentId : contentId
    }, function(data) {
        $("span[id^='"+itemPrefix+"']").each(function(){
            var itemId=$(this).prop("id").split(itemPrefix)[1];
            $(this).text(data.result[itemId]);
        });
    });
}
/**
 * 鎴愬姛杩斿洖true锛屽け璐ヨ繑鍥瀎alse銆�
 */
Cms.score = function(base, contentId,itemId,itemPrefix) {
    itemPrefix=itemPrefix||"score-item-";
    var score = $.cookie("_cms_score_" + contentId);
    if (score) {
        return false;
    }
    $.cookie("_cms_score_" + contentId, "1");
    $.get(base + "/content_score.jspx", {
        "contentId" : contentId,
        "itemId":itemId
    }, function(data) {
        if(data.succ){
            $("#"+itemPrefix + itemId).text(data.count);
        }
    });
    return true;
}
/**
 * 鑾峰彇闄勪欢鍦板潃
 */
Cms.attachment = function(base, contentId, n, prefix) {
    $.get(base + "/attachment_url.jspx", {
        "cid" : contentId,
        "n" : n
    }, function(data) {
        var url;
        for (var i = 0;i < n; i++) {
            url = base + "/attachment.jspx?cid=" + contentId + "&i=" + i
                + data[i];
            $("#" + prefix + i).attr("href", url);
        }
    }, "json");
}
/**
 * 鎻愪氦璇勮
 */
Cms.comment = function(callback, form) {
    form = form || "commentForm";
    $("#" + form).validate( {
        submitHandler : function(form) {
            $(form).ajaxSubmit( {
                "success" : callback,
                "dataType" : "json"
            });
        }
    });
}
/**
 * 鑾峰彇璇勮鍒楄〃
 *
 * @param siteId
 * @param contentId
 * @param greatTo
 * @param recommend
 * @param orderBy
 * @param count
 */
Cms.commentList = function(base, c, options) {
    c = c || "commentListDiv";
    $("#" + c).load(base + "/comment_list.jspx", options);
}
/**
 * 瀹㈡埛绔寘鍚櫥褰�
 */
Cms.loginCsi = function(base, c, options) {
    c = c || "loginCsiDiv";
    $("#" + c).load(base + "/login_csi.jspx", options);
}
/**
 * 鍚戜笂婊氬姩js绫�
 */
Cms.UpRoller = function(rid, speed, isSleep, sleepTime, rollRows, rollSpan,
                        unitHight) {
    this.speed = speed;
    this.rid = rid;
    this.isSleep = isSleep;
    this.sleepTime = sleepTime;
    this.rollRows = rollRows;
    this.rollSpan = rollSpan;
    this.unitHight = unitHight;
    this.proll = $('#roll-' + rid);
    this.prollOrig = $('#roll-orig-' + rid);
    this.prollCopy = $('#roll-copy-' + rid);
    // this.prollLine = $('#p-roll-line-'+rid);
    this.sleepCount = 0;
    this.prollCopy[0].innerHTML = this.prollOrig[0].innerHTML;
    var o = this;
    this.pevent = setInterval(function() {
        o.roll.call(o)
    }, this.speed);
}
Cms.UpRoller.prototype.roll = function() {
    if (this.proll[0].scrollTop > this.prollCopy[0].offsetHeight) {
        this.proll[0].scrollTop = this.rollSpan + 1;
    } else {
        if (this.proll[0].scrollTop % (this.unitHight * this.rollRows) == 0
            && this.sleepCount <= this.sleepTime && this.isSleep) {
            this.sleepCount++;
            if (this.sleepCount >= this.sleepTime) {
                this.sleepCount = 0;
                this.proll[0].scrollTop += this.rollSpan;
            }
        } else {
            var modCount = (this.proll[0].scrollTop + this.rollSpan)
                % (this.unitHight * this.rollRows);
            if (modCount < this.rollSpan) {
                this.proll[0].scrollTop += this.rollSpan - modCount;
            } else {
                this.proll[0].scrollTop += this.rollSpan;
            }
        }
    }
}
Cms.LeftRoller = function(rid, speed, rollSpan) {
    this.rid = rid;
    this.speed = speed;
    this.rollSpan = rollSpan;
    this.proll = $('#roll-' + rid);
    this.prollOrig = $('#roll-orig-' + rid);
    this.prollCopy = $('#roll-copy-' + rid);
    this.prollCopy[0].innerHTML = this.prollOrig[0].innerHTML;
    var o = this;
    this.pevent = setInterval(function() {
        o.roll.call(o)
    }, this.speed);
}
Cms.LeftRoller.prototype.roll = function() {
    if (this.proll[0].scrollLeft > this.prollCopy[0].offsetWidth) {
        this.proll[0].scrollLeft = this.rollSpan + 1;
    } else {
        this.proll[0].scrollLeft += this.rollSpan;
    }
}
/**
 * 鏀惰棌淇℃伅
 */
Cms.collect = function(base, cId, operate,showSpanId,hideSpanId) {
    $.post(base + "/member/collect.jspx", {
        "cId" : cId,
        "operate" : operate
    }, function(data) {
        if(data.result){
            if(operate==1){
                alert("鏀惰棌鎴愬姛锛�");
                $("#"+showSpanId).show();
                $("#"+hideSpanId).hide();
            }else{
                alert("鍙栨秷鏀惰棌鎴愬姛锛�");
                $("#"+showSpanId).hide();
                $("#"+hideSpanId).show();
            }
        }else{
            alert("璇峰厛鐧诲綍");
        }
    }, "json");
}
/**
 * 鍒楄〃鍙栨秷鏀惰棌淇℃伅
 */
Cms.cmsCollect = function(base, cId, operate) {
    $.post(base + "/member/collect.jspx", {
        "cId" : cId,
        "operate" : operate
    }, function(data) {
        if(data.result){
            if(operate==1){
                alert("鏀惰棌鎴愬姛锛�");
            }else{
                alert("鍙栨秷鏀惰棌鎴愬姛锛�");
                $("#tr_"+cId).remove();
            }
        }else{
            alert("璇峰厛鐧诲綍");
        }
    }, "json");
}
/**
 * 妫€娴嬫槸鍚﹀凡缁忔敹钘忎俊鎭�
 */
Cms.collectexist = function(base, cId,showSpanId,hideSpanId) {
    $.post(base + "/member/collect_exist.jspx", {
        "cId" : cId
    }, function(data) {
        if(data.result){
            $("#"+showSpanId).show();
            $("#"+hideSpanId).hide();
        }else{
            $("#"+showSpanId).hide();
            $("#"+hideSpanId).show();
        }
    }, "json");
}

/**
 * 鐢宠鑱屼綅淇℃伅
 */
Cms.jobApply = function(base, cId) {
    $.post(base + "/member/jobapply.jspx", {
        "cId" : cId
    }, function(data) {
        if(data.result==-1){
            alert("璇峰厛鐧诲綍");
        }else if(data.result==-2){
            alert("鑱屼綅id涓嶈兘涓虹┖");
        }else if(data.result==-3){
            alert("鏈壘鍒拌鑱屼綅");
        }else if(data.result==-4){
            alert("鎮ㄨ繕娌℃湁鍒涘缓绠€鍘嗭紝璇峰厛瀹屽杽绠€鍘�");
        }else if(data.result==0){
            alert("鎮ㄤ粖澶╁凡缁忕敵璇蜂簡璇ヨ亴浣�!");
        }else if(data.result==1){
            alert("鎴愬姛鐢宠浜嗚鑱屼綅!");
        }
    }, "json");
}
Cms.loginSSO=function(base){
    var username=$.cookie('username');
    var sessionId=$.cookie('JSESSIONID');
    var ssoLogout=$.cookie('sso_logout');
    if(username!=null){
        if(sessionId!=null||(ssoLogout!=null&&ssoLogout=="true")){
            $.post(base+"/sso/login.jspx", {
                username:username,
                sessionId:sessionId,
                ssoLogout:ssoLogout
            }, function(data) {
                if(data.result=="login"||data.result=="logout"){
                    location.reload();
                }
            }, "json");
        }
    }
}
Cms.getCookie=function getCookie(c_name){
    if (document.cookie.length>0)
    {
        c_start=document.cookie.lastIndexOf(c_name + "=");
        if (c_start!=-1)
        {
            c_start=c_start + c_name.length+1;
            c_end=document.cookie.indexOf(";",c_start);
            if (c_end==-1){
                c_end=document.cookie.length;
            }
            return unescape(document.cookie.substring(c_start,c_end));
        }
    }
    return "";
}




//瀵笵ate鐨勬墿灞曪紝灏� Date 杞寲涓烘寚瀹氭牸寮忕殑String
//鏈�(M)銆佹棩(d)銆佸皬鏃�(h)銆佸垎(m)銆佺(s)銆佸搴�(q) 鍙互鐢� 1-2 涓崰浣嶇锛�
//骞�(y)鍙互鐢� 1-4 涓崰浣嶇锛屾绉�(S)鍙兘鐢� 1 涓崰浣嶇(鏄� 1-3 浣嶇殑鏁板瓧)
//渚嬪瓙锛�
//(new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
//(new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
Date.prototype.Format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //鏈堜唤
        "d+": this.getDate(), //鏃�
        "h+": this.getHours(), //灏忔椂
        "m+": this.getMinutes(), //鍒�
        "s+": this.getSeconds(), //绉�
        "q+": Math.floor((this.getMonth() + 3) / 3), //瀛ｅ害
        "S": this.getMilliseconds() //姣
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}