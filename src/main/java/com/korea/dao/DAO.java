package com.korea.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DAO
{
     String id = "manager";
     String pw = "Dbdkfeh1!";
    String url = "jdbc:mysql://localhost:3306/urdo";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    DAO()
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(url, id, pw);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
