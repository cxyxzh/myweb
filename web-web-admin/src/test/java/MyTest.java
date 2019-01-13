import com.xzh.web.commons.utils.MyTree;
import com.xzh.web.commons.utils.jsonMsg;
import com.xzh.web.commons.vo.PageVO;
import com.xzh.web.domain.Item;
import com.xzh.web.domain.ItemCat;
import com.xzh.web.domain.User;
import com.xzh.web.web.admin.dao.ItemCatDao;
import com.xzh.web.web.admin.dao.ItemDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"classpath:spring-context.xml", "classpath:spring-context-druid.xml", "classpath:spring-context-mybatis.xml"})
public class MyTest {
    @Autowired
    ItemDao itemDao;

    @Autowired
    ItemCatDao itemCatDao;

    @Test
    public void myErg(){
        String userNameReg="^[a-zA-Z0-9_-]{3,20}$";
        String emailReg="^([a-z0-9A-Z]+[-|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$";
        String passwordReg="^[A-Za-z0-9]{6,20}$";
        Pattern pattern = Pattern.compile(emailReg);
        Matcher matcher = pattern.matcher("123@qq.com");
        System.out.println(matcher.matches());
    }
    @Test
    public void tttt(){
        List<ItemCat> itemCats = itemCatDao.selectAllCategory();
        for (ItemCat itemCat : itemCats) {
            System.out.println(itemCat.getParentItemCat().getId());
        }

    }


    public void itemTest( List<ItemCat> list,MyTree<ItemCat> myTree,Map<Long,MyTree> map) {


        for (int i = 0; i < list.size();) {
            ItemCat itemCat=list.get(i);
            if (itemCat.getParentItemCat().getId() == myTree.getNode().getId()) {
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
