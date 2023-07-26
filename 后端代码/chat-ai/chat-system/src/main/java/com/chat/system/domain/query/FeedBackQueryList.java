package com.chat.system.domain.query;

import lombok.Data;

import java.io.Serializable;
import java.util.List;

@Data
public class FeedBackQueryList implements Serializable {

    private static final long serialVersionUID = 1L;

    private List<FeedBackQuery> feedBackList;
}
