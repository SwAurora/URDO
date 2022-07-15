package com.korea.dto;

import lombok.Data;

/**
 * @author Administrator
 *
 */
@Data
public class MemberDTO
{
    private String id;
    private String pw;
    private String email;
    private String nickname;
    private int memberpoint;
    private int grade;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getMemberpoint() {
		return memberpoint;
	}
	public void setMemberpoint(int memberpoint) {
		this.memberpoint = memberpoint;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pw=" + pw + ", email=" + email + ", nickname=" + nickname + ", memberpoint="
				+ memberpoint + ", grade=" + grade + "]";
	}
    

}
