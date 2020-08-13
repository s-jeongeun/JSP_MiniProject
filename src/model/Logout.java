package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.UDto;

public class Logout implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		UDto udto = (UDto) session.getAttribute("loginDto");
		
		String result = null;
		
		if(udto != null) {
			session.invalidate();
			result = "login/index.jsp";
		} else {
			result = "/miniProject/board.do";
		}
		
		return result;
	}

}
