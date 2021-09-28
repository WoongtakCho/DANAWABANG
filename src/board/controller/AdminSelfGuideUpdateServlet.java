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
@WebServlet("/adminSelfGuideUpdate.bo")
public class AdminSelfGuideUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSelfGuideUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 1500*20000*20;
			
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
			int count = 5;
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				if(multipartRequest.getFilesystemName(name) != null) {				
					saveFiles.add(multipartRequest.getFilesystemName(name));
					originFiles.add(multipartRequest.getOriginalFileName(name));	
				} else {
					// 뷰에서 사진 수정을 안 했다면 보드 아이디 이용해서 파일 값 불러오고 저장하기 
					ArrayList<BoardAttachment> list = new BoardService().selectThumbnail(Integer.parseInt(multipartRequest.getParameter("bId")));
					saveFiles.add(list.get(count).getChangeName());
					originFiles.add(list.get(count).getOriginName());
				}
				count--;
			}
			
//		
			ArrayList<BoardAttachment> fileList = new ArrayList<BoardAttachment>();
			int titleImgId = Integer.parseInt(multipartRequest.getParameter("titleImgId"));
			int contentImg1Id = Integer.parseInt(multipartRequest.getParameter("contentImg1Id"));
			int contentImg2Id = Integer.parseInt(multipartRequest.getParameter("contentImg2Id"));
			int contentImg3Id = Integer.parseInt(multipartRequest.getParameter("contentImg3Id"));
			int contentImg4Id = Integer.parseInt(multipartRequest.getParameter("contentImg4Id"));
			int contentImg5Id = Integer.parseInt(multipartRequest.getParameter("contentImg5Id"));
			
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
				} else if(i == originFiles.size()-4){
					ba.setFileLevel(1); 		
					ba.setFileId(contentImg3Id);
				} else if(i == originFiles.size()-5) {
					ba.setFileLevel(1); 		
					ba.setFileId(contentImg4Id);
				} else {
					ba.setFileLevel(1); 		
					ba.setFileId(contentImg5Id);
				}
				
				fileList.add(ba);
			}
			
			int bId = Integer.parseInt(multipartRequest.getParameter("bId"));
			String title = multipartRequest.getParameter("title");
			String category = multipartRequest.getParameter("selfGuideCategory");
			String userId = ((Member)request.getSession().getAttribute("loginUser")).getId();
			
			Board b = new Board();
			b.setBoardId(bId);
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
			
			 int result = new BoardService().updateThumbnail(b, fileList);
			 if(result > 0) {
				 response.sendRedirect("adminSelfGuideDetail.bo?bId=" + bId);
			 } else {	
				 for(int i = 0; i < saveFiles.size(); i++) {
					 File fail = new File(savePath + saveFiles.get(i));
					 fail.delete();
				 }
				
				request.setAttribute("msg", "셀프가이드 게시글 수정에 실패하였습니다.");
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
