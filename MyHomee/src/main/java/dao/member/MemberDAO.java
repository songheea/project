package dao.member;

import org.apache.ibatis.session.SqlSession;

import vo.member.MemberVO;

public class MemberDAO {

	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int checkLogin(MemberVO vo) {
		
		int no = 0;
		
		try {
			no = sqlSession.selectOne("member.checkLogin",vo);
		}catch(NullPointerException e) {
			e.printStackTrace();
		}
		
		return no;
	}
	
	public String findId(MemberVO vo) {
		return sqlSession.selectOne("member.findId",vo);
	}
	
	public String findPw(MemberVO vo) {
		return sqlSession.selectOne("member.findPw",vo);
	}
	
	public int insert(MemberVO vo) {
		return sqlSession.insert("member.insert",vo);
	}
	
	public MemberVO selectOne(int no) {
		return sqlSession.selectOne("member.selectOne", no);
	}
	
	public int update(MemberVO vo) {
		return sqlSession.update("member.update",vo);
	}
	
	public int delete(int no) {
		return sqlSession.delete("member.delete",no);
	}
	
	public String checkId(String id) {
		return sqlSession.selectOne("member.checkId",id);
	}
}



























