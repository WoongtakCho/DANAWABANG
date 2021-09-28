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
import board.model.vo.ProductOption;

/**
 * Servlet implementation class CartUpdateFromServlet
 */
@WebServlet("/cartUpdateForm.bo")
public class CartUpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartUpdateFormServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cId = Integer.parseInt(request.getParameter("cId"));
		BoardService bService = new BoardService();
		CartWhole cw = bService.selectCartWhole(cId);
		int pId = cw.getProductId();
		
		ArrayList<ProductAttachment> fList = bService.selectProductThumbnails();
		ArrayList<ProductOption> oList = bService.selectProductOption(pId);
		
		String page = null;
		if(cw != null && fList != null && oList != null) {
			request.setAttribute("cw", cw);
			request.setAttribute("fList", fList);
			request.setAttribute("oList", oList);
			page = "WEB-INF/views/board/cartUpdateForm.jsp";
		} else {
			request.setAttribute("msg", "해당 장바구니 불러오기에 실패하였습니다.");
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
