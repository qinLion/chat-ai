package com.chat.common.utils;

import com.github.pagehelper.PageInfo;

import java.io.Serializable;
import java.util.List;

public class PageUtil {

    /**
     * 分页返回数据的封装
     *
     * @param i    总条数
     * @param list 查询的集合
     * @param <T>  类型
     * @return 返回封装的分页的数据
     */
    public static <T extends Serializable> PageInfo<T> page(int i, List<T> list, PageQuery pageQuery) {
        PageInfo<T> pageInfo = new PageInfo<>();
        pageInfo.setList(list);
        pageInfo.setTotal(i);
        pageInfo.setPageNum(pageQuery.getPageNum());
        pageInfo.setPageSize(pageQuery.getPageSize());
        pageInfo.setPages((i - 1) / pageQuery.getPageSize() + 1);
        return pageInfo;
    }

}
