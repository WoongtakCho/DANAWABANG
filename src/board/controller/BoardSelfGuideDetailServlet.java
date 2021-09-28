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
 * Servlet implementation class BoardSelfGuideDetailServlet
 */
@WebServlet("/boardSelfGuideDetail.bo")
public class BoardSelfGuideDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSelfGuideDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bId = Integer.parseInt(request.getParameter("bId"));
		
		BoardService bService = new BoardService();
		Board board = bService.selectSBoard(bId);
		ArrayList<BoardAttachment> fileList = bService.selectThumbnail(bId);
		
		String page = null;
		if(board != null) {
			request.setAttribute("board", board);
			request.setAttribute("fileList", fileList);
			page = "WEB-INF/views/board/boardSelfGuideDetail.jsp";
		} else {
			request.setAttribute("msg", "셀프가이드 상세조회에 실패하였습니다.");
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
