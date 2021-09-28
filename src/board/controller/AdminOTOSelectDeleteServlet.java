package board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;

/**
 * Servlet implementation class AdminOTOSelectDeleteServlet
 */
@WebServlet("/adminOTOSelectDelete.bo")
public class AdminOTOSelectDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOTOSelectDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boards = request.getParameter("checkBoards");
		
		String[] board = boards.split(",");
		System.out.println(board);
		for(int i = 0 ; i < board.length ; i++) {
			System.out.println(board[i]);
		}
//		게시글 번호 잘 가져오는지 확인
		
		int result = new BoardService().deleteBoards(board);
		
		if(result == board.length) {
			response.sendRedirect("adminOTO.bo");
		} else {
			request.setAttribute("msg", "회원 삭제에 실패하였습니다");
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
