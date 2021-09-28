package member.model.dao;
import static common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import member.model.vo.Member;

public class MemberDAO {
private Properties prop = new Properties();
	
	public MemberDAO() {
		String fileName = MemberDAO.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member login(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		
		String query = prop.getProperty("login");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member(rset.getString("MEMBER_NAME"), rset.getString("MEMBER_ID"),
						rset.getString("MEMBER_PASSWORD"), rset.getString("MEMBER_EMAIL"), rset.getString("MEMBER_PHONE"), rset.getString("MEMBER_ADDRESS"),
						rset.getString("IS_ADMIN"), rset.getString("ADMIN_CODE"), rset.getString("MEMBER_DELETE"), rset.getDate("MEMBER_ENROLL_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}	
		return loginUser;
	}
	public int insertMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMember");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getId());
			pstmt.setString(3, member.getPwd());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getAddress());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		return result;
	}

	public int checkId(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("checkId");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, id);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = 1;
			} 

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return result;
	}
	public Member selectMember(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		
		String query = prop.getProperty("selectMember");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new Member(rset.getString("MEMBER_NAME"), rset.getString("MEMBER_ID"),
						rset.getString("MEMBER_PASSWORD"), rset.getString("MEMBER_EMAIL"), rset.getString("MEMBER_PHONE"), rset.getString("MEMBER_ADDRESS"),
						rset.getString("IS_ADMIN"), rset.getString("ADMIN_CODE"), rset.getString("MEMBER_DELETE"), rset.getDate("MEMBER_ENROLL_DATE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		return loginUser;
	}

	public int updateMember(Connection conn, Member member) {
	      PreparedStatement pstmt = null;
	      int result = 0;
	      
	      String query = prop.getProperty("updateMember");
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setString(1, member.getName());
	         pstmt.setString(2, member.getEmail());
	         pstmt.setString(3, member.getPhone());
	         pstmt.setString(4, member.getAddress());
	         pstmt.setString(5, member.getId());
	         
	         result = pstmt.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	      }
	        return result;
	   }

	public int deleteMember(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMember");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
				e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	public int deleteMembers(Connection conn, String[] member) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteMember");
		
		try {
			pstmt = conn.prepareStatement(query);

			for(int i = 0 ; i < member.length ; i++) {
				pstmt.setString(1, member[i]);
				result += pstmt.executeUpdate();
			}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int changeAccess(Connection conn, String[] member, String access) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("changeAccess");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			for(int i = 0 ; i < member.length ; i++) {
				pstmt.setString(1, access);
				pstmt.setString(2, member[i]);
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

		// 아이디 찾기 // 
	public Member findId(Connection conn, String name, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = new Member();
		
		String query = prop.getProperty("findId");
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getString("MEMBER_NAME"), rset.getString("MEMBER_ID"),
						rset.getString("MEMBER_PASSWORD"), rset.getString("MEMBER_EMAIL"), rset.getString("MEMBER_PHONE"), rset.getString("MEMBER_ADDRESS"),
						rset.getString("IS_ADMIN"), rset.getString("ADMIN_CODE"), rset.getString("MEMBER_DELETE"), rset.getDate("MEMBER_ENROLL_DATE"));
			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return m;
	}
	
	// 비밀번호 변경
	public int changePwd(Connection conn, String memberId, String changedPwd) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("changePwd");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, changedPwd);
			pstmt.setString(2, memberId);
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public int kakaoInsertMember(Connection conn, Member kakaoMember) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		System.out.println("dao : " + kakaoMember.getEmail());
		System.out.println("dao : " + kakaoMember.getName());
		
		String query = prop.getProperty("kakaoInsertMember"); 
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, kakaoMember.getName());
			pstmt.setString(2, kakaoMember.getEmail());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	




	
}
