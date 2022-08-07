package com.korea.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.korea.controller.SubController;

public class BoardController implements SubController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		try
        {
            req.getRequestDispatcher("/WEB-INF/admin/board.jsp").forward(req, resp);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
		
	}

}
