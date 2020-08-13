package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UDao;
import dto.UDto;

public class Login implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		
		UDto udto = new UDto();
		udto.setU_id(request.getParameter("u_id"));
		udto.setPw(request.getParameter("pw"));
		String u_id = udto.getU_id();
		
		UDao udao = UDao.getInstance();
		UDto loginDto = udao.getLogin(udto);
		
		HttpSession session = null;
		String result = null;
		
		if(loginDto != null) {
			session = request.getSession();
			session.setAttribute("loginDto", loginDto);
			session.setAttribute("u_id", u_id);
			result = "login/login.jsp";
		} else {
			result = "login/index.jsp";
		}
		return result;
	}
	
}
