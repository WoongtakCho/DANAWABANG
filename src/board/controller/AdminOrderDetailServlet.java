package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Orders;
import board.model.vo.ProductAttachment;

/**
 * Servlet implementation class AdminOrderDetailServlet
 */
@WebServlet("/adminOrderDetail.bo")
public class AdminOrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOrderDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oId = "merchant_" + request.getParameter("orderId");
		
		BoardService bService = new BoardService();
		
		Orders o = bService.selectOrderDetail(oId);
		ArrayList<ProductAttachment> fileList = null;
		
		if(o != null) {
			fileList = bService.selectProductThumbnail(o.getProductId()); 			
		}
				
		String page = null;
		if(o != null) {
			String[] sp = o.getOrderId().split("_");
			o.setOrderId(sp[1]);
			
			page = "WEB-INF/views/board/adminOrderDetail.jsp";
			request.setAttribute("order", o);
			request.setAttribute("fileList", fileList);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "주문 내역 상세 조회에 실패하였습니다.");
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
