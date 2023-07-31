package service.member;

import dao.member.MemberDAO;
import vo.member.MemberVO;

public class MemberService {

	private MemberDAO memberDao;
	
	public MemberService(MemberDAO memberDao) {
		this.memberDao = memberDao;
	}
	
	
	public int insert(MemberVO vo) {
		return memberDao.insert(vo);
	}
	
	public MemberVO selectOne(int no) {
		return memberDao.selectOne(no);
	}
	
	public int update(MemberVO vo) {
		return memberDao.update(vo);
	}
	
	public int delete(int no) {
		return memberDao.delete(no);
	}
	
	public boolean checkId(String id) {
		return memberDao.checkId(id) != null;
	}
}


















