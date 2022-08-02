package com.korea.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.korea.controller.auth.LoginController;
import com.korea.controller.auth.LogoutController;
import com.korea.controller.board.*;
import com.korea.controller.member.*;
import com.korea.controller.urpo.ProduceController;
import com.korea.controller.urpo.UrconController;
import com.korea.controller.urpo.UrpoPurchaseController;
import com.korea.controller.urpo.UrpoReadController;

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
        list.put("/ShowInfo.do", new ShowInfoController());
        list.put("/Update.do", new UpdateController());
        list.put("/PwdUpdate.do", new PwdUpdateController());
        list.put("/Delete.do", new DeleteMemberController());

        // 게시판
        list.put("/Board/humor.do", new HumorController());
        list.put("/Board/creArt.do", new CreArtController());
        list.put("/Board/creCook.do", new CreCookController());
        list.put("/Board/regionRestaurant.do", new RegionRestaurantController());
        list.put("/Board/regionLandmark.do", new RegionLandmarkController());
        list.put("/Board/themeGame.do", new ThemeGameController());
        list.put("/Board/themeSports.do", new ThemeSportsController());
        list.put("/Board/themeMusic.do", new ThemeMusicController());
        list.put("/Board/post.do", new PostController());
        list.put("/Board/read.do", new ReadController());
        list.put("/Board/postUpdate.do", new PostUpdateController());
        list.put("/Board/delete.do", new DeleteController());
        list.put("/Board/reply.do", new ReplyController());
        list.put("/Board/replylist.do", new ReplyListController());
        list.put("/Board/replydelete.do", new ReplyDeleteController());
        list.put("/Board/rec.do", new RecController());
        list.put("/Board/recCount.do", new RecCountController());

        // 유알포
        list.put("/URPO.do", new UrconController());
        list.put("/URPO/produce.do", new ProduceController());
        list.put("/Urpo/read.do", new UrpoReadController()); //이거잘못함 ㅠ근데귀찮음
        list.put("/URPO/purchase.do", new UrpoPurchaseController());
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
