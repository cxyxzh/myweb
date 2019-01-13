
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