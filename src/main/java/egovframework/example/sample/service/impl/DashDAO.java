package egovframework.example.sample.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.BoardVO;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;


@Repository("dashDAO")
public class DashDAO extends EgovAbstractMapper{

	//선택한 지역 찾기
	public String findGeo(String geoClick) {
		return selectOne("findGeo",geoClick);
	}

	//게시판 리스트 조회
//	public List<BoardVO> SelectBoardList(Map<String, Object> paramMap) {
//
//		return selectList("SelectBoardList", paramMap);
//	}
//	

	
	
}