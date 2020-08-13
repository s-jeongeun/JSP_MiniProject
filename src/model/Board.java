package model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.LDao;
import dto.LDto;

public class Board implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		String u_id = (String) session.getAttribute("u_id");
		
		LDao ldao = LDao.getInstance();
		List<LDto> list = ldao.getAllList(u_id);
		request.setAttribute("list", list);
		
		return "score/board.jsp";
	}

}
