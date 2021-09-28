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

import board.model.vo.Board;
import board.model.vo.BoardAttachment;
import common.MyFileRenamePolicy;

/**
 * Servlet implementation class BoardOTOUpdateFormServlet
 */
@WebServlet("/boardOTOUpdateForm.bo")
public class BoardOTOUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardOTOUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
			
			int bId = Integer.parseInt(request.getParameter("bId"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			Board b = new Board();
			b.setBoardId(bId);
			b.setBoardTitle(title);
			b.setBoardContent(content);
			b.setBoardType(2);
			
			
			request.setAttribute("board", b);
			request.getRequestDispatcher("WEB-INF/views/board/boardOTOUpdateForm.jsp").forward(request, response);
		}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
