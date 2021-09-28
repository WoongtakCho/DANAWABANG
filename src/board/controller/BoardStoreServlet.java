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
import board.model.vo.PageInfo;
import board.model.vo.Product;
import board.model.vo.ProductAttachment;

/**
 * Servlet implementation class BoardStoreServlet
 */
@WebServlet("/boardStore.bo")
public class BoardStoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardStoreServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// 정렬 기준을 담은 변수 index
		String index = request.getParameter("index");
		if(index == null || index.equals("")) {
			index = null;
		}
				
		// 평수를 담는 변수 roomSize
		int roomSize = 0;
		String size = request.getParameter("checkedRoomSize");
		String[] selectedSize = new String[0];
		if(size == null || size.equals("")) {
			size = null;			
		} else {
			// 평수가 여러개 선택 되면 가장 큰 평수만을 가져와 이용한다
			selectedSize = size.split(",");
			
			roomSize = Integer.parseInt(selectedSize[selectedSize.length-1]);
		}
		
		// 선택한 상품 항목을 담는 변수 itemCategory
		int[] itemCategory = new int[6];
		String[]checkedItemCategory = null;
		String items = request.getParameter("checkedItemCategory");
		// 상품 카테고리가 선택되면 db의 product_category_id 검색 조건에 맞추기 위해 int배열로 변환하기
		if(items != null && items.length() >= 2 ) {
			checkedItemCategory = items.split(",");
			
			for(int i = 0 ; i < checkedItemCategory.length ; i++) {
				itemCategory[i] = Integer.parseInt(checkedItemCategory[i]);
			}
		} else {
			itemCategory[0] = 0;
		}
		
		// 판매가격 최대 가격을 담는 변수 maxPrice
		int maxPrice = 0;
		String price = request.getParameter("maxPrice");
		if(price == null || price.equals("0")) {
			price = null;
		} else {
			maxPrice = Integer.parseInt(price);
		}
		
		int listCount;
		int currentPage;
		int pageLimit;
		int boardLimit; 
		int maxPage; 
		int startPage; 
		int endPage; 
		
		BoardService bService = new BoardService();

		// 상품 검색 조건들을 담아 상품의 수를 계산
		listCount = bService.getProductCount(roomSize, itemCategory, maxPrice);

		currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		pageLimit = 5;
		boardLimit = 9;
		 
		maxPage = (int) Math.ceil((double)listCount / boardLimit); 
		startPage = ((currentPage - 1)/pageLimit)* pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);

		// 상품 검색 조건을 보내 조건에 맞는 상품을 조회 함
		ArrayList<Product> pList = bService.selectProductList(pi, index, roomSize, itemCategory, maxPrice);
		ArrayList<ProductAttachment> fList = bService.selectProductThumbnails();
		
		for (Product p : pList) {
			for(int i = 0; i<pList.size(); i++ ) {
				p = pList.get(i);	
			}
			if(p.getProductCategoryId() == 1) {
				
			}
		}
		
		// 검색 조건이 계속 유지될 수 있도록 jsp에 보내기
		String page = null;
		if(pList != null) {
			request.setAttribute("pList", pList);
			request.setAttribute("fList", fList);
			request.setAttribute("pi", pi);
			request.setAttribute("roomSize", selectedSize);
			request.setAttribute("itemCategory", itemCategory);
			request.setAttribute("maxPrice", maxPrice);
			request.setAttribute("index", index);
			page = "WEB-INF/views/board/boardStore.jsp";
		} else {
			request.setAttribute("msg", "스토어 게시판 조회에 실패하였습니다.");
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
