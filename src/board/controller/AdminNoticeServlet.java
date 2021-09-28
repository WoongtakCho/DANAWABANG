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
 * Servlet implementation class AdminNoticeServlet
 */
@WebServlet("/adminNotice.bo")
public class AdminNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminNoticeServlet() {
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
	      
	    board.setBoardCategoryId(2440);
	    board.setBoardType(1);
	      
	    listCount = bService.getBListCount(board);
		int fNListCount =  bService.getFNListCount();
		
		pageLimit = 5;
		boardLimit = 10;
		
		maxPage = (int)Math.ceil(((double)listCount / boardLimit));
		
		startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1; 
		endPage = startPage + pageLimit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Board> nList = bService.selectNList(pi); 
	
		String page = null;
		if(nList != null) {
			page = "WEB-INF/views/board/adminNotice.jsp";
			request.setAttribute("nList", nList);
			request.setAttribute("pi", pi);
			request.setAttribute("fNListCount", fNListCount);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "공지사항 조회에 실패하였습니다.");			
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
