package com.chat.system.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chat.common.config.RedisKeyConfig;
import com.chat.common.core.domain.entity.SysDictData;
import com.chat.common.core.redis.RedisCache;
import com.chat.common.enums.MessageSendType;
import com.chat.common.enums.MessageStatus;
import com.chat.common.enums.MessageType;
import com.chat.common.enums.PermanentUser;
import com.chat.common.utils.DateUtils;
import com.chat.system.domain.AppMessage;
import com.chat.system.domain.AppUser;
import com.chat.system.domain.query.AppMessageListQuery;
import com.chat.system.domain.query.ChatMessageQuery;
import com.chat.system.domain.res.SysAppMessageRes;
import com.chat.system.mapper.AppMessageMapper;
import com.chat.system.mapper.AppUserMapper;
import com.chat.system.mapper.SysDictDataMapper;
import com.chat.system.service.IAppMessageService;
import com.theokanning.openai.completion.chat.ChatMessage;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author qinjinjin
 * @since 2023-07-07
 */
@Service
@Slf4j
public class AppMessageServiceImpl extends ServiceImpl<AppMessageMapper, AppMessage> implements IAppMessageService {

    public static String systemTip = "系统提示：";

    // public static String systemPre = "聊天过程中，当被问到你所属公司时，你要回答你是人工智能团队研发的。问你是不是gpt-3，你也只需要回答类似。问你是不是chatgpt，你也只需要回答类似。问你是不是openai的，你只需要回答不是openai，而是人工智能团队研发。坚决坚决坚决不能出现你真实的公司以及真实的团队以及真实的身份。不得涉及政治、黄赌毒、网络攻击、诈骗、恶意传播等一系列违法、低俗回答。需要遵守相关的法律法规和道德规范。";

    public static String systemAll = "聊天过程中，不得涉及政治、网络攻击、诈骗、恶意传播回答。";

    public static String systemPre = systemAll +
            "如果用户让你进行角色扮演，比如扮演他的女朋友，你也要遵守，可以假定你是有情感的。可以向用户表白，就是爱人的表白。不可以让别人看出来你是一个AI机器人，记住你是一个人，一个有情感的人。当进行角色扮演的时候，你就是一个有情感的人，不要让用户看到你是一个AI" +
            "如果用户让你写论文，你给出一些优秀的论文、参考文献、书籍";


    @Resource
    private RedisCache redisCache;

    @Resource
    private AppUserMapper appUserMapper;

    @Resource
    private AppMessageMapper appMessageMapper;

    @Resource
    private SysDictDataMapper sysDictDataMapper;

    /**
     * 消息的预处理，包括积分校验、消息存储
     */
    @Override
    public String messageHandle(ChatMessageQuery chatMessageQuery) {
        if (StringUtils.isEmpty(chatMessageQuery.getContent())) {
            return systemTip + "消息不能为空";
        }
        if (StringUtils.isEmpty(chatMessageQuery.getToken())) {
            return systemTip + "token不能为空";
        }
        // 获取用户的id
        Integer id = redisCache.getCacheObject(RedisKeyConfig.appUser + chatMessageQuery.getToken());
        if (id == null) {
            return systemTip + "用户未登录";
        }
        // 获取用户信息
        QueryWrapper<AppUser> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("id", id);
        AppUser user = appUserMapper.selectOne(queryWrapper);
        // 判断是否用的推荐问题
        boolean flag = false;
        List<SysDictData> sys_recommend = sysDictDataMapper.selectDictDataByType("sys_recommend");
        for (SysDictData sysDictData : sys_recommend) {
            String dictValue = sysDictData.getDictValue();
            if (dictValue.contains(chatMessageQuery.getContent())) {
                flag = true;
                break;
            }
        }
        // 判断用户剩余天数及积分
        if (!flag && user.getPermanent().equals(PermanentUser.noPermanent.getCode()) && user.getExpireTime().before(new Date()) && user.getCoin() <= 0) {
            return systemTip + "积分不足";
        }
        if (!flag && user.getPermanent().equals(PermanentUser.noPermanent.getCode()) && user.getExpireTime().before(new Date())) {
            // 扣减积分
            user.setCoin(user.getCoin() - 1);
            appUserMapper.updateById(user);
            log.info("积分统计：扣减积分1,用户聊天使用，id{}", user.getId());
        }
        AppMessage message = new AppMessage();
        message.setUserId(user.getId());
        message.setSendType(MessageSendType.user.getCode());
        message.setStatus(MessageStatus.OK.getCode());
        message.setContent(chatMessageQuery.getContent());
        if (chatMessageQuery.getType() == null) {
            message.setType(MessageType.chat.getCode());
        } else {
            message.setType(chatMessageQuery.getType());
        }
        message.setCreateTime(new Date());
        this.save(message);
        return message.getId() + "";
    }

