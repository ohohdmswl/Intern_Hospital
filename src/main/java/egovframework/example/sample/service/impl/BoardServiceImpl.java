package egovframework.example.sample.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import egovframework.example.sample.service.BoardService;
import egovframework.example.sample.service.BoardVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("boardService")
public class BoardServiceImpl extends EgovAbstractServiceImpl implements BoardService{

	
   // Set logger
   private final Logger logger = LogManager.getLogger(this.getClass());

   // Get class name for logger
   private final String className = this.getClass().toString();
   
	@Resource(name="boardDAO")
	private BoardDAO boardDAO;
	
	//게시글 리스트 조회
	@Override
	public List<BoardVO> SelectBoardList(Map<String, Object> paramMap) throws Exception {
		return boardDAO.SelectBoardList(paramMap);
	}
	
	//총 게시글 수 조회
	@Override
	public int countList(Map<String, Object> paramMap) {
		return boardDAO.countList(paramMap);
	}

	//선택한 게시글 조회
	@Override
	public BoardVO boardSelectOne(Map<String, Object> paramMap) {
		return boardDAO.boardSelectOne(paramMap);
	}
	
	//선택한 게시글 조회수 증가
	@Override
	public int boardHitUp(Map<String, Object> paramMap) {
		return boardDAO.boardHitUp(paramMap);
	}
	
	//게시글 비밀번호 확인
	@Override
	public int boardDelPwChk(Map<String, Object> paramMap) {
		return boardDAO.boardDelPwChk(paramMap);
	}
	
	//게시글 삭제
	@Override
	public int boardDel(Map<String, Object> paramMap) {
		return boardDAO.boardDel(paramMap);
	}
	
	//게시글 작성
	@Override
	public int boardInsert(Map<String, Object> paramMap) {
		return boardDAO.boardInsert(paramMap);
	}
}