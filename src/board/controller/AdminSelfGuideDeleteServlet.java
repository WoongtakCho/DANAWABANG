package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.BoardAttachment;

/**
 * Servlet implementation class AdminSelfGuideDeleteServlet
 */
@WebServlet("/adminSelfGuideDelete.bo")
public class AdminSelfGuideDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSelfGuideDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bId = Integer.parseInt(request.getParameter("bId"));

		int result = new BoardService().deleteThumbnail(bId);
		
		if(result > 0) {
			response.sendRedirect("adminSelfGuide.bo");
		} else {
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
			request.setAttribute("msg", "셀프가이드 게시글 삭제에 실패하였습니다.");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method sztub
		doGet(request, response);
	}

}
