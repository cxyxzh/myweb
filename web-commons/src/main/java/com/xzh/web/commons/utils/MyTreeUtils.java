package com.xzh.web.commons.utils;

import com.xzh.web.domain.ItemCat;

import java.io.Serializable;
import java.util.List;

public class MyTreeUtils implements Serializable {
    public void getAllChildId(MyTree<ItemCat> root, List<Long> list){

            list.add(root.getNode().getId());

            List<MyTree<ItemCat>> child = root.getChild();
            for (MyTree<ItemCat> myTree : child) {
                getAllChildId(myTree,list);
            }
       
    }
    private static void getChild(MyTree root,List<Integer> list){

    }
}
