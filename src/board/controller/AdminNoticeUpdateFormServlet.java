package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.vo.Board;

/**
 * Servlet implementation class AdminUpdateServlet
 */
@WebServlet("/adminNoticeUpdateForm.bo")
public class AdminNoticeUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String title = request.getParameter("title");
		int bId = Integer.parseInt(request.getParameter("bId"));
		String content = request.getParameter("content");
		String isFirst = request.getParameter("isFirst");
		
		Board board = new Board();
		board.setBoardId(bId);
		board.setBoardTitle(title);
		board.setBoardContent(content);
		board.setIsFirst(isFirst);
		
		request.setAttribute("board", board);
		request.getRequestDispatcher("WEB-INF/views/board/adminNoticeUpdateForm.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
