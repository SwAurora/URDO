package com.korea.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.korea.controller.admin.AdminController;
import com.korea.controller.admin.NoticeController;
import com.korea.controller.auth.LoginController;
import com.korea.controller.auth.LogoutController;
import com.korea.controller.board.CreArtController;
import com.korea.controller.board.CreCookController;
import com.korea.controller.board.DeleteController;
import com.korea.controller.board.HumorController;
import com.korea.controller.board.PostController;
import com.korea.controller.board.PostUpdateController;
import com.korea.controller.board.ReadController;
import com.korea.controller.board.RecController;
import com.korea.controller.board.RecCountController;
import com.korea.controller.board.RegionLandmarkController;
import com.korea.controller.board.RegionRestaurantController;
import com.korea.controller.board.ReplyController;
import com.korea.controller.board.ReplyDeleteController;
import com.korea.controller.board.ReplyListController;
import com.korea.controller.board.ThemeGameController;
import com.korea.controller.board.ThemeMusicController;
import com.korea.controller.board.ThemeSportsController;
import com.korea.controller.member.*;
import com.korea.controller.urpo.UrconController;
import com.korea.controller.urpo.UrpoIconController;
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
        list.put("/URPO/read.do", new UrpoReadController());
        list.put("/URPO/purchase.do", new UrpoPurchaseController());
        list.put("/URPO/icon.do", new UrpoIconController());

        // 관리자
        list.put("/admin.do", new AdminController());
        list.put("/admin/notice.do", new NoticeController());
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
