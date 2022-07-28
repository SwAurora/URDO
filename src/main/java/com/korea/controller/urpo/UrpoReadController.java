package com.korea.controller.urpo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.korea.controller.SubController;
import com.korea.dto.UrpoDTO;
import com.korea.service.UrpoService;

public class UrpoReadController implements SubController{

	UrpoService service = UrpoService.getInstance();
	UrpoDTO dto = new UrpoDTO();
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		try {
			String no = req.getParameter("no");
			dto = service.Select(Integer.parseInt(no));
			req.setAttribute("dto", dto);
            req.getRequestDispatcher("/URPO/urconRead.jsp").forward(req, resp);
        } catch(Exception e) {
            e.printStackTrace();
        }
	}

}
