package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.service.BoardService;
import board.model.vo.Board;
import member.model.vo.Member;

/**
 * Servlet implementation class AdminFaqInsertServlet
 */
@WebServlet("/adminFaqInsert.me")
public class AdminFaqInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminFaqInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String category = request.getParameter("faqCategory");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		HttpSession session = request.getSession();
		Member loginUser = (Member) session.getAttribute("loginUser");
		String userId = loginUser.getId();
				
		
		Board b= new Board();
		b.setBoardType(1);
		b.setBoardCategoryName(category);
		b.setBoardTitle(title);
		b.setBoardContent(content);
		b.setWriter(userId);
		b.setIsFirst("N");
		
		switch(category) {
		case "주문/결제" : b.setBoardCategoryId(2451); break;
		case "배송관련" : b.setBoardCategoryId(2452); break;
		case "취소/환불" : b.setBoardCategoryId(2453); break;
		case "회원정보변경" : b.setBoardCategoryId(2454); break;
		case "서비스/기타" : b.setBoardCategoryId(2455); break;
		}
		
		int result = new BoardService().insertBoard(b);
		
		if(result>0) {
			response.sendRedirect("adminFaq.me?currentPage=1");
		} else {
			request.setAttribute("msg", "게시글 작성에 실패하였습니다.");
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
