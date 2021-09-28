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
import board.model.vo.CartWhole;
import board.model.vo.Orders;
import board.model.vo.Reply;
import member.model.vo.Member;

/**
 * Servlet implementation class OrderInsertServlet
 */
@WebServlet("/orderInsert.bo")
public class OrderInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String impUid = request.getParameter("imp_uid");
		String orderId = request.getParameter("merchant_uid");
		int paidAmount = Integer.parseInt(request.getParameter("paid_amount"));
		String getApplyNum = request.getParameter("apply_num");
		String applyNum = "";
		if(getApplyNum.length()== 0 || getApplyNum == "") {
			applyNum = "-";
		} else {
			applyNum = getApplyNum;
		}
		String ordererName = request.getParameter("buyer_name");
		String ordererPhone = request.getParameter("buyer_tel");
		String ordererEmail = request.getParameter("buyer_email");
		String ordererAddress = request.getParameter("address");
		String ordererRequest = request.getParameter("message");
		String orderProductName = request.getParameter("name");
		int productId = Integer.parseInt(request.getParameter("productId"));
		int orderPrice = Integer.parseInt(request.getParameter("amount"));
		String boards = request.getParameter("boards");
		String[] board = boards.split(",");
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		String memberId = loginUser.getId();
		CartWhole cw = new CartWhole();
		BoardService bService = new BoardService();
		ArrayList<CartWhole> cwList = new ArrayList<CartWhole>();

		int sum = 0;
		for(int i = 0 ; i < board.length ; i++) {
			int cId = Integer.parseInt(board[i]);
			cw = bService.selectCartWhole(cId);
			sum += (cw.getProductPrice() * cw.getCartProductAmount());
		}
			
		Orders order = new Orders();
		
		if (paidAmount == orderPrice) {
			order.setOrderId(orderId);
			order.setOrdererName(ordererName);
			order.setOrdererPhone(ordererPhone);
			order.setOrdererEmail(ordererEmail);
			order.setOrdererAddress(ordererAddress);
			order.setOrdererRequest(ordererRequest);
			order.setOrderProductName(orderProductName);
			order.setProductId(productId);
			order.setOrderPrice(orderPrice);
			order.setImpUid(impUid);
			order.setMemberId(memberId);
			order.setApplyNum(applyNum);
		} else {
			request.setAttribute("msg", "주문정보 입력에 실패하였습니다.");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
		}
		
		int result = new BoardService().insertOrder(order);
		int result2 = 0;
		int result3 = 0;
		for(int i = 0 ; i < board.length ; i++) {
			int cId = Integer.parseInt(board[i]);
			result3 = new BoardService().sold(cId);
			result2 = new BoardService().deleteCart(cId);
		}
		
		
		
		if(result>0 && result2 == boards.length() && result3 != 0) {
			/* response.setContentType("application/json; charset=UTF-8"); */
		Gson gson = new Gson();
		gson.toJson(result, response.getWriter());
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
