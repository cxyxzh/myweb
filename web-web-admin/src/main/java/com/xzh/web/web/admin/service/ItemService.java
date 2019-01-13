package com.xzh.web.web.admin.service;

import com.xzh.web.commons.vo.PageVO;
import com.xzh.web.domain.Item;

import java.util.List;

public interface ItemService {
    List<Item> selectItemByCid(PageVO<Item> pageVO);

    int count(PageVO<Item> pageVO);

    Item selectById(Long id);
}
