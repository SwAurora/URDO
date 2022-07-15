package com.korea.controller.pointshop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.korea.controller.SubController;

public class PointshopController  implements SubController{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
        try
        {
            req.getRequestDispatcher("/pointshop/pointshop.jsp").forward(req, resp);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
		
	}

}
