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
import board.model.vo.MyReply;
import board.model.vo.PageInfo;
import board.model.vo.ProductReply;
import board.model.vo.Reply;
import member.model.vo.Member;

/**
 * Servlet implementation class MyReplyServlet
 */
@WebServlet("/myReply.bo")
public class MyReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member loginUser = (Member)session.getAttribute("loginUser");
		String userId = loginUser.getId();
		
		BoardService bService = new BoardService();
		
		int listCount;		
		int currentPage;	
		int pageLimit;		
		int boardLimit;		
		int maxPage;		
		int startPage;		
		int endPage;		
		
		listCount = bService.getRListCount(userId);

		currentPage = 1;
		if( request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		pageLimit = 5;
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		//탭구분
		int oTOTab = 0;
		if(request.getParameter("oTOTab") == null ) {
			oTOTab = 1;
		} else {
			oTOTab = Integer.parseInt(request.getParameter("oTOTab"));
			
		}
		
		System.out.println("서블릿oto :"+oTOTab);
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		PageInfo pi2 = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		ArrayList<Reply> list = bService.selectReply(pi, userId);
		ArrayList<ProductReply> storeList = bService.selectMyStoreReply(pi2, userId);
		
		
		String page = null;
		
		if(list != null || storeList != null ) {
			page = "WEB-INF/views/board/myReply.jsp";
			request.setAttribute("list", list);
			request.setAttribute("storeList", storeList);
			request.setAttribute("pi", pi);
			request.setAttribute("pi2", pi2);
			request.setAttribute("oTOTab", oTOTab);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "댓글 조회에 실패하였습니다.");
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
