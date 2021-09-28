package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class AdminMemberChangeAdminServlet
 */
@WebServlet("/changeAccess.me")
public class AdminMemberChangeAccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminMemberChangeAccessServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String members = request.getParameter("checkMembers");
		String access = request.getParameter("access");
		
		String[] member = members.split(",");
		
//		회원 아이디 잘 가져오는지 확인
		for(int i = 0 ; i < member.length ; i++) {
			System.out.println(member[i]);
		}
		
		int result = new MemberService().changeAccess(member, access);
		
		if(result == member.length) {
			response.sendRedirect("adminMember.me");
		} else {
			request.setAttribute("msg", "권한 변경에 실패하였습니다.");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);;
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
