package egovframework.example.sample.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.BoardVO;
import egovframework.example.sample.service.DashDocKindVO;
import egovframework.example.sample.service.DashHpKindVO;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;


@Repository("dashDAO")
public class DashDAO extends EgovAbstractMapper{

	//클릭한 지역의 병원 종류별 개수
	public List<DashHpKindVO> numHospital(Map<String, Object> paramMap) {
		return selectList("numHospital", paramMap);
	}
	//클릭한 지역의 의사 종류별 개수
	public DashDocKindVO numDoctor(Map<String, Object> paramMap) {
		return selectOne("numDoctor", paramMap);
	}


	
	
}