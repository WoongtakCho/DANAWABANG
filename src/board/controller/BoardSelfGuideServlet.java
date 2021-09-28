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
 * Servlet implementation class AdminSelfGuideServlet
 */
@WebServlet("/boardSelfGuide.bo")
public class BoardSelfGuideServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSelfGuideServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		BoardService bService = new BoardService();
	
		ArrayList<Board> boardList = bService.selectSList(1); // 게시판 리스트 가져오기
		ArrayList<BoardAttachment> fileList =  bService.selectSList(2);	
	
		String page = null;
		if(boardList != null && fileList != null) {
			request.setAttribute("boardList", boardList);
			request.setAttribute("fileList", fileList);
			page = "WEB-INF/views/board/boardSelfGuide.jsp";
		} else {
			request.setAttribute("msg", "셀프가이드 조회에 실패하였습니다.");
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
