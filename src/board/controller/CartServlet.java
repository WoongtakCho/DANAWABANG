package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Cart;
import board.model.vo.CartWhole;
import board.model.vo.PageInfo;
import board.model.vo.Product;
import board.model.vo.ProductAttachment;
import board.model.vo.ProductOption;
import member.model.vo.Member;

/**
 * Servlet implementation class CartServlet
 */
@WebServlet("/cart.bo")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit; 
		int maxPage; 
		int startPage; 
		int endPage; 
		BoardService bService = new BoardService();
		
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		String id = loginUser.getId();
		listCount = bService.getCartCount(id);
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		pageLimit = 5;
		boardLimit = 5;

		
		
		maxPage = (int) Math.ceil((double)listCount / boardLimit);
		
	
		startPage = ((currentPage - 1)/pageLimit)* pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		
		ArrayList<CartWhole> cartList2 = bService.selectCartListC(pi, id);
		ArrayList<ProductAttachment> fList = bService.selectProductThumbnails();
		
		if (cartList2 != null && fList != null && id != null) {
			request.setAttribute("cartList", cartList2);
			request.setAttribute("fList", fList);
			request.setAttribute("pi", pi);
			request.setAttribute("id", id);
			request.setAttribute("loginUser", loginUser);
			request.getRequestDispatcher("WEB-INF/views/board/cart.jsp").forward(request, response);
		} else {
			request.setAttribute("msg", "장바구니 이동에 실패하였습니다.");
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
