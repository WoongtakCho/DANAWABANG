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
import member.model.vo.Member;

/**
 * Servlet implementation class CartModifyServlet
 */
@WebServlet("/cartUpdate.bo")
public class CartUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cId = Integer.parseInt(request.getParameter("cId"));
		int pId = Integer.parseInt(request.getParameter("pId"));
		int pOptionId = Integer.parseInt(request.getParameter("pOptionId"));
		int cartAmount = Integer.parseInt(request.getParameter("amount"));
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		String id = loginUser.getId();
		
		int result = 0;
		int result2 = 0;
		int count = 0;
		
		ArrayList<Cart> cartList = new BoardService().selectCartList(id);
		Cart c = new Cart();
		int cartNum = 0;
		int cartProductAmount = 0;

			for(int i = cartList.size()-1; i >= 0; i--) {
				c = cartList.get(i);
				if(c.getProductId() == pId && c.getProductOptionId() == pOptionId) {
					cartNum = c.getCartId();
					cartProductAmount = c.getCartProductAmount();	
					count++;
				}
			}
		
			int sum = 0;
		
				if (count == 1) {
					int cartId = cartNum;
					if(cartId == cId) {
						c.setCartProductAmount(cartAmount);
						c.setCartId(cartId);
						c.setProductOptionId(pOptionId);
						result = new BoardService().updateCart(c);
					} else {
						sum = cartProductAmount + cartAmount;
						c.setCartProductAmount(sum);
						c.setCartId(cartId);
						c.setProductOptionId(pOptionId);
						result = new BoardService().updateCart(c);
						if(result > 0) {
							result2 = new BoardService().deleteCart(cId);
						}
					}	
				} else if (count == 0){
					c.setCartProductAmount(cartAmount);
					c.setCartId(cId);
					c.setProductOptionId(pOptionId);
					result = new BoardService().updateCart(c); 
				}
			
		if(result > 0) {
			response.sendRedirect("cart.bo");
			} else {
			request.setAttribute("msg", "장바구니 수정에 실패하였습니다.");
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
