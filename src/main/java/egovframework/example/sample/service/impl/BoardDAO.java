package egovframework.example.sample.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.BoardVO;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;


@Repository("boardDAO")
public class BoardDAO extends EgovAbstractMapper{

	public List<BoardVO> SelectBoardList(Map<String, Object> paramMap) {

		return selectList("SelectBoardList", paramMap);
	}
	
	public int countList(Map<String, Object> paramMap) {
		return selectOne("countList", paramMap);
	}
	
	
}