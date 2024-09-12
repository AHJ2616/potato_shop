package com.potato.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class Re_replyPageDTO {
	
	private int re_replyCnt; // 대댓글 개수
	private List<Re_replyVO> relist; // 대댓글 리스트
}

