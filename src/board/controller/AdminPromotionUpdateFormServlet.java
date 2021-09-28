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

/**
 * Servlet implementation class AdminPromotionUpdateFormServlet
 */
@WebServlet("/adminPromotionUpdateForm.bo")
public class AdminPromotionUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPromotionUpdateFormServlet() {
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
		String titleImgChangeName = request.getParameter("titleImgChangeName");
		int titleImgFileId = Integer.parseInt(request.getParameter("titleImgId"));
		String contentImg1ChangeName = request.getParameter("contentImg1ChangeName");
		int contentImg1FileId = Integer.parseInt(request.getParameter("contentImg1Id"));
		String contentImg2ChangeName = request.getParameter("contentImg2ChangeName");
		int contentImg2FileId = Integer.parseInt(request.getParameter("contentImg2Id"));
		String contentImg3ChangeName = request.getParameter("contentImg3ChangeName");
		int contentImg3FileId = Integer.parseInt(request.getParameter("contentImg3Id"));
		String content = request.getParameter("content");
		
		Board b = new Board();
		b.setBoardId(bId);
		b.setBoardTitle(title);
		b.setBoardContent(content);
		b.setBoardCategoryId(2430);
		b.setBoardCategoryName("프로모션관리");
		b.setBoardType(2);
		
		ArrayList<BoardAttachment> fileList = new ArrayList<BoardAttachment>();
		
		BoardAttachment ba = new BoardAttachment();
		ba.setChangeName(titleImgChangeName);	
		ba.setFileId(titleImgFileId);
		BoardAttachment ba2 = new BoardAttachment();
		ba2.setChangeName(contentImg1ChangeName);
		ba2.setFileId(contentImg1FileId);
		BoardAttachment ba3 = new BoardAttachment();
		ba3.setChangeName(contentImg2ChangeName);
		ba3.setFileId(contentImg2FileId);
		BoardAttachment ba4 = new BoardAttachment();
		ba4.setChangeName(contentImg3ChangeName);
		ba4.setFileId(contentImg3FileId);
		
		fileList.add(ba);
		fileList.add(ba2);
		fileList.add(ba3);
		fileList.add(ba4);
	
		request.setAttribute("b", b);
		request.setAttribute("fileList", fileList);
		request.getRequestDispatcher("WEB-INF/views/board/adminPromotionUpdate.jsp").forward(request, response);
}
		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
