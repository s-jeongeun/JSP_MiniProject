package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UDao;
import dto.UDto;


public class SignUp implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		
		UDto udto = new UDto();
		udto.setU_id(request.getParameter("u_id"));
		udto.setPw(request.getParameter("pw"));

		UDao udao = UDao.getInstance();
		int result = udao.getInsert(udto);
		request.setAttribute("result", result);
		
		return "login/signUp_result.jsp";
	}
	
}
