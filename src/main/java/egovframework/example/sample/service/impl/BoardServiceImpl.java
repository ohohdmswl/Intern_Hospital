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
	
}