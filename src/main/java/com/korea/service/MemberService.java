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
}
