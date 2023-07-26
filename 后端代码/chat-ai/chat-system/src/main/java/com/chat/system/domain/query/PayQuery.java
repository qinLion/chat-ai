package com.chat.system.domain.query;

import lombok.Data;

import java.io.Serializable;

@Data
public class PayQuery implements Serializable {

    private String receipt;

    private String productId;

}
