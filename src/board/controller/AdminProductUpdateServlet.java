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
import board.model.vo.BoardAttachment;
import board.model.vo.Product;
import board.model.vo.ProductAttachment;
import board.model.vo.ProductOption;
import common.MyFileRenamePolicy;

/**
 * Servlet implementation class AdminProductUpdateServlet
 */
@WebServlet("/adminProductUpdate.bo")
public class AdminProductUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductUpdateServlet() {
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
					ArrayList<ProductAttachment> list = new BoardService().selectProductThumbnail(Integer.parseInt(multipartRequest.getParameter("pId")));	
					saveFiles.add(list.get(count).getProductChangeName());
					originFiles.add(list.get(count).getProductOriginName());
				}
				count--;
			}
					
			Product p = new Product();
			int pId = Integer.parseInt(multipartRequest.getParameter("pId"));
			p.setProductId(pId);
			p.setProductName(multipartRequest.getParameter("name"));
			
			String category = multipartRequest.getParameter("category"); 
			switch(category) {
			case "침대" : p.setProductCategoryId(1); break;
			case "매트리스" : p.setProductCategoryId(2); break;
			case "서랍장" : p.setProductCategoryId(3); break;
			case "커튼" : p.setProductCategoryId(4); break;
			case "조명" : p.setProductCategoryId(5); break;
			case "행거" : p.setProductCategoryId(6); break;
			}
			
			p.setProductBrand(multipartRequest.getParameter("brand"));
			p.setProductPrice(Integer.parseInt(multipartRequest.getParameter("price")));
			p.setProductSize(multipartRequest.getParameter("size"));
			p.setProductDeliveryFee(Integer.parseInt(multipartRequest.getParameter("deliveryFee")));
			p.setProductDiscountRate(Double.parseDouble(multipartRequest.getParameter("discount")));
			p.setProductTip(multipartRequest.getParameter("tip"));
			p.setProductContent(multipartRequest.getParameter("content"));
			
			ArrayList<ProductOption> optionList = new ArrayList<ProductOption>();
			String[] options = multipartRequest.getParameterValues("options");
			String[] optionsAmount = multipartRequest.getParameterValues("optionsAmount");
			String[] pOId =  multipartRequest.getParameterValues("pOId");
			int productAmount = 0;
			for(int i = 0; i < options.length; i++) {
				ProductOption po = new ProductOption();
				if(!options[i].trim().equals("") && !optionsAmount[i].trim().equals("")) {
					po.setProductOptionValue(options[i]);
					po.setProductOptionAmount(Integer.parseInt(optionsAmount[i]));
					productAmount += Integer.parseInt(optionsAmount[i]);
					po.setProductOptionId(Integer.parseInt(pOId[i]));
					optionList.add(po);
				}
			}
			p.setProductAmount(productAmount);
			
			String status = multipartRequest.getParameter("productStatus");
			if(status != null && status.equals("on")) {
				p.setProductStatus("SALES");
			} else {
				p.setProductStatus("SOLDOUT");
			}
			
			ArrayList<ProductAttachment> fileList = new ArrayList<ProductAttachment>();
			int titleImgId = Integer.parseInt(multipartRequest.getParameter("titleImgId"));
			int contentImg1Id = Integer.parseInt(multipartRequest.getParameter("contentImg1Id"));
			int contentImg2Id = Integer.parseInt(multipartRequest.getParameter("contentImg2Id"));
			int contentImg3Id = Integer.parseInt(multipartRequest.getParameter("contentImg3Id"));
			
			for(int i = originFiles.size()-1; i >= 0; i--) {	
				ProductAttachment ba = new ProductAttachment();
				ba.setProductFilePath(savePath);
				ba.setProductOriginName(originFiles.get(i));	
				ba.setProductChangeName(saveFiles.get(i));
				
				if(i == originFiles.size()-1) {
					ba.setProductFileLevel(0);
					ba.setProductFileId(titleImgId);
				} else if(i == originFiles.size()-2){
					ba.setProductFileLevel(1); 		
					ba.setProductFileId(contentImg1Id);
				} else if(i == originFiles.size()-3) {
					ba.setProductFileLevel(1); 		
					ba.setProductFileId(contentImg2Id);
				} else {
					ba.setProductFileLevel(1); 		
					ba.setProductFileId(contentImg3Id);
				}
				
				fileList.add(ba);
			}
			
			int result = new BoardService().updateProductThumbnail(p, fileList, optionList);
			if(result>0) {
				response.sendRedirect("adminProductDetail.bo?pId=" + pId);
			} else {
				for(int i = 0; i< saveFiles.size(); i++) {
					File fail = new File(savePath + saveFiles.get(i));
					fail.delete();
				}
				
				request.setAttribute("msg", "상품 게시판 등록에 실패하였습니다.");
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
