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



}