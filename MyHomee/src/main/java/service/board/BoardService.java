package service.board;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import dao.board.BoardDAO;
import vo.board.BoardVO;

public class BoardService {

	private BoardDAO boardDao;
	
	public BoardService(BoardDAO boardDao) {
		this.boardDao = boardDao;
	}
	

	public List<BoardVO> selectList(Map<String, Object> map){
		
		List<BoardVO> list = boardDao.selectList(map);
		
		if(list.isEmpty()) {
			list = null;
		}
		
		return list;
	}
	
	public BoardVO selectOne(int seq) {
		return boardDao.selectOne(seq);
	}
	
	public int getTotal(Map<String, Object> map) {
		return boardDao.getTotal(map);
	}
	
	public Map<String, Object> getContent(int seq){
		boardDao.readCount(seq);
		
		Map<String, Object> map = boardDao.getContent(seq);
		
		String str = "";
		
		StringBuffer buf = new StringBuffer();
		
		Clob clob = (Clob)map.get("CONTENT");
		
		BufferedReader br = null;
		try {
			br = new BufferedReader(clob.getCharacterStream());
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		try {
			while((str = br.readLine()) != null) {
				buf.append(str);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		map.put("CONTENT", buf.toString());
		
		return map;
	}
	
	public int insert(BoardVO vo) {
		int seq = boardDao.getSeq();
		
		if(vo.getSeq() != 0) {
			BoardVO ref = boardDao.selectOne(vo.getSeq());
			
			vo.setGroupno(ref.getGroupno());
			vo.setOrderno(ref.getOrderno() + 1);
			vo.setDepth(ref.getDepth() + 1);
			
			boardDao.updateOrderno(vo);
			
		}else {
			vo.setGroupno(seq);
		}
		
		vo.setSeq(seq);
		
		return boardDao.insert(vo);
	}
	
	public int delete(int seq) {
		return boardDao.delete(seq);
	}
	
	public int update(BoardVO vo) {
		return boardDao.update(vo);
	}
	
}



















