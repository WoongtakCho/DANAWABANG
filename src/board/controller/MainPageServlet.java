package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Board;
import board.model.vo.BoardAttachment;
import board.model.vo.Product;
import board.model.vo.ProductAttachment;

/**
 * Servlet implementation class MainPageServlet
 */
@WebServlet("/mainPage.me")
public class MainPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainPageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 프로모션, 셀프가이드, 할인특가 상품, 신상품
		// 모든 보드에서 categoryId가 프로모션(2430), 셀프가이드 인것만 가져오기 or boardType = 2인 것만 가져오기

		BoardService bService = new BoardService();

		ArrayList<Board> bList = bService.selectAllForMain(1);
		ArrayList<BoardAttachment> bFileList = bService.selectAllForMain(2);
		ArrayList<Product> discountProList = bService.selectAllForMain(3);
		ArrayList<Product> newProList = bService.selectAllForMain(4);
		ArrayList<ProductAttachment> pFileList = bService.selectAllForMain(5);

		String page = null;
		if(bList != null && bFileList != null && discountProList != null && newProList != null && pFileList != null) {
			request.setAttribute("bList", bList);
			request.setAttribute("bFileList", bFileList);
			request.setAttribute("discountProList", discountProList);
			request.setAttribute("newProList", newProList);
			request.setAttribute("pFileList", pFileList);
			page = "WEB-INF/views/common/mainPage.jsp";
		} else {
			request.setAttribute("msg", "메인페이지 조회에 실패하였습니다.");
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
