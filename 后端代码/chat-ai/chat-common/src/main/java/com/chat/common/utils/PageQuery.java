package com.chat.common.utils;

import lombok.Data;

import java.io.Serializable;

/**
 * @author create by qinjinjin
 * @version v1.0
 * @description
 * @date 2022年6月11日
 */
@Data
public class PageQuery implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * *第几页
     */
    private int pageNum = 1;
    /**
     * *页大小
     */
    private int pageSize = 10;
    /**
     * 最新提问还是热门提问
     * 0最新、1热门
     */
    private int newOrHot;
    /**
     * 类型：2、广场、3攻略
     */
    private int type;
    /**
     * 提问或者攻略的id
     */
    private int id;
    /**
     * *排序字段
     */
    private String order;
    /**
     * *是否降序
     */
    private boolean desc = true;

    /**
     * 返回第一行记录
     *
     * @return int
     */
    public int getStartRow() {
        int startRow = (this.pageNum - 1) * pageSize;
        return Math.max(startRow, 0);
    }
}
