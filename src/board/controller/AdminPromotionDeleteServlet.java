package board.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import board.model.service.BoardService;
import common.MyFileRenamePolicy;
import member.model.vo.Member;

/**
 * Servlet implementation class AdminPromotionDeleteServlet
 */
@WebServlet("/adminPromotionDelete.bo")
public class AdminPromotionDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPromotionDeleteServlet() {
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
			response.sendRedirect("adminPromotion.bo");
		} else {
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
			request.setAttribute("msg", "게시글 삭제에 실패했습니다.");
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
