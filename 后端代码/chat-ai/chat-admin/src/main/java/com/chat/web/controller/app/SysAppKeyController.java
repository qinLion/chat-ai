package com.chat.web.controller.app;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chat.common.core.controller.BaseController;
import com.chat.common.core.domain.AjaxResult;
import com.chat.common.core.page.TableDataInfo;
import com.chat.system.domain.AppKey;
import com.chat.system.domain.query.AppKeyListQuery;
import com.chat.system.service.IAppKeyService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * 用户信息
 *
 * @author chat
 */
@RestController
@RequestMapping("/system/app/key")
public class SysAppKeyController extends BaseController {

    @Resource
    private IAppKeyService appKeyService;

    /**
     * 获取key列表
     */
    @GetMapping("/list")
    public TableDataInfo list(AppKeyListQuery user) {
        startPage();
        QueryWrapper<AppKey> queryWrapper = new QueryWrapper<>();
        if (StringUtils.isNotEmpty(user.getTitle())) {
            queryWrapper.like("key_value", user.getTitle());
        }
        if (user.getStatus() != null) {
            queryWrapper.eq("status", user.getStatus());
        }
        queryWrapper.orderByDesc("id");
        List<AppKey> lis = appKeyService.list(queryWrapper);
        return getDataTable(lis);
    }

    /**
     * 删除key
     */
    @GetMapping("/delete")
    public AjaxResult delete(@RequestParam("id") Integer id) {
        appKeyService.removeById(id);
        return success();
    }

    /**
     * 新建key
     */
    @GetMapping("/add")
    public AjaxResult add(@RequestParam("key") String key) {
        AppKey appKey = new AppKey();
        appKey.setKeyValue(key);
        appKey.setStatus(appKeyService.test(key));
        //appKey.setStatus(1);
        appKey.setUseStatus(1);
        appKeyService.save(appKey);
        return success();
    }

    /**
     * 测试key
     */
    @GetMapping("/test")
    public AjaxResult test() {
        appKeyService.test();
        return success();
    }

    /**
     * 更改key的状态
     */
    @GetMapping("/update")
    public AjaxResult update(AppKey key) {
        if (key.getId() == null) {
            return error();
        }
        AppKey appKey = new AppKey();
        appKey.setId(key.getId());
        appKey.setUseStatus(key.getUseStatus());
        appKeyService.updateById(appKey);
        return success();
    }

}
