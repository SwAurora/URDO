package com.korea.controller.pointShop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.korea.controller.SubController;

public class PointShopController implements SubController{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
        try
        {
            req.getRequestDispatcher("/pointshop/pointShop.jsp").forward(req, resp);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
		
	}

}
