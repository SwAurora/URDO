package com.korea.dto;

import lombok.Data;

@Data
public class MemberDTO
{
    private String id;
    private String pw;
    private String email;
    private String nickname;
    private int point;
    private int grade;
}
