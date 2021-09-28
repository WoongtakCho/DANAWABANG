package board.controller;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.dao.BoardDAO;
import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.BoardAttachment;

/**
 * Servlet implementation class AdminPromotionDetailServlet
 */
@WebServlet("/adminPromotionDetail.bo")
public class AdminPromotionDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPromotionDetailServlet() {
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
			page = "WEB-INF/views/board/adminPromotionDetail.jsp";
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
