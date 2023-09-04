package egovframework.example.sample.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import egovframework.example.sample.service.BoardService;
import egovframework.example.sample.service.BoardVO;
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
	
	//게시글 리스트 조회
//	@Override
//	public List<BoardVO> SelectBoardList(Map<String, Object> paramMap) throws Exception {
//		return boardDAO.SelectBoardList(paramMap);
//	}
	

}