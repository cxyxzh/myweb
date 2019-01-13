package com.xzh.web.commons.dto;

import java.io.Serializable;

public class BaseResult implements Serializable {
    /*
    200
    404
    500
    403
     */
    private int status;
    //错误信息或者正确信息
    private String message;
    public static final int STATUS_SUCCESS = 200;
    public static final int STATUS_FAIL = 500;

    public  static BaseResult success(){
        BaseResult baseResult = BaseResult.createBaseResult(STATUS_SUCCESS, "验证成功");
        return baseResult;
    }

    public static BaseResult fail(){
        BaseResult baseResult = BaseResult.createBaseResult(STATUS_FAIL, "验证失败");
        return baseResult;
    }
    public static BaseResult fail(String message){
        BaseResult baseResult = BaseResult.createBaseResult(STATUS_FAIL,message );
        return baseResult;
    }


    public static BaseResult fail(int status,String message){
        BaseResult baseResult = BaseResult.createBaseResult(status, message);
        return baseResult;
    }

    public static BaseResult createBaseResult(int status , String message){
        BaseResult baseResult = new BaseResult();
        baseResult.setStatus(status);
        baseResult.setMessage(message);
        return baseResult;
    }

    public static BaseResult success(String str) {
        return createBaseResult(200,str);
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }


}
