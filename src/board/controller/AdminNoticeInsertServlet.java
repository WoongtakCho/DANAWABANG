package board.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import member.model.vo.Member;

/**
 * Servlet implementation class AdminNoticeInsertServlet
 */
@WebServlet("/adminNoticeInsert.bo")
public class AdminNoticeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getId();
		String isFirst = request.getParameter("isFirst");
		
		Board b = new Board();
		b.setBoardType(1);
		b.setBoardCategoryName("공지사항관리");
		b.setBoardTitle(title);
		b.setBoardContent(content);
		b.setWriter(userId);
		if(isFirst !=null && isFirst.equals("on")) {
			b.setIsFirst("Y");
		} else {
			b.setIsFirst("N");
		}
		
		int result = new BoardService().insertBoard(b);
		
		if(result > 0) {
			response.sendRedirect("adminNotice.bo");
		} else {
			request.setAttribute("msg", "공지사항 등록에 실패하였습니다.");
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
