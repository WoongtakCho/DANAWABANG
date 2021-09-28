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
import board.model.vo.PageInfo;
import board.model.vo.Reply;

/**
 * Servlet implementation class AdminOTOServlet
 */
@WebServlet("/adminOTO.bo")
public class AdminOTOServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOTOServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount; //총게시물
		int currentPage; //현재 페이지
		int pageLimit; //한페이지 5
		int boardLimit; // 10
		int maxPage; // 마지막페이지
		int startPage; // 각 페이지의 시작
		int endPage; // 각 페이지의 끝
		
		BoardService bService = new BoardService();
		Board board = new Board();
		board.setBoardCategoryId(2460);
		board.setBoardType(2);
		
		listCount = bService.getBListCount(board);
		
		
		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		pageLimit = 5;
		boardLimit = 10;
		
		maxPage = (int) Math.ceil((double)listCount / boardLimit);
		 
		startPage = ((currentPage - 1)/pageLimit)* pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<Board> list = bService.selectOTOList(pi);
		
//		여기서부터 댓글 개수를 파악하는 코드
		
//		각 게시물의 댓글 수를 알기 위해서는 각 게시물의 번호를 알아야 하기 때문에 각 게시글의 번호를 담을 수 있는 배열을 만들었다
		int[] bIds = new int[list.size()];
		
//		list는 한 페이지에 나타나는 게시물의 수를 뜻하고 게시글의 수 만큼 게시글 번호를 bIds에 넣는다
		for(int i = 0 ; i < list.size() ; i ++) {
			bIds[i] = list.get(i).getBoardId();
		}
		
//		게시물 번호들이 있는 bIds를 이용해 각 게시물에 있는 댓글의 수를 파악하기위해 DB까지 다녀온다 
		int[] replyCount = bService.replyCount(bIds);
		//DB에 가서 각 게시물의 댓글 수를 replyCount에 넣는다
		
//		replyCount배열 안에는 각 게시물에 들어있는 댓글의 수가 들어있는데 Board객체에 넣었고 각 게시물에 들어있는 댓글의 수를 BoardOTO.jsp에서 쓰기위해 담았다	
		for(int j = 0 ; j < list.size() ; j++) {
			list.get(j).setReplyCount(replyCount[j]);
		}
//		댓글 개수 관련 코드 끝-----------------------------------
		
		String page = null;
		if(list != null) {
			page = "WEB-INF/views/board/adminOTO.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "1대1게시판 조회에 실패하였습니다.");
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
