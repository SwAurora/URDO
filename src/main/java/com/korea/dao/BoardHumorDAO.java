package com.korea.dao;

public class BoardHumorDAO extends DAO
{
    private static BoardHumorDAO instance;

    public static BoardHumorDAO getInstance()
    {
        if(instance == null)
        {
            instance = new BoardHumorDAO();
        }
        return instance;
    }

    private BoardHumorDAO()
    {

    }

}
