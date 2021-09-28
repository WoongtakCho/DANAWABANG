package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.vo.BoardAttachment;
import board.model.vo.Product;
import board.model.vo.ProductAttachment;
import board.model.vo.ProductOption;

/**
 * Servlet implementation class AdminProductUpdateFormServlet
 */
@WebServlet("/adminProductUpdateForm.bo")
public class AdminProductUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Product p = new Product();
		p.setProductId(Integer.parseInt(request.getParameter("pId")));
		p.setProductName(request.getParameter("name"));
		
		String category = request.getParameter("category"); 
		switch(category) {
		case "침대" : p.setProductCategoryId(1); break;
		case "매트리스" : p.setProductCategoryId(2); break;
		case "서랍장" : p.setProductCategoryId(3); break;
		case "커튼" : p.setProductCategoryId(4); break;
		case "조명" : p.setProductCategoryId(5); break;
		case "행거" : p.setProductCategoryId(6); break;
		}
		p.setProductBrand(request.getParameter("brand"));
		p.setProductPrice(Integer.parseInt(request.getParameter("price")));

		p.setProductSize(request.getParameter("size"));
		p.setProductDeliveryFee(Integer.parseInt(request.getParameter("deliveryFee")));
		p.setProductDiscountRate(Double.parseDouble(request.getParameter("discount")));
		p.setProductTip(request.getParameter("tip"));
		p.setProductContent(request.getParameter("content"));
		p.setProductStatus(request.getParameter("productStatus"));
	
		ArrayList<ProductOption> optionList = new ArrayList<ProductOption>();
		String[] options = request.getParameterValues("options");
		String[] optionsAmount = request.getParameterValues("optionsAmount");
		String[] pOId =  request.getParameterValues("pOId");
		
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
		
		String titleImgChangeName = request.getParameter("titleImgChangeName");
		int titleImgFileId = Integer.parseInt(request.getParameter("titleImgId"));
		String contentImg1ChangeName = request.getParameter("contentImg1ChangeName");
		int contentImg1FileId = Integer.parseInt(request.getParameter("contentImg1Id"));
		String contentImg2ChangeName = request.getParameter("contentImg2ChangeName");
		int contentImg2FileId = Integer.parseInt(request.getParameter("contentImg2Id"));
		String contentImg3ChangeName = request.getParameter("contentImg3ChangeName");
		int contentImg3FileId = Integer.parseInt(request.getParameter("contentImg3Id"));

		ArrayList<ProductAttachment> fileList = new ArrayList<ProductAttachment>();
		
		ProductAttachment pa = new ProductAttachment();
		pa.setProductChangeName(titleImgChangeName);	
		pa.setProductFileId(titleImgFileId);
		ProductAttachment pa2 = new ProductAttachment();
		pa2.setProductChangeName(contentImg1ChangeName);	
		pa2.setProductFileId(contentImg1FileId);
		ProductAttachment pa3 = new ProductAttachment();
		pa3.setProductChangeName(contentImg2ChangeName);	
		pa3.setProductFileId(contentImg2FileId);
		ProductAttachment pa4 = new ProductAttachment();
		pa4.setProductChangeName(contentImg3ChangeName);	
		pa4.setProductFileId(contentImg3FileId);
		
		fileList.add(pa);
		fileList.add(pa2);
		fileList.add(pa3);
		fileList.add(pa4);
		
		request.setAttribute("p", p);
		request.setAttribute("fileList", fileList);
		request.setAttribute("optionList", optionList);
		request.getRequestDispatcher("WEB-INF/views/board/adminProductUpdateForm.jsp").forward(request, response);
}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
