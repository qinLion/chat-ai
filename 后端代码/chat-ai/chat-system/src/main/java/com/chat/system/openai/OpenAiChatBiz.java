package com.chat.system.openai;

import com.chat.system.websocket.WebSocketService;
import com.theokanning.openai.completion.chat.ChatCompletionChunk;
import com.theokanning.openai.completion.chat.ChatCompletionRequest;
import com.theokanning.openai.completion.chat.ChatMessage;
import com.theokanning.openai.service.OpenAiService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.websocket.Session;
import java.util.List;


@Slf4j
@Service
public class OpenAiChatBiz {

    @Value("${open.ai.model}")
    private String openAiModel;

    @Resource
    private OpenAiService openAiService;

    @Resource
    private WebSocketService webSocketService;

    /**
     * 聊天
     */
    public String chat(List<ChatMessage> messages, Session session) {
        StringBuilder contents = new StringBuilder();
        try {
            // 定义聊天的请求实体类
            ChatCompletionRequest completionRequest = ChatCompletionRequest.builder()
                    .model(openAiModel)
                    .temperature(0.7D)
                    .messages(messages)
                    .maxTokens(2000)
                    .stream(true)
                    .build();
            // 流式返回
            openAiService.streamChatCompletion(completionRequest)
                    .blockingForEach(chatCompletionChunk -> getStreamMessage(chatCompletionChunk, contents, session));
            return contents.toString();
        } catch (Exception e) {
            e.printStackTrace();
            return contents.toString();
        }

    }

    public void getStreamMessage(ChatCompletionChunk chatCompletionChunk, StringBuilder contents, Session session) throws Exception {
        String content = chatCompletionChunk.getChoices().get(0).getMessage().getContent();
        if (content != null) {
            // 用户主动断开连接则抛出异常，停止继续生成
            if (!WebSocketService.CLIENTS.containsValue(session)) {
                throw new Exception();
            }
            // 最终处理好的消息
            String sendApp = "";
            // 将两个空格替换成一个空格
            if (content.contains("\n\n")) {
                sendApp = content.replace("\n\n", "\n");
                contents.append(sendApp);
            } else {
                sendApp = content;
                contents.append(content);
            }
            webSocketService.sendMessage(sendApp, session);
        }
    }

}