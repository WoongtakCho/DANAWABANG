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
import board.model.vo.BoardAttachment;

/**
 * Servlet implementation class BoardPromotionDetailServlet
 */
@WebServlet("/boardPromotionDetail.bo")
public class BoardPromotionDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardPromotionDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bId = Integer.parseInt(request.getParameter("bId"));

		BoardService bService = new BoardService();
		Board board = bService.selectPBoard(bId);
		ArrayList<BoardAttachment> fileList = bService.selectThumbnail(bId);
		
		
		
		String page = null;
		if(fileList != null) {
			request.setAttribute("board", board);
			request.setAttribute("fileList", fileList);
			page = "WEB-INF/views/board/boardPromotionDetail.jsp";
		} else {
			request.setAttribute("msg", "프로모션 게시판 상세보기에 실패하였습니다.");
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
