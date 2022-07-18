package com.korea.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.korea.controller.auth.LoginController;
import com.korea.controller.auth.LogoutController;
import com.korea.controller.board.BoardReadController;
import com.korea.controller.board.CreArtController;
import com.korea.controller.board.HumorController;
import com.korea.controller.board.PostController;
import com.korea.controller.member.SignUpController;
import com.korea.controller.pointShop.PointShopController;

@MultipartConfig(
        fileSizeThreshold = 1024*1024*10, // 10mb
        maxFileSize = 1024*1024*50, // 50mb
        maxRequestSize = 1024*1024*100 // 100mb
)
public class FrontController extends HttpServlet
{
    HashMap<String, SubController> list = null;

    @Override
    public void init()
    {
        list = new HashMap<>();
        // 인증
        list.put("/Login.do", new LoginController());
        list.put("/Logout.do", new LogoutController());
        // 회원
        list.put("/SignUp.do", new SignUpController());
        // 게시판
        list.put("/BoardHumor.do", new HumorController());
        list.put("/BoardCreArt.do", new CreArtController());
        list.put("/BoardPost.do", new PostController());
        list.put("/BoardRead.do", new BoardReadController());
        // 포인트샵
//        list.put("/PointShop.do", new PointShopController());
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws IOException
    {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        String url = req.getRequestURI();
        SubController sub = list.get(url);

        if(sub != null)
            list.get(url).execute(req, resp);
    }
}
