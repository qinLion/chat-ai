package com.chat.app.user;

import com.chat.common.core.controller.APPController;
import com.chat.common.core.domain.AjaxResult;
import com.chat.system.domain.res.AppVipRes;
import com.chat.system.service.IAppVipService;
import com.chat.system.service.ISysConfigService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

@RestController
@RequestMapping("/app/config")
public class ConfigController extends APPController {

    @Resource
    private ISysConfigService sysConfigService;

    @Resource
    private IAppVipService appVipService;

    /**
     * 获取配置的信息
     */
    @RequestMapping("/info")
    public AjaxResult info(@RequestParam("keyName") String keyName) {
        String key = sysConfigService.selectConfigByKey(keyName);
        return AjaxResult.success("查询成功", key);
    }

    /**
     * 获取会员配置信息
     */
    @RequestMapping("vip")
    public AjaxResult vip() {
        getUserId();
        List<AppVipRes> list = appVipService.getVipList();
        return success(list);
    }


}
