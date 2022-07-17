package com.korea.dto;

import lombok.Data;

@Data
public class BoardDTO
{
    private int no;
    private String subject;
    private String title;
    private String content;
    private String writer;
    private String date;
    private int views;
    private int recommend;
    private String filename;
    private int available;
}
