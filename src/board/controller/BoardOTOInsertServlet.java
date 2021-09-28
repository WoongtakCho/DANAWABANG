package board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.BoardAttachment;
import common.MyFileRenamePolicy;
import member.model.vo.Member;

/**
 * Servlet implementation class BoardOTOInsertServlet
 */
@WebServlet("/boardOTOInsert.bo")
public class BoardOTOInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardOTOInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			String userId = ((Member)request.getSession().getAttribute("loginUser")).getId();
			
			Board b = new Board();
			
			b.setBoardTitle(title);
			b.setBoardContent(content);
			b.setWriter(userId);
			b.setBoardCategoryId(2460);
			b.setBoardType(2);
			b.setIsFirst("N");
			b.setBoardCategoryName("1대1게시글");
			
			int result = new BoardService().insertBoard(b);
			if(result > 0) {
				response.sendRedirect("boardOTO.bo");
			} else {
				
				
				request.setAttribute("msg", "1대1 게시글 등록에 실패하였습니다.");
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
