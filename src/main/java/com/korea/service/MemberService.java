package com.korea.service;

import com.korea.dao.MemberDAO;
import com.korea.dto.MemberDTO;
import org.mindrot.jbcrypt.BCrypt;

public class MemberService
{
    MemberDAO dao = MemberDAO.getInstance();

    private static MemberService instance = null;
    public static MemberService getInstance()
    {
        if(instance == null)
        {
            instance = new MemberService();
        }
        return instance;
    }

    private MemberService()
    {

    }

    public boolean MemberInsert(MemberDTO dto)
    {
        String pw = BCrypt.hashpw(dto.getPw(), BCrypt.gensalt());
        dto.setPw(pw);
        return dao.insert(dto);
    }

    public MemberDTO MemberSearch(String id)
    {
        return dao.Select(id);
    }


    public boolean UpdateEmail(String id, String email)
    {
        return dao.UpdateEmail(id, email);
    }

    public boolean UpdateNickName(String id, String nickname)
    {
        return dao.UpdateNickName(id, nickname);
    }

    public boolean UpdatePassword(String id, String password)
    {
        return dao.UpdatePassword(id, password);
    }

    public boolean DeleteMember(String id)
    {
        return dao.DeleteMember(id);
    }
    
    // 댓글아이콘 등록
    public boolean replyIcon(int no, String id) {
    	return dao.replyIcon(no, id);
    }
    
    // 포인트 증가
    public boolean getPoint(int no, String id) {
    	return dao.getPoint(no, id);
    }
    
    // 아이디 중복체크
    public int checkId(String id) {
    	return dao.checkId(id);
    }
    
    // 닉네임 중복체크
    public int checkNickname(String nickname) {
    	return dao.checkNickname(nickname);
    }
    // 이메일 중복체크
    public int checkEmail(String email) {
    	return dao.checkEmail(email);
    }
    
    public String checkEmail(String email)
    {
        return dao.checkEmail(email);
    }
}
