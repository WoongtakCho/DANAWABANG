package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.BoardAttachment;
import board.model.vo.Board;
import board.model.vo.PageInfo;

/**
 * Servlet implementation class AdminPromotionServlet
 */
@WebServlet("/adminPromotion.bo")
public class AdminPromotionServlet extends HttpServlet implements Servlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPromotionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit; 
		int maxPage; 
		int startPage; 
		int endPage; 
		
		BoardService bService = new BoardService();

		Board board = new Board();
		board.setBoardCategoryId(2430);
		board.setBoardType(2);
		
		listCount = bService.getBListCount(board);

		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		pageLimit = 5;
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Board> bList = bService.selectPList(pi);
		ArrayList<BoardAttachment> fList = bService.selectThumbnailList();

		String page = null;
		if(bList != null && fList != null) {
			request.setAttribute("bList", bList);
			request.setAttribute("fList", fList);
			request.setAttribute("pi", pi);
			page = "WEB-INF/views/board/adminPromotion.jsp";
		} else {
			request.setAttribute("msg", "프로모션 게시판 조회에 실패하였습니다.");
			page = "WEB-INF/views/common/errorPage.jsp";
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
