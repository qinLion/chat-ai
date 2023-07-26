package com.chat.system.openai;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.chat.system.domain.AppKey;
import com.chat.system.service.IAppKeyService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.theokanning.openai.OpenAiApi;
import com.theokanning.openai.service.OpenAiService;
import lombok.extern.slf4j.Slf4j;
import okhttp3.OkHttpClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import retrofit2.Retrofit;

import javax.annotation.Resource;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.time.Duration;
import java.util.List;
import java.util.Random;

import static com.theokanning.openai.service.OpenAiService.*;

/**
 * openai 配置类
 */
@Configuration
@Slf4j
public class OpenAiConfiguration {

    @Value("${open.ai.key}")
    private String openAiKey;
    /**
     * 代理相关的配置
     */
    @Value("${open.ai.proxy.host}")
    private String host;
    @Value("${open.ai.proxy.port}")
    private Integer port;
    @Value("${open.ai.proxy.proxyUsername}")
    private String proxyUsername;
    @Value("${open.ai.proxy.proxyPassword}")
    private String proxyPassword;

    @Resource
    private IAppKeyService appKeyService;

    /**
     * 超时时间
     */
    @Value("${open.ai.request.timeout}")
    private long timeout;

    @Bean
    @Scope(value = ConfigurableBeanFactory.SCOPE_PROTOTYPE, proxyMode = ScopedProxyMode.TARGET_CLASS)
    public OpenAiService openAiService() {
        ObjectMapper mapper = defaultObjectMapper();
        // 代理配置
        Proxy proxy = new Proxy(Proxy.Type.HTTP, new InetSocketAddress(host, port));
        QueryWrapper<AppKey> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("status", 0);
        queryWrapper.eq("use_status", 0);
        List<AppKey> list = appKeyService.list(queryWrapper);
        if (list.size() <= 0) {
            openAiKey = "error";
        } else {
            Random random = new Random();
            int i = random.nextInt(list.size());
            AppKey appKey = list.get(i);
            openAiKey = appKey.getKeyValue();
        }
        log.info("当前使用的key是：{}", openAiKey);
        OkHttpClient client = defaultClient(openAiKey, Duration.ofSeconds(timeout))
                .newBuilder()
                //.proxy(proxy)
                //.proxyAuthenticator(authenticator)
                .build();

        Retrofit retrofit = defaultRetrofit(client, mapper);
        OpenAiApi api = retrofit.create(OpenAiApi.class);
        return new OpenAiService(api);
    }
}