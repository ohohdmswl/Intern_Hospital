package egovframework.example.sample.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.BoardVO;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;


@Repository("BoardDAO")
public class BoardDAO extends EgovAbstractMapper{

	public List<BoardVO> SelectBoardList(BoardVO vo) {
//		return (List<BoardVO>) list("SelectBoardList", vo);
//		return selectList("BoardDAO.SelectBoardList", vo);
		return selectList("SelectBoardList", vo);
	}
	
}