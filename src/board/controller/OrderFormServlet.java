package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.CartWhole;
import board.model.vo.ProductAttachment;
import member.model.vo.Member;

/**
 * Servlet implementation class CartPaymentServlet
 */
@WebServlet("/orderForm.bo")
public class OrderFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boards = request.getParameter("checkPayment");
		String[] board = boards.split(",");
		CartWhole cw = new CartWhole();
		BoardService bService = new BoardService();
		ArrayList<CartWhole> cwList = new ArrayList<CartWhole>();
		ArrayList<ProductAttachment> fList = bService.selectProductThumbnails();
		Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		
		
		
		
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