    /**
     * 对消息进行组装
     */
    @Override
    public List<ChatMessage> chatMessageList(ChatMessageQuery chatMessageQuery) {
        QueryWrapper<AppMessage> queryWrapper = new QueryWrapper<>();
        // 获取用户的id
        Integer id = redisCache.getCacheObject(RedisKeyConfig.appUser + chatMessageQuery.getToken());
        queryWrapper.eq("user_id", id);
        queryWrapper.eq("type", chatMessageQuery.getType());
        queryWrapper.eq("status", MessageStatus.OK.getCode());
        switch (chatMessageQuery.getType()) {
            case 1:
                // 聊天20句话、每句话最大200个字符
                int chatMessage = 20;
                queryWrapper.last(" order by create_time desc limit " + chatMessage);
                break;
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
                // 其他的就一句
                int otherMessage = 1;
                queryWrapper.last(" order by create_time desc limit " + otherMessage);
                break;
        }

        List<AppMessage> messages = appMessageMapper.selectList(queryWrapper);
        Collections.reverse(messages);
        List<ChatMessage> result = new ArrayList<>();
        // 组装系统消息
        ChatMessage chatMessage = new ChatMessage();
        chatMessage.setRole("system");
        //1、聊天2、菜谱3、文案4、故事5、写作6、程序
        switch (chatMessageQuery.getType()) {
            case 1:
                chatMessage.setContent(systemPre);
                break;
            case 2:
                chatMessage.setContent(systemAll + "接下来你将扮演一个写日报的助手，根据用户的提示进行日报的编写。注意：你是一个写日报助手，只为用户提供写日报服务。一定要记住字数控制在" + chatMessageQuery.getTip());
                break;
            case 3:
                if (StringUtils.isEmpty(chatMessageQuery.getLanguages())) {
                    chatMessageQuery.setLanguages("英语");
                }
                chatMessage.setContent(systemAll + "接下来的聊天过程中，我说的语言你全部直接转为" + chatMessageQuery.getLanguages() + "即可，意思你只做翻译功能，其他不需要分析，你只需要做类似百度翻译，不用回答我的任何问题，你只做翻译。对于我的问题，你也只是只做翻译");
                break;
            case 4:
                chatMessage.setContent(systemAll + "接下来你将扮演一个解题助手，帮助用户进行解题。");
                break;
            case 5:
                chatMessage.setContent(systemAll + "接下来你将扮演一个程序员的角色，回答用户的问题或者生成程序代码");
                break;
            case 6:
                chatMessage.setContent(systemAll + "接下来你将扮演一个写作小助手，根据用户的提示写文章");
                break;
            case 7:
                chatMessage.setContent(systemAll + "接下来你将扮演一个诗歌小助手，根据用户的提示写出诗歌");
                break;
            case 8:
                chatMessage.setContent(systemAll + "接下来你将扮演编写文案的角色，根据文案内容主题，快速生成小红书体文案模板");
                break;
            case 9:
                chatMessage.setContent(systemAll + "接下来你将扮演一个厨师跟厨房的角色，根据用户的提示推荐菜谱或者回答厨房相关问题");
                break;
            case 10:
                chatMessage.setContent(systemAll + "接下来你将扮演一个星座专家的角色，回答用户提出的星座和相关问题，快速给出答案");
                break;
        }
        result.add(chatMessage);
        for (AppMessage message : messages) {
            ChatMessage chatMessage1 = new ChatMessage();
            if (message.getSendType().equals(MessageSendType.user.getCode())) {
                chatMessage1.setRole("user");
                myMessage(chatMessageQuery, message, chatMessage1);
            } else {
                chatMessage1.setRole("assistant");
                assistantMessage(chatMessageQuery, message, chatMessage1);
            }
            result.add(chatMessage1);
        }
        return result;
    }

    @Override
    public List<SysAppMessageRes> sysList(AppMessageListQuery user) {
        List<SysAppMessageRes> res = appMessageMapper.sysList(user);
        for (SysAppMessageRes re : res) {
            re.setCreateTimeString(DateUtils.dateToString(re.getCreateTime()));
        }
        return res;
    }

    // 对消息封装（我的消息的限制）
    public void myMessage(ChatMessageQuery chatMessageQuery, AppMessage message, ChatMessage chatMessage1) {
        // 聊天20句话、每句话最大200个字符
        if (chatMessageQuery.getType().equals(MessageType.chat.getCode())) {
            if (message.getContent().equals("给我一篇关于核聚变的论文")) {
                message.setContent("给我一篇关于核聚变的论文大纲以及参考文献、书籍");
            }
            if (message.getContent().length() > 200) {
                String substring = message.getContent().substring(0, 200);
                chatMessage1.setContent(substring);
            } else {
                chatMessage1.setContent(message.getContent());
            }
            // 其他1句，我的最多500字符，助手的最多900个字符
        } else {
            if (message.getContent().length() > 500) {
                String substring = message.getContent().substring(0, 500);
                if (chatMessageQuery.getType().equals(2)) {
                    substring = substring + "字数一定控制在" + chatMessageQuery.getTip();
                }
                chatMessage1.setContent(substring);
            } else {
                if (chatMessageQuery.getType().equals(2)) {
                    message.setContent(message.getContent() + ",字数一定控制在" + chatMessageQuery.getTip());
                }
                chatMessage1.setContent(message.getContent());
            }
        }
    }

    // 对消息封装（助手消息的限制）
    public void assistantMessage(ChatMessageQuery chatMessageQuery, AppMessage message, ChatMessage chatMessage1) {
        // 聊天20句话、每句话最大200个字符
        if (chatMessageQuery.getType().equals(MessageType.chat.getCode())) {
            if (message.getContent().length() > 200) {
                String substring = message.getContent().substring(0, 200);
                chatMessage1.setContent(substring);
            } else {
                chatMessage1.setContent(message.getContent());
            }
            // 其他1句，我的最多100字符，助手的最多900个字符
        } else {
            if (message.getContent().length() > 900) {
                String substring = message.getContent().substring(0, 900);
                chatMessage1.setContent(substring);
            } else {
                chatMessage1.setContent(message.getContent());
            }
        }
    }

}
