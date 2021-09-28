package member.model.service;

import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.rollback;


import java.sql.Connection;

import member.model.dao.MemberDAO;
import member.model.vo.Member;


public class MemberService {

	public Member login(Member member) {
		Connection conn = getConnection();
		
		Member loginUser = new MemberDAO().login(conn, member);
		
		close(conn);
		
		return loginUser;
	}
	public int insertMember(Member member) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().insertMember(conn, member); 
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result;
	}

	public int checkId(String id) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().checkId(conn, id);
		
		return result;
	}
	
	public Member selectMember(String userId) {
		Connection conn = getConnection();
		
		Member loginUser = new MemberDAO().selectMember(conn, userId);
		
		close(conn);
		
		return loginUser;
	}

	public int updateMember(Member member) {
		Connection conn = getConnection();
		int result = new MemberDAO().updateMember(conn, member);
		if(result > 0) {
	         commit(conn);
	      } else {
	         rollback(conn);
	      }
		close(conn);
		
		return result;
	}

	public int deleteMember(String userId) {
		Connection conn = getConnection();
		int result = new MemberDAO().deleteMember(conn, userId);
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	// 체크된 여러명의 회원 삭제하기
		public int deleteMembers(String[] member) {
			Connection conn = getConnection();
			
			int result = new MemberDAO().deleteMembers(conn, member);
			
			if(result == member.length) {
				commit(conn);
			} else {
				rollback(conn);
			}
			
			close(conn);
			
			return result;
		}
		
		// 체크된 여러명의 회원 권한 수정하기
		public int changeAccess(String[] member, String access) {
			Connection conn = getConnection();
			
			int result = new MemberDAO().changeAccess(conn, member, access);
			
			if(result == member.length) {
				commit(conn);
			} else {
				rollback(conn);
			}
			
			close(conn);
			
			return result;
		}
		
		// 아이디찾기
		public Member findId(String name, String email) {
			Connection conn = getConnection();
			
			Member m = new MemberDAO().findId(conn, name, email);
			
			close(conn);
			
			return m;
		}	
		
		// 비밀번호 변경하기
				public int changePwd(String memberId, String changedPwd) {
					Connection conn = getConnection();
					
					int result = new MemberDAO().changePwd(conn, memberId, changedPwd);
					
					if(result > 0 ) {
						commit(conn);
					} else {
						rollback(conn);
					}
					
					close(conn);
					
					return result;
				}	
			
		
		public int kakaoInsertMember(Member kakaoMember) {
			Connection conn = getConnection();
			
			int result = new MemberDAO().kakaoInsertMember(conn, kakaoMember);
			
			if(result > 0) {
				commit(conn);
			}	else {
				rollback(conn);
			}
			
			close(conn);
			return result;
		}

}
