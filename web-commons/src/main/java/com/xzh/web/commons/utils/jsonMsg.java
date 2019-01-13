package com.xzh.web.commons.utils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class jsonMsg<T> implements Serializable {
    private String msg;
    private List<T> data;
    public jsonMsg() {
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public List<T> getData() {
        return data;
    }



    public void setData(List<T> data) {
        this.data = data;
    }
    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("{");
        sb.append("\"msg\":\"")
                .append(msg).append('\"');
        if(data!=null) {

            sb.append(",\"data\":")
                    .append(data);

        }
        else
            sb.append(",\"data\":\"\"");
        sb.append('}');
        return sb.toString();
    }
}
