package egovframework.example.sample.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import egovframework.example.sample.service.BoardService;
import egovframework.example.sample.service.BoardVO;
import egovframework.example.sample.service.DashDocKindVO;
import egovframework.example.sample.service.DashGeoVO;
import egovframework.example.sample.service.DashHosSearchListVO;
import egovframework.example.sample.service.DashHpKindVO;
import egovframework.example.sample.service.DashService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("dashService")
public class DashServiceImpl extends EgovAbstractServiceImpl implements DashService{

	
   // Set logger
   private final Logger logger = LogManager.getLogger(this.getClass());

   // Get class name for logger
   private final String className = this.getClass().toString();
   
	@Resource(name="dashDAO")
	private DashDAO dashDAO;
	
	//클릭한 지역의 이름
	@Override
	public DashGeoVO clickGeoNm(int sido_cd) {
		return dashDAO.clickGeoNm(sido_cd);
	}
	
	//클릭한 지역의 병원 종류별 개수
	@Override
	public List<DashHpKindVO> numHospital(Map<String, Object> paramMap) {
		return dashDAO.numHospital(paramMap);
	}

	//클릭한 지역의 의사 종류별 개수
	@Override
	public DashDocKindVO numDoctor(Map<String, Object> paramMap) {
		return dashDAO.numDoctor(paramMap);
	}
	
	//클릭한 지역의 시/군/구 select list 가져오기
	@Override
	public List<DashGeoVO> dashgeoSelectList(Map<String, Object> paramMap) {
		return dashDAO.dashgeoSelectList(paramMap);
	}
	
	//클릭한 지역의 병원 select list 가져오기
	@Override
	public List<DashHpKindVO> dashHpSelectList() {
		return dashDAO.dashHpSelectList();
	}
	
	//검색결과 병원 list 가져오기
	@Override
	public List<Map<String, String>> SelectDashList(Map<String, Object> paramMap) {
		return dashDAO.SelectDashList(paramMap);
	}
	
	//검색결과 병원 list 총 개수 가져오기
	@Override
	public int countDashList(Map<String, Object> paramMap) {
		return dashDAO.countDashList(paramMap);
	}
	
	
}