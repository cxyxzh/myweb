package com.xzh.web.web.admin.service.impl;

import com.xzh.web.commons.vo.PageVO;
import com.xzh.web.domain.Item;
import com.xzh.web.web.admin.dao.ItemDao;
import com.xzh.web.web.admin.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemServiceImpl implements ItemService {

    @Autowired
    ItemDao<Item> itemDao;

    @Override
    public List<Item> selectItemByCid(PageVO<Item> pageVO) {
        return itemDao.selectByPage(pageVO);
    }

    @Override
    public int count(PageVO<Item> pageVO) {
        return itemDao.count(pageVO);
    }

    @Override
    public Item selectById(Long id) {
        return itemDao.selectById(id);
    }
}
