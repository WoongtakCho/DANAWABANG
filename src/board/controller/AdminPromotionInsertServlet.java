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
 * Servlet implementation class AdminPromotionInsertServlet
 */
@WebServlet("/adminPromotionInsert.bo")
public class AdminPromotionInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPromotionInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 2000*2000*10; 
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			String savePath = root + "thumbnail_uploadFiles/";
			
			File f = new File(savePath);
			if(!f.exists()) {
				f.mkdirs();
			}
			
			MultipartRequest multipartRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multipartRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				
				if(multipartRequest.getFilesystemName(name) != null) {
					saveFiles.add(multipartRequest.getFilesystemName(name));
					originFiles.add(multipartRequest.getOriginalFileName(name));					
				}
			}
			
			String title = multipartRequest.getParameter("title");
			String content = multipartRequest.getParameter("content");
			String writer = ((Member) request.getSession().getAttribute("loginUser")).getId();
			
			Board b = new Board();
			b.setBoardType(2);
			b.setBoardCategoryId(2430);
			b.setBoardTitle(title);
			b.setBoardContent(content);
			b.setIsFirst("N");
			b.setBoardCategoryName("프로모션관리");
			b.setWriter(writer);
			
			ArrayList<BoardAttachment> fileList = new ArrayList<BoardAttachment>();
			for(int i = originFiles.size()-1; i >= 0; i--) {
				BoardAttachment a = new BoardAttachment();
				a.setFilePath(savePath);
				a.setOriginName(originFiles.get(i));
				a.setChangeName(saveFiles.get(i));
				
				if(i == originFiles.size()-1) {
					a.setFileLevel(0);
				} else {
					a.setFileLevel(1);
				}		
				fileList.add(a);	
			}
			int result = new BoardService().insertThumbnail(b, fileList);
			
			if(result>0) {
				response.sendRedirect("adminPromotion.bo");
			} else {
				for(int i = 0; i< saveFiles.size(); i++) {
					File fail = new File(savePath + saveFiles.get(i));
					fail.delete();
				}
				
				request.setAttribute("msg", "프로모션 게시판 등록에 실패하였습니다.");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
			}
			
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
