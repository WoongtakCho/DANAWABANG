package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import board.model.service.BoardService;
import board.model.vo.CartWhole;
import board.model.vo.Orders;
import board.model.vo.ProductAttachment;
import member.model.vo.Member;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/order.bo")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//주문번호, 주문자, 연락처, 이메일, 배송지, 요청사항, 주문상품명, 주문상품이미지(PRODUCT_ID), 주문금액, 주문일자
		//SEQ, buyer_name, buyer_phone, buyer_email, buyer_postcode/buyer_add1/buyer_add2, message, name, amount, productId, SYSDATE
		String id = ((Member)request.getSession().getAttribute("loginUser")).getId();
		String buyer_name = request.getParameter("buyer_name");
		String buyer_tel = request.getParameter("buyer_tel");
		String buyer_email = request.getParameter("buyer_email");
		String message = request.getParameter("message");
		String name = request.getParameter("name");
		int amount = Integer.parseInt(request.getParameter("amount"));
		int productId = Integer.parseInt(request.getParameter("productId"));
		String boards = request.getParameter("boards");
		String[] board = boards.split(",");
		CartWhole cw = new CartWhole();
		BoardService bService = new BoardService();
		ArrayList<CartWhole> cwList = new ArrayList<CartWhole>();
		ArrayList<ProductAttachment> fList = bService.selectProductThumbnails();
		
		String[] arr = {request.getParameter("buyer_postcode"), request.getParameter("buyer_add1"), request.getParameter("buyer_add2")};
		String address = String.join("/", arr);
		
	
		for(int i = 0 ; i < board.length ; i++) {
			int cId = Integer.parseInt(board[i]);
			cw = bService.selectCartWhole(cId);
			cwList.add(cw);
		}
		
		
		
		Orders order = new Orders();
		order.setOrdererName(buyer_name);
		order.setOrdererPhone(buyer_tel);
		order.setOrdererEmail(buyer_email);
		order.setOrdererAddress(address);
		order.setOrdererRequest(message);
		order.setOrderProductName(name);
		order.setOrderPrice(amount);
		order.setProductId(productId);
		order.setMemberId(id);
		
		request.setAttribute("order", order);
		request.setAttribute("cwList", cwList);
		request.setAttribute("fList", fList);
		request.setAttribute("boards", boards);
		
		request.getRequestDispatcher("WEB-INF/views/board/order.jsp").forward(request, response);
	}
		
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
