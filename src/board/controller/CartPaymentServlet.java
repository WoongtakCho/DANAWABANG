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
import board.model.vo.ProductAttachment;
import member.model.vo.Member;

/**
 * Servlet implementation class CartPaymentServlet
 */
@WebServlet("/cartPayment.bo")
public class CartPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartPaymentServlet() {
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
		Cart c2 = new Cart();
		CartWhole cw = new CartWhole();
		BoardService bService = new BoardService();
		
		c.setCartProductAmount(cartProductAmount);
		c.setProductId(pId);
		c.setMemberId(id);
		c.setProductOptionId(pOptionId);
		result = bService.insertCart(c);
		
		ArrayList<Cart> cartList = bService.selectCartList(id);
		int cartId = 0;
		
		
		for(int i = 0; i <cartList.size(); i++) {
			c2 = cartList.get(i);
			if(c2.getCartProductAmount() == cartProductAmount
					&& c2.getProductId()==pId && c2.getProductOptionId()==pOptionId) {
				cartId = c2.getCartId();
				break;
			}
		}
		
		String boards = cartId+",";
		String[] board = boards.split(",");
		
		ArrayList<CartWhole> cwList = new ArrayList<CartWhole>();
		ArrayList<ProductAttachment> fList = bService.selectProductThumbnails();
		
		for(int i = 0 ; i < board.length ; i++) {
			int cId = Integer.parseInt(board[i]);
			cw = bService.selectCartWhole(cId);
			cwList.add(cw);
		}
		
		String page = null;
		if(cwList != null && fList != null && loginUser != null) {
			request.setAttribute("cwList", cwList);
			request.setAttribute("fList", fList);
			request.setAttribute("loginUser", loginUser);
			request.setAttribute("boards", boards);
			page = "WEB-INF/views/board/orderForm.jsp";
		} else {
			request.setAttribute("msg", "결제창 넘어가기에 실패하였습니다.");
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
