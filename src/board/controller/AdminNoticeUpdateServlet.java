package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;

/**
 * Servlet implementation class AdminNoticeUpdateServlet
 */
@WebServlet("/adminNoticeUpdate.bo")
public class AdminNoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int bId = Integer.parseInt(request.getParameter("bId"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String isFirst = request.getParameter("isFirst");
		
		Board b = new Board();
		b.setBoardCategoryId(2440);
		b.setBoardTitle(title);
		b.setBoardContent(content);
		
		if(isFirst != null && isFirst.equals("on")) {
			b.setIsFirst("Y");
		} else {
			b.setIsFirst("N");
		}
		b.setBoardCategoryName("공지사항관리");	
		b.setBoardId(bId);
		
		int result = new BoardService().updateBoard(b);
		
		if(result > 0) {
			response.sendRedirect("adminNoticeDetail.bo?bId=" + bId);
		} else {
			request.setAttribute("msg", "게시판 수정에 실패하였습니다.");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
