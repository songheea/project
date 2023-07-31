package service.login;

import dao.member.MemberDAO;
import vo.member.MemberVO;

public class LoginService {

	private MemberDAO memberDao;
	
	public void setMemberDao(MemberDAO memberDao) {
		this.memberDao = memberDao;
	}
	
	public int checkLogin(MemberVO vo) {
		return memberDao.checkLogin(vo);
	}
	
	public String findId(MemberVO vo) {
		return memberDao.findId(vo);
	}
	
	public String findPw(MemberVO vo) {
		return memberDao.findPw(vo);
	}
}
