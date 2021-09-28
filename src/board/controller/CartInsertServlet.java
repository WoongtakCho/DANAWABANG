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
import member.model.vo.Member;

/**
 * Servlet implementation class cartInsertServlet
 */
@WebServlet("/cartInsert.bo")
public class CartInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartInsertServlet() {
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
        ArrayList<Cart> cartList = new BoardService().selectCartList(id);
        int result1 = 0;
        int result2 = 0;
        Cart c = new Cart();
        Cart c2 = new Cart();
     
        
        if(cartList.size() == 0) {
           c2.setCartProductAmount(cartProductAmount);
           c2.setProductId(pId);
           c2.setMemberId(id);
           c2.setProductOptionId(pOptionId);
           result2 = new BoardService().insertCart(c2);            
        } else {
           for(int i = 0; i<cartList.size(); i++) {
              c = cartList.get(i);
              if(c.getProductId() != pId || c.getProductOptionId() != pOptionId) {
                 c2.setCartProductAmount(cartProductAmount);
                 c2.setProductId(pId);
                 c2.setMemberId(id);
                 c2.setProductOptionId(pOptionId);
                 result2 = new BoardService().insertCart(c2);
                 break;   
              } else if (c.getProductId() == pId && c.getProductOptionId() == pOptionId){
                 int amount = c.getCartProductAmount() + cartProductAmount;
                 c.setCartProductAmount(amount);
                 result1 = new BoardService().updateCart(c);
                 break;
              }
           }  
        }
        
           if(result1 > 0 || result2 > 0) {
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
