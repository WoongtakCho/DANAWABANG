package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class KaKaoLoginServlet
 */
@WebServlet(urlPatterns="/kakaoLogin.me", name="KaKaoLoginServlet")
public class KaKaoLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KaKaoLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String kakaoLoginEmail = request.getParameter("kakaoLoginEmail");
		String kakaoLoginNickName = request.getParameter("kakaoLoginNickName");
//		String kakaoLoginId = "kakaoUser" + (int)(Math.random()*100000);
		String kakaoLoginId = kakaoLoginEmail;	// email에 unique 제약조건 걸어놔야 함
		String kakaoLoginPwd = request.getParameter("kakaoLoginPwd");
		Member kakaoMember = new Member();
		
		kakaoMember.setEmail(kakaoLoginEmail);
		kakaoMember.setName(kakaoLoginNickName);
		kakaoMember.setId(kakaoLoginId);
		kakaoMember.setPwd(kakaoLoginPwd);
		kakaoMember.setAddress("00000/주소를/입력해주세요");
		
		MemberService mService = new MemberService();
		
		Member checkedMember = mService.selectMember(kakaoLoginId);
		if(checkedMember == null){ // 존재하지 않는 회원이라면
			mService.insertMember(kakaoMember);
			checkedMember = mService.selectMember(kakaoLoginId);
		}
		
		if(checkedMember != null) {
			Member member = new Member(checkedMember.getId(), checkedMember.getPwd());
				
			Member loginUser = mService.login(member);
			if(loginUser != null) {
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", loginUser);
				session.setMaxInactiveInterval(7200);
				
				response.sendRedirect(request.getContextPath());
			} else {
				request.setAttribute("msg", "로그인 실패");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
					
			}
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
