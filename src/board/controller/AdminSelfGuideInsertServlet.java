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
import com.sun.xml.internal.ws.api.message.Attachment;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.BoardAttachment;
import common.MyFileRenamePolicy;
import member.model.vo.Member;

/**
 * Servlet implementation class AdminSelfGuideInsertServlet
 */
@WebServlet("/adminSelfGuideInsert.bo")
public class AdminSelfGuideInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSelfGuideInsertServlet() {
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
			String savePath = root + "selfGuide_uploadFiles/";
			
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
			String category = multipartRequest.getParameter("selfGuideCategory");
			String userId = ((Member)request.getSession().getAttribute("loginUser")).getId();
			
			Board b = new Board();
			b.setBoardType(2);
			b.setBoardCategoryName(category);
			b.setBoardTitle(title);
			b.setBoardContent("null");
			b.setWriter(userId);
			b.setIsFirst("N");
			
			switch(category) {
			case "계획하기" : b.setBoardCategoryId(2421); break;
			case "조명" : b.setBoardCategoryId(2422); break;
			case "공간배치" : b.setBoardCategoryId(2423); break;
			case "수납정리" : b.setBoardCategoryId(2424); break;
			case "페브릭" : b.setBoardCategoryId(2425); break;
			}
			
			ArrayList<BoardAttachment> fileList = new ArrayList<BoardAttachment>();
			
			for(int i = originFiles.size()-1; i >= 0; i--) {	
				BoardAttachment ba = new BoardAttachment();
				ba.setFilePath(savePath);
				ba.setOriginName(originFiles.get(i));	
				ba.setChangeName(saveFiles.get(i));
				
				if(i == originFiles.size()-1) {
					ba.setFileLevel(0);  	
				} else {
					ba.setFileLevel(1); 		
				}
				
				fileList.add(ba);
			}
			 int result = new BoardService().insertThumbnail(b, fileList);
			 if(result > 0) {
				 response.sendRedirect("adminSelfGuide.bo");
			 } else {	
				 for(int i = 0; i < saveFiles.size(); i++) {
					 File fail = new File(savePath + saveFiles.get(i));
					 fail.delete();
				 }
				
				request.setAttribute("msg", "셀프가이드 게시글 등록에 실패하였습니다.");
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
