package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LDao;
import dto.LDto;

public class View implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		HttpSession session = request.getSession();
		
		LDao ldao = LDao.getInstance();
		LDto ldto = ldao.getInfo(idx);
		
		session.setAttribute("ldto", ldto);
		session.setAttribute("idx", idx);
		
		return "score/view.jsp";
	}

}
