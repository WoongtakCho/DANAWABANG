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
import board.model.vo.Product;
import board.model.vo.ProductAttachment;
import board.model.vo.ProductOption;
import board.model.vo.ProductReply;
import member.model.vo.Member;

/**
 * Servlet implementation class BoardStoreDetailServlet
 */
@WebServlet("/boardStoreDetail.bo")
public class BoardStoreDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardStoreDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = null;
		if(loginUser != null) {
			userId = loginUser.getId();
		}
		
		int pId = Integer.parseInt(request.getParameter("pId"));
		
		BoardService bService = new BoardService();
		Product product = bService.selectProductBoard(pId);
		ArrayList<ProductAttachment> fileList = bService.selectProductThumbnail(pId);
		ArrayList<ProductOption> optionList = bService.selectProductOption(pId);
		ArrayList<ProductReply> productReplyList = new BoardService().selectStoreReplyList(pId ,userId);
		
		String page = null;
		if(fileList != null) {
			request.setAttribute("product", product);
			request.setAttribute("fileList", fileList);
			request.setAttribute("optionList", optionList);
			request.setAttribute("productReplyList", productReplyList);
			page = "WEB-INF/views/board/boardStoreDetail.jsp";
		} else {
			request.setAttribute("msg", "상품 상세보기에 실패하였습니다.");
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
