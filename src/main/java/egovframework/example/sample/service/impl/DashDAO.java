package egovframework.example.sample.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import egovframework.example.sample.service.BoardVO;
import egovframework.example.sample.service.DashDocKindVO;
import egovframework.example.sample.service.DashGeoVO;
import egovframework.example.sample.service.DashHosSearchListVO;
import egovframework.example.sample.service.DashHpKindVO;
import egovframework.rte.psl.dataaccess.EgovAbstractMapper;


@Repository("dashDAO")
public class DashDAO extends EgovAbstractMapper{

	//클릭한 지역의 이름
	public DashGeoVO clickGeoNm(int sido_cd) {
		return selectOne("clickGeoNm", sido_cd);
	}
	//클릭한 지역의 병원 종류별 개수
	public List<DashHpKindVO> numHospital(Map<String, Object> paramMap) {
		return selectList("numHospital", paramMap);
	}
	//클릭한 지역의 의사 종류별 개수
	public DashDocKindVO numDoctor(Map<String, Object> paramMap) {
		return selectOne("numDoctor", paramMap);
	}
	//클릭한 지역의 시/군/구 select list 가져오기
	public List<DashGeoVO> dashgeoSelectList(Map<String, Object> paramMap) {
		return selectList("dashgeoSelectList", paramMap);
	}
	//병원 종류 select list 값 조회하기
	public List<DashHpKindVO> dashHpSelectList() {
		return selectList("dashHpSelectList");
	}
	//병원 검색 목록 조회
	public List<Map<String, String>> SelectDashList(Map<String, Object> paramMap) {
		return selectList("SelectDashList", paramMap);
	}
	//병원 검색 목록 총 개수 조회
	public int countDashList(Map<String, Object> paramMap) {
		return selectOne("countDashList", paramMap);
	}
	//검색한 병원의 정보 조회
	public DashHosSearchListVO DashHosSelectOne(Map<String, Object> paramMap) {
		return selectOne("DashHosSelectOne", paramMap);
	}

	

	
	
}