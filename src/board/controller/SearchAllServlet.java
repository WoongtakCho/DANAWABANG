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
 * Servlet implementation class SearchAllServlet
 */
@WebServlet("/searchAll.bo")
public class SearchAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String sAllWord_ = request.getParameter("searchAllWord");
		
		BoardService bService = new BoardService();
		String sAllWord = "";
		if(sAllWord_ != null && !sAllWord_.equals("")) {
			sAllWord = sAllWord_;
		}
		
		ArrayList<Product> pSearchList = bService.pSearchList(sAllWord);
		ArrayList<ProductAttachment> pList = bService.selectProductThumbnails();
		int pSearchCount = bService.pSearchCount(sAllWord);	
		
		String page = null;
		if(pSearchList != null) {
			request.setAttribute("pSearchList", pSearchList);
			request.setAttribute("pList", pList);
			request.setAttribute("pSearchCount", pSearchCount);
			request.setAttribute("sAllWord", sAllWord);
			page = "WEB-INF/views/board/searchResults.jsp";
		} else {
			request.setAttribute("msg", "검색조회에 실패하였습니다.");
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
