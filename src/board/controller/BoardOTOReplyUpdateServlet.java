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
import board.model.vo.Reply;

/**
 * Servlet implementation class BoardOTOReplyUpdateServlet
 */
@WebServlet("/updateReply.bo")
public class BoardOTOReplyUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardOTOReplyUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int replyId = Integer.parseInt(request.getParameter("replyId"));
		String content = request.getParameter("content");
		int bId = Integer.parseInt(request.getParameter("bId"));
		
		Reply r = new Reply();
		r.setReplyId(replyId);
		r.setReplyContent(content);
		r.setBoardId(bId);
		
		ArrayList<Reply> list = new BoardService().updateReply(r);
		
		/*
		 * for(int i = 0 ; i < list.size() ; i++) {
		 * System.out.println(list.get(i).getReplyContent()); }
		 */
		
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gd = new GsonBuilder();
		GsonBuilder dateGd = gd.setDateFormat("yyyy-MM-dd");
		Gson gson = dateGd.create();
		gson.toJson(list, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
