package egovframework.example.sample.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.BoardVO;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;


@Repository("boardDAO")
public class BoardDAO extends EgovAbstractMapper{

	//게시판 리스트 조회
	public List<BoardVO> SelectBoardList(Map<String, Object> paramMap) {

		return selectList("SelectBoardList", paramMap);
	}
	
	//총 게시글 수 조회
	public int countList(Map<String, Object> paramMap) {
		return selectOne("countList", paramMap);
	}

	//게시글 조회
	public BoardVO boardSelectOne(Map<String, Object> paramMap) {
		return selectOne("boardSelectOne", paramMap);
	}
	
	
}