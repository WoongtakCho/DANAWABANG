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
 * Servlet implementation class AdminPromotionUpdateServlet
 */
@WebServlet("/adminPromotionUpdate.bo")
public class AdminPromotionUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminPromotionUpdateServlet() {
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
			int count = 3;
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				if(multipartRequest.getFilesystemName(name) != null) {				
					saveFiles.add(multipartRequest.getFilesystemName(name));
					originFiles.add(multipartRequest.getOriginalFileName(name));	
				} else {
					ArrayList<BoardAttachment> list = new BoardService().selectThumbnail(Integer.parseInt(multipartRequest.getParameter("bId")));	
					saveFiles.add(list.get(count).getChangeName());
					originFiles.add(list.get(count).getOriginName());
				}
				count--;
			}
					
			int bId = Integer.parseInt(multipartRequest.getParameter("bId"));
			String title = multipartRequest.getParameter("title");
			String content = multipartRequest.getParameter("content");
			
			Board b = new Board();
			b.setBoardId(bId);
			b.setBoardType(2);
			b.setBoardCategoryId(2430);
			b.setBoardTitle(title);
			b.setBoardContent(content);
			b.setIsFirst("N");
			b.setBoardCategoryName("프로모션관리");
			
			ArrayList<BoardAttachment> fileList = new ArrayList<BoardAttachment>();
			int titleImgId = Integer.parseInt(multipartRequest.getParameter("titleImgId"));
			int contentImg1Id = Integer.parseInt(multipartRequest.getParameter("contentImg1Id"));
			int contentImg2Id = Integer.parseInt(multipartRequest.getParameter("contentImg2Id"));
			int contentImg3Id = Integer.parseInt(multipartRequest.getParameter("contentImg3Id"));
			
			for(int i = originFiles.size()-1; i >= 0; i--) {	
				BoardAttachment ba = new BoardAttachment();
				ba.setFilePath(savePath);
				ba.setOriginName(originFiles.get(i));	
				ba.setChangeName(saveFiles.get(i));
				
				if(i == originFiles.size()-1) {
					ba.setFileLevel(0);
					ba.setFileId(titleImgId);
				} else if(i == originFiles.size()-2){
					ba.setFileLevel(1); 		
					ba.setFileId(contentImg1Id);
				} else if(i == originFiles.size()-3) {
					ba.setFileLevel(1); 		
					ba.setFileId(contentImg2Id);
				} else {
					ba.setFileLevel(1); 		
					ba.setFileId(contentImg3Id);
				}
				
				fileList.add(ba);
			}
			
			int result = new BoardService().updateThumbnail(b, fileList);
			
			if(result>0) {
				response.sendRedirect("adminPromotionDetail.bo?bId=" + bId);
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
