package com.korea.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DAO
{
//    String id = "root";
//    String pw = "1234";

     String id = "manager";
     String pw = "1234";
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
