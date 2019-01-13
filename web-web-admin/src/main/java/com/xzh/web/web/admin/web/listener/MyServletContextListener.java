package com.xzh.web.web.admin.web.listener;

import com.xzh.web.commons.utils.MyTree;
import com.xzh.web.domain.ItemCat;
import com.xzh.web.web.admin.service.ItemCatService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.ServletContextAware;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextListener;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class MyServletContextListener implements InitializingBean, ServletContextAware {

    @Autowired
    ItemCatService itemCatService;


    private Logger logger= LoggerFactory.getLogger(MyServletContextListener.class);
    @Override
    public void afterPropertiesSet() throws Exception {

    }

    @Override
    public void setServletContext(ServletContext servletContext) {
        List<ItemCat> itemCats = itemCatService.selectAllCategory();
        MyTree<ItemCat> myTree=new MyTree<ItemCat>();
        ItemCat itemCat=new ItemCat();
        itemCat.setId(0L);
        myTree.setNode(itemCat);
        Map<Long,MyTree> map=new HashMap<Long, MyTree>();
        itemTest(itemCats,myTree,map);
        servletContext.setAttribute("treeMap",map);
        servletContext.setAttribute("myTree", myTree);
    }

    public void itemTest(List<ItemCat> list, MyTree<ItemCat> myTree,Map<Long,MyTree> map) {
        for (int i = 0; i < list.size();) {
            ItemCat itemCat=list.get(i);
            if (itemCat.getParentItemCat().getId().equals(myTree.getNode().getId())) {
                MyTree<ItemCat> child = new MyTree<ItemCat>();
                child.setParent(myTree);
                child.setNode(itemCat);
                myTree.getChild().add(child);
                list.remove(itemCat);

            } else {
                map.put(myTree.getNode().getId(),myTree);
                for (MyTree child : myTree.getChild()) {
                    itemTest(list, child,map);
                }
                return;
            }

        }
    }
}
