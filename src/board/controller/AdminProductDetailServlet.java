package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Product;
import board.model.vo.ProductAttachment;
import board.model.vo.ProductOption;

/**
 * Servlet implementation class AdminProductDetailServlet
 */
@WebServlet("/adminProductDetail.bo")
public class AdminProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminProductDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pId = Integer.parseInt(request.getParameter("pId"));

		BoardService bService = new BoardService();
		Product product = bService.selectProductBoard(pId);
		ArrayList<ProductAttachment> fileList = bService.selectProductThumbnail(pId);
		ArrayList<ProductOption> optionList = bService.selectProductOption(pId);
		
		String page = null;
		if(fileList != null) {
			request.setAttribute("product", product);
			request.setAttribute("fileList", fileList);
			request.setAttribute("optionList", optionList);
			page = "WEB-INF/views/board/adminProductDetail.jsp";
		} else {
			request.setAttribute("msg", "상품관리 게시판 상세보기에 실패하였습니다.");
			page = "WEB-INF/views/common/errorPage.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
