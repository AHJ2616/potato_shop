package com.potato.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ReplyPageDTO {
	
	private int replyCnt; // 댓글 개수
	private List<ReplyVO> list; // 게시물 리스트
}
