package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import board.model.service.BoardService;
import board.model.vo.Cart;
import board.model.vo.Product;
import board.model.vo.ProductAttachment;
import board.model.vo.ProductOption;
import member.model.vo.Member;

/**
 * Servlet implementation class cartInsertServlet
 */
@WebServlet("/storeCartInsert.bo")
public class BoardStoreCartInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardStoreCartInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
				int cartProductAmount = Integer.parseInt(request.getParameter("cartProductAmount"));
				int pId = Integer.parseInt(request.getParameter("productId"));
				String id = ((Member)request.getSession().getAttribute("loginUser")).getId();
				int pOptionId = Integer.parseInt(request.getParameter("pOptionId"));
				
				int result = 0;
				Cart c = new Cart();
				int count = 0;

				ArrayList<Cart> cartList = new BoardService().selectCartList(id);
				
				if(cartList.size() == 0) {		
					c.setCartProductAmount(cartProductAmount);
					c.setProductId(pId);
					c.setMemberId(id);
					c.setProductOptionId(pOptionId);
					result = new BoardService().insertCart(c);
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
							result = new BoardService().updateCart(c);
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
					result = new BoardService().insertCart(c);	
				}
				
					if(result > 0) {
					response.sendRedirect("boardStoreDetail.bo?pId="+pId);
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
