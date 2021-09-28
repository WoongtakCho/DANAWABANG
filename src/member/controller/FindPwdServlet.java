package member.controller;

import java.io.IOException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;
import java.util.Properties;
import java.util.Random;
import java.util.Base64.Encoder;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class SendMailServlet
 */
@WebServlet("/findPwd.me")
public class FindPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FindPwdServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		MemberService ms = new MemberService();

		final String sender = "danawabang@naver.com"; // 보내는 사람의 실제 네이버 이메일 주소
		final String password = "danawabang!!";  // 보내는 사람의 실제 네이버 이메일 비밀번호

		String memberId = request.getParameter("id");

		// 비밀번호 찾기시 입력한 정보와 db에 있는 찾으려는 회원과 일치하는지 확인
		Member m = ms.selectMember(memberId);

		String receiver = request.getParameter("email");

		if(!m.getEmail().equals(receiver)) { 
			request.setAttribute("msg", "입력하신 정보와 일치하는 회원이 없습니다.");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response); 
			return;
		}
		// 입력한 정보와 맞는 회원이 있는지 찾기 끝
		
		// 찾으려는 회원에게 줄 임시 비밀번호를 만듬
		StringBuffer ranPwd = new StringBuffer();
		Random rnd = new Random();
		for (int i = 0; i < 6; i++) {
		    int r = rnd.nextInt(3);
		    switch (r) {
		    case 0:
		        // a-z
		        ranPwd.append((char) ((int) (rnd.nextInt(26)) + 97));
		        break;
		    case 1:
		        // A-Z
		        ranPwd.append((char) ((int) (rnd.nextInt(26)) + 65));
		        break;
		    case 2:
		        // 0-9
		        ranPwd.append((rnd.nextInt(10)));
		        break;
		    }
		}
		// 임시 비밀번호 만들기 끝
		
		// 만든 임시 비밀번호를 암호화 하기
		String changeRanPwd = ranPwd.toString();
		MessageDigest md;
		String changedPwd = null;
		try {
			md = MessageDigest.getInstance("SHA-512");
			
			byte[] bytes = changeRanPwd.getBytes(Charset.forName("UTF-8"));
			md.update(bytes);
			Encoder encoder = Base64.getEncoder();
			changedPwd = encoder.encodeToString(md.digest());
			
		} catch (NoSuchAlgorithmException e1) {
			e1.printStackTrace();
		}
		// 암호화 하기 끝
		
		// 비밀번호를 찾으려는 회원의 비밀번호를 임시 비밀번호로 바꾸기
		int result = ms.changePwd(memberId, changedPwd);
		
		if(result == 0) {
			request.setAttribute("msg", "비밀번호 찾기에 실패하였습니다. 다시 시도해주세요");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
			return;
		}
		// 비밀번호 바꾸기 끝

		// email에 보여질 html 문
		String title = "비밀번호 찾기를 통해 발급된 임시 비밀번호를 보내드립니다.";
		String start = "<div style='margin: 0 auto; width: 600px; height: 1000px;'>";
		String logo = "<img style='margin-left: 105px;' src='https://postfiles.pstatic.net/MjAyMTA2MjZfMTY3/MDAxNjI0Njc2OTEyODk0.bIrZCLloN3QlOvdimWvOluRyGsEpiqBIt8S-Ga8gSkkg.YUj27HSM--1oAUFb_vrcFvkKlO3MfCzJF87GDxH1WFog.PNG.the3223/%EB%A1%9C%EA%B3%A0.PNG?type=w773' alt='img' /><br>";
		String head = "<div style='font-size: 21px;'>비밀번호 찾기 임시 비밀번호를 알려드립니다. </div>";
		String body = m.getName() + "님, 고객님의 개인정보 보호를 위해 임시 비밀번호가 발급되었습니다. <br> 발급된 임시 비밀번호는 영문 대/소문자를 구분하여 입력하셔야 합니다. <br><br><br>";
		String body2 = "<div style='border: 1px solid lightgray; width: 450px; height: 70px; font-size: 25px; font-weight: bold; color: #11BBFF; text-align: center; line-height: 70px;'>" + changeRanPwd + "</div><br><br>";
		String body3 = "<div style='width: 450px; height: 90px; background: #f2f2f2; display: table-cell; vertical-align: middle;'>상호명 : (주)다나와방    &nbsp;&nbsp;&nbsp;  이메일 : danawabang@danawabang.com <br> 대표이사 : 박신우  &nbsp;&nbsp;&nbsp;    사업자등록번호 : 999-88-77777 <br>주소 : 서울 역삼구 역삼대로56길 6 타워팰리스타워 31층 <br>Copyright 2021. danawabang, Co., Ltd. All rights reserved</div>";
		String end = "</div>";
		String html = start + logo + head + body + body2 + body3 + end;

		String host = "smtp.naver.com"; 

		System.out.println("---------recv Data Check--------");
		System.out.println("recvID : " + receiver);
		System.out.println("title : " + title);
		System.out.println("--------------------------");

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(sender, password);
			}
		});

		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(sender));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));

			message.setSubject("[다나와방] " + title);

			message.setText(html, "UTF-8", "html");

			Transport.send(message);
			System.out.println("전송 완료!!!!");

		} catch (MessagingException e) {
			System.out.println("전송 실패!! ㅠㅠ");
			e.printStackTrace();
		}
		
		request.getRequestDispatcher("WEB-INF/views/member/sendPwd.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}