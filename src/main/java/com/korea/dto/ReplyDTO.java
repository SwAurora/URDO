package com.korea.dto;

import lombok.Data;

@Data
public class ReplyDTO {
	private int no;
	private int boardNo;
	private String memberId;
	private String writer;
	private String content;
	private String regdate;
}
