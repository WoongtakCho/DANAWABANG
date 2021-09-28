package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.PageInfo;

/**
 * Servlet implementation class AdminSelfGuideServlet
 */
@WebServlet("/adminSelfGuide.bo")
public class AdminSelfGuideServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSelfGuideServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;
		int listCount;
		int pageLimit;
		int boardLimit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		} 
		
		BoardService bService = new BoardService();
		Board board = new Board();
		Board board2 = new Board();
		
		board.setBoardCategoryId(2421);
		board2.setBoardCategoryId(2425);
		board.setBoardType(2);
		
		listCount = bService.getBsListCount(board, board2);
		
		pageLimit = 5;
		boardLimit = 10;
		
		maxPage = (int)Math.ceil(((double)listCount / boardLimit));
		
		startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1; 
		endPage = startPage + pageLimit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Board> sList = bService.selectSList(pi); 
	
		String page = null;
		if(sList != null) {
			page = "WEB-INF/views/board/adminSelfGuide.jsp";
			request.setAttribute("sList", sList);
			request.setAttribute("pi", pi);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "셀프가이드 조회에 실패하였습니다.");			
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
