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
import egovframework.example.sample.service.DashDocKindVO;
import egovframework.example.sample.service.DashGeoVO;
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
	
	//대시보드 첫 화면 로드
	@RequestMapping(value="/dashboardList.do")
	public String helloworld() throws Exception {
		return "dashboard/dashboardList";
	}
	
	//한반도 차트 선택시(전국 /지역) 차트 Ajax 실행
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
		
		//db값을 가져와 배열의 요소로 사용하는 방법 추후 생각 -> 가져와서 order by주고 배열에 하나씩 넣으면 되겠다.[나중에 해보기]
		String[] clickGeo = {//Api data에 있는 값
								 "Seoul","Busan","Incheon","Daegu","Gwangju"
								 ,"Daejeon","Ulsan","Gyeonggi","Gangwon","North Chungcheong"
								 ,"South Chungcheong","North Jeolla","South Jeolla","North Gyeongsang","South Gyeongsang"
								 ,"Jeju","Sejong"
								};
			int[] sidoCd = {//DB에 있는 sido_cd
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
		
		//int sido_cd를 인자로 넘기는 메소드 작성시 동적쿼리 오류발생
		//->map 사용시 동적쿼리 정상적으로 이용할 수 있다기에 paramMap에 담아서 인자로 보냄
		paramMap.put("sido_cd", sido_cd);
		
		//시도정보 담을 VO 객체 생성해서 담기
		DashGeoVO clickGeoNm = new DashGeoVO();
		//if 사용해서 지역 선택 여부 확인(전국 or 지역)
		if(sido_cd == 0) {//초기화면
			clickGeoNm.setSido_cd(sido_cd);
			clickGeoNm.setSido_nm("전국");
		} else {//지역선택시
			clickGeoNm = dashService.clickGeoNm(sido_cd);
		}
		logger.info("선택한 지역 확인 -> " + "시 코드 : " +  sido_cd +" vo확인 : "+ clickGeoNm + " => 선택지역 확인");
		
		
		//병원 종류 차트에 사용할 데이터 뽑기
		List<DashHpKindVO> numHospitalList = dashService.numHospital(paramMap);
		
		//의사 종류 차트에 사용할 데이터 뽑기
		DashDocKindVO dashDocKind = dashService.numDoctor(paramMap); 
		
		logger.info("병원 종류 차트에 사용할 데이터 뽑기 -> " + numHospitalList);
		logger.info("의사 종류 차트에 사용할 데이터 뽑기 -> " + dashDocKind);
		
		
		
		
		
		
		//Ajax응답데이터 map으로 전달 (차트 데이터 모두 map에 담아 전달)
		Map<String, Object> returnmap = new HashMap<String, Object>();
		
		returnmap.put("numHospitalList", numHospitalList);
		returnmap.put("dashDocKind", dashDocKind);
		returnmap.put("sido_cd", clickGeoNm.getSido_nm());
		
		
		

		
		
		
		return returnmap;		
	}
	
	
	
	
	
}