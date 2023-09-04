package egovframework.example.sample.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
//import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.sample.service.BoardVO;
import egovframework.example.sample.service.DashHpKindVO;
import egovframework.example.sample.service.DashService;


@Controller
@RequestMapping(value ="/dash/")
public class DashController {
//	private static Logger Logger = LoggerFactory.getLogger(DashBoardController2.class);
	
   // Set logger
   private final Logger logger = LogManager.getLogger(this.getClass());

   // Get class name for logger
   private final String className = this.getClass().toString();
	
	
	@Resource(name="dashService")
	private DashService dashService;
	
	
	@RequestMapping(value="/dashboardList.do")
	public String helloworld() throws Exception {
		
		logger.info("대시보드컨트롤러 " + className + "helloworld()");
		
		System.out.println("하하하");

		return "dashboard/dashboardList";
	}
	
	@RequestMapping(value="/dashGeoClick.do")
	@ResponseBody
	public Map<String, Object> dashGeoClick(DashHpKindVO vo, Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			   HttpServletResponse response) throws Exception {

		logger.info("대시보드  파람맵" + "boardList" + paramMap);
		
		//선택된 지역 찾기
		String geoClick =  (String) paramMap.get("geoClick");
		
		//sql에서 비교할 sido_cd
		//하위 코드에서 파라미터로 받은 클릭한 지역을 해당 지역 코드로 변환하기
		//->sql에서 선택된 지역에 맞는 where 사용하기 위해 
		int sido_cd = 0;
		
		String[] clickGeo = {
								 "Seoul","Busan","Incheon","Daegu","Gwangju"
								 ,"Daejeon","Ulsan","Gyeonggi","Gangwon","North Chungcheong"
								 ,"South Chungcheong","North Jeolla","South Jeolla","North Gyeongsang","South Gyeongsang"
								 ,"Jeju","Sejong"
								};
			int[] sidoCd = {
								 110000 ,210000 ,220000 ,230000 ,240000
								,250000 ,260000 ,310000 ,320000 ,330000
								,340000 ,350000 ,360000 ,370000 ,380000
								,390000 ,410000
								};
			
		for (int i = 0; i<clickGeo.length; i++) {
			if(clickGeo[i].equals(geoClick)) {
				sido_cd = sidoCd[i];
				break;
			}
		}
		logger.info("선택한 지역 코드 변환 확인 -> " + geoClick +"의 코도 : "+ sido_cd + " => 선택지역 구분 완료");
		
		
		
		
		
		
		
		
		
		
//		int pagenum = Integer.parseInt((String) paramMap.get("pagenum"));
//		int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
//		int pageindex = (pagenum - 1) * pageSize;
//		
//		paramMap.put("pageSize", pageSize);
//		paramMap.put("pageindex", pageindex);
//		
//		List<BoardVO> list = boardService.SelectBoardList(paramMap);
//		
//		int totalcnt = boardService.countList(paramMap);
//		
//		model.addAttribute("list",list);
//		model.addAttribute("totalcnt", totalcnt);
		
//		return "dashboard/dashboardList";
		
		
		
		
		Map<String, Object> returnmap = new HashMap<String, Object>();
		
		returnmap.put("paramMap", paramMap);
		
		return returnmap;		
	}
	
	
	
	
	
}