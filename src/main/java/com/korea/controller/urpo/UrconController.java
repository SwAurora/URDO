package com.korea.controller.urpo;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.korea.controller.SubController;
import com.korea.dto.UrpoDTO;
import com.korea.service.UrpoService;

public class UrconController implements SubController
{
	UrpoService service = UrpoService.getInstance();
    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
    	String category = "urcon";
        try {
        	List<UrpoDTO> list = service.ShowItems(category);
            req.setAttribute("list", list);
            for(int i=0; i<list.size(); i++) {
            	System.out.println(list.get(i).getGifImage());
            }
            req.getRequestDispatcher("/URPO/urcon.jsp").forward(req, resp);
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
