package egovframework.example.sample.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import egovframework.example.sample.service.BoardService;
import egovframework.example.sample.service.BoardVO;
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
	
	
	//클릭한 지역의 병원 종류별 개수
	@Override
	public List<DashHpKindVO> numHospital(Map<String, Object> paramMap) {
		return dashDAO.numHospital(paramMap);
	}

}