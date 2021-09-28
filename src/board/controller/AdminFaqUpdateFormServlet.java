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
 * Servlet implementation class AdminFaqUpdateFormServlet
 */
@WebServlet("/adminFaqUpdateForm.me")
public class AdminFaqUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFaqUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String category = request.getParameter("faqCategory");
		int id = Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		Board b = new Board();
		b.setBoardCategoryName(category);
		b.setBoardTitle(title);
		b.setBoardId(id);
		b.setBoardContent(content);
		b.setBoardType(1);
		
		switch(category) {
		case "주문/결제" : b.setBoardCategoryId(2451); break;
		case "배송관련" : b.setBoardCategoryId(2452); break;
		case "취소/환불" : b.setBoardCategoryId(2453); break;
		case "회원정보변경" : b.setBoardCategoryId(2454); break;
		case "서비스/기타" : b.setBoardCategoryId(2455); break;
		}
		
		request.setAttribute("b", b);
		request.getRequestDispatcher("WEB-INF/views/board/adminFaqUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
