package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.LDao;
import dto.LDto;

public class InsertList implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		
		String realPath = request.getServletContext().getRealPath("/upload");
		MultipartRequest mr = null;
		
		try {
			 mr = new MultipartRequest(
				request,
				realPath,
				1024 * 1024 * 10,
				"UTF-8",
				new DefaultFileRenamePolicy()					
			);
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		LDto ldto = new LDto();
		if(mr.getFile("img") == null ) {
			ldto.setImg("");
		} else {
			ldto.setImg(mr.getFilesystemName("img"));
		}
		ldto.setTitle(mr.getParameter("title"));
		ldto.setScore(mr.getParameter("score"));
		ldto.setU_id(mr.getParameter("u_id"));
		ldto.setU_comment(mr.getParameter("comment"));
		ldto.setIp(request.getRemoteAddr());		
		
		LDao ldao = LDao.getInstance();
		int result = ldao.getInsert(ldto);
		
		request.setAttribute("result", result);
		request.setAttribute("u_id",request.getParameter("u_id"));
		
		return "score/insert_result.jsp";
	}

	
}
