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
@WebServlet("/storeCart.bo")
public class BoardStoreCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardStoreCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cartProductAmount = Integer.parseInt(request.getParameter("cartProductAmount"));
		int pId = Integer.parseInt(request.getParameter("productId"));
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		String id = loginUser.getId();
		int pOptionId = Integer.parseInt(request.getParameter("pOptionId"));
			
		int result = 0;
		Cart c = new Cart();
		int count = 0;
		BoardService bService = new BoardService();
		
		ArrayList<Cart> cartList = bService.selectCartList(id);
		
		if(cartList.size() == 0) {		
			c.setCartProductAmount(cartProductAmount);
			c.setProductId(pId);
			c.setMemberId(id);
			c.setProductOptionId(pOptionId);
			result = bService.insertCart(c);
			count++;
		} else {
			for(int i = cartList.size()-1; i >= 0; i--) {
				c = cartList.get(i);
				if(c.getProductId() == pId && c.getProductOptionId() == pOptionId) {
					int cartId = c.getCartId();
					int amount = c.getCartProductAmount();
					int sum = amount + cartProductAmount;
					c.setCartProductAmount(sum);
					c.setCartId(cartId);
					c.setProductOptionId(pOptionId);
					result = bService.updateCart(c);
					count++;
					break;
				} 
				}
			}
		
		if (count == 0) {
			c.setCartProductAmount(cartProductAmount);
			c.setProductId(pId);
			c.setMemberId(id);
			c.setProductOptionId(pOptionId);
			result = bService.insertCart(c);	
		}
		
		if(result > 0) {
		
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit; 
		int maxPage; 
		int startPage; 
		int endPage; 
		
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
		
		if (cartList2 != null && fList != null && loginUser != null) {
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
		
		
		} else {
			request.setAttribute("msg", "장바구니 담기에 실패하였습니다.");
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
