package egovframework.example.sample.service;

import java.util.List;
import java.util.Map;

public interface DashService {

	//클릭한 지역의 이름
	public DashGeoVO clickGeoNm(int sido_cd);
	
	//클릭한 지역의 병원 종류별 개수
	public List<DashHpKindVO> numHospital(Map<String, Object> paramMap);

	//클릭한 지역의 의사 종류별 개수
	public DashDocKindVO numDoctor(Map<String, Object> paramMap);

	//클릭한 지역의 시/군/구 select list 가져오기
	public List<DashGeoVO> dashgeoSelectList(Map<String, Object> paramMap);

	//병원 종류 select list 값 조회하기
	public List<DashHpKindVO> dashHpSelectList();

	//병원 검색 결과 List 값 조회하기
	public List<Map<String, String>> SelectDashList(Map<String, Object> paramMap);

	//병원 검색결과 총개수 조회하기
	public int countDashList(Map<String, Object> paramMap);

	//선택한 병원정보 VO에 저장
	public DashHosSearchListVO DashHosSelectOne(Map<String, Object> paramMap);



}