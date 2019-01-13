package com.xzh.web.commons.dto;

import lombok.Data;

import java.io.Serializable;
import java.util.List;



public class PageInfo<T> implements Serializable {
    private int draw;
    private int recordsTotal;//数据总条数
    private int recordsFiltered;//过滤后的数据总条数
    private List<T> data;
    private String error;

    public int getDraw() {
        return draw;
    }

    public void setDraw(int draw) {
        this.draw = draw;
    }

    public int getRecordsTotal() {
        return recordsTotal;
    }

    public void setRecordsTotal(int recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    public int getRecordsFiltered() {
        return recordsFiltered;
    }

    public void setRecordsFiltered(int recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }

    public List<T> getData() {
        return data;
    }

    public void setData(List<T> data) {
        this.data = data;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("{");
        sb.append("\"draw\":")
                .append(draw);
        sb.append(",\"recordsTotal\":")
                .append(recordsTotal);
        sb.append(",\"recordsFiltered\":")
                .append(recordsFiltered);
        sb.append(",\"data\":")
                .append(data);
        sb.append(",\"error\":\"")
                .append(error).append('\"');
        sb.append('}');
        return sb.toString();
    }
}