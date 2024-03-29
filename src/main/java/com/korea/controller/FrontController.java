package com.korea.controller;

import com.korea.controller.admin.*;
import com.korea.controller.auth.*;
import com.korea.controller.board.*;
import com.korea.controller.member.*;
import com.korea.controller.mini.*;
import com.korea.controller.urpo.*;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

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

        // 메인
        list.put("/main.do", new MainController());

        // 인증
        list.put("/Login.do", new LoginController());
        list.put("/Logout.do", new LogoutController());

        // 회원
        list.put("/SignUp.do", new SignUpController());
        list.put("/ShowInfo.do", new ShowInfoController());
        list.put("/Update.do", new UpdateController());
        list.put("/PwdUpdate.do", new PwdUpdateController());
        list.put("/Delete.do", new DeleteMemberController());
        list.put("/EmailCheck.do", new EmailCheckController());
        list.put("/NicknameCheck.do", new NicknameCheckController());
        list.put("/PwdFinder.do", new PwdFinderController());

        // 게시판
        list.put("/Board/bestNow.do", new BestNowController());
        list.put("/Board/bestMonth.do", new BestMonthController());
        list.put("/Board/humor.do", new HumorController());
        list.put("/Board/creArt.do", new CreArtController());
        list.put("/Board/creCook.do", new CreCookController());
        list.put("/Board/regionRestaurant.do", new RegionRestaurantController());
        list.put("/Board/regionLandmark.do", new RegionLandmarkController());
        list.put("/Board/themeGame.do", new ThemeGameController());
        list.put("/Board/themeSports.do", new ThemeSportsController());
        list.put("/Board/themeMusic.do", new ThemeMusicController());
        list.put("/Board/read.do", new ReadController());
        list.put("/Board/post.do", new PostController());
        list.put("/Board/postUpdate.do", new PostUpdateController());
        list.put("/Board/delete.do", new DeleteController());
        list.put("/Board/reply.do", new ReplyController());
        list.put("/Board/replylist.do", new ReplyListController());
        list.put("/Board/replydelete.do", new ReplyDeleteController());
        list.put("/Board/rec.do", new RecController());
        list.put("/Board/recCount.do", new RecCountController());
        list.put("/Board/search.do", new SearchController());

        // 유알포
        list.put("/URPO.do", new UrconController());
        list.put("/URPO/read.do", new UrpoReadController());
        list.put("/URPO/purchase.do", new UrpoPurchaseController());
        list.put("/URPO/icon.do", new UrpoIconController());
        list.put("/URPO/search.do", new UrpoSearchController());
        list.put("/URPO/guide.do", new UrpoGuideController());

        // 관리자
        list.put("/admin/notice.do", new NoticeController());
        list.put("/admin/banner.do", new BannerController());
        list.put("/admin/board.do", new BoardController());

        // 미니 홈피
        list.put("/mini/mini_index.do", new miniIndexController());
        list.put("/mini/mini_guest.do", new miniGuestController());
        list.put("/mini/mini_album.do", new miniAlbumController());
        list.put("/mini/mini_juk.do", new miniJukController());
        list.put("/mini/mini_snake.do", new miniSnakeController());

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
