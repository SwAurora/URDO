package com.korea.dao;

public class board_humorDAO extends DAO
{
    private static board_humorDAO instance;

    public static board_humorDAO getInstance()
    {
        if(instance == null)
        {
            instance = new board_humorDAO();
        }
        return instance;
    }

    private board_humorDAO()
    {
        super();

    }

}
