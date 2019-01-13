package com.xzh.web.commons.vo;

import com.xzh.web.domain.Item;

import java.io.Serializable;
import java.util.List;

public class ItemInfoVO implements Serializable {
    private Item item;
    private List<Item> recommend;

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public List<Item> getRecommend() {
        return recommend;
    }

    public void setRecommend(List<Item> recommend) {
        this.recommend = recommend;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("{");
        sb.append("\"item\":")
                .append(item);
        sb.append(",\"recommend\":")
                .append(recommend);
        sb.append('}');
        return sb.toString();
    }
}
