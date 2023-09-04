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

import egovframework.example.sample.service.BoardService;
import egovframework.example.sample.service.BoardVO;


@Controller
@RequestMapping(value ="/dash/")
public class DashController {
//	private static Logger Logger = LoggerFactory.getLogger(DashBoardController2.class);
	
   // Set logger
   private final Logger logger = LogManager.getLogger(this.getClass());

   // Get class name for logger
   private final String className = this.getClass().toString();
	
	
//	@Resource(name="BoardService")
//	private BoardService boardService;
	
	
	@RequestMapping(value="/dashboardList.do")
	public String helloworld() throws Exception {
		
		logger.info("대시보드컨트롤러 " + className + "helloworld()");
		
		System.out.println("하하하");

		return "dashboard/dashboardList";
	}
	
	@RequestMapping(value="/dashGeoClick.do")
	@ResponseBody
	public Map<String, Object> dashGeoClick(BoardVO vo, Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			   HttpServletResponse response) throws Exception {

		logger.info("대시보드  파람맵" + "boardList" + paramMap);
		
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