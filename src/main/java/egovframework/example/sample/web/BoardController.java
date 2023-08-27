package egovframework.example.sample.web;

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

import egovframework.example.sample.service.BoardService;
import egovframework.example.sample.service.BoardVO;


@Controller
@RequestMapping(value ="/board")
public class BoardController {
//	private static Logger Logger = LoggerFactory.getLogger(BoardController.class);
	
   // Set logger
   private final Logger logger = LogManager.getLogger(this.getClass());

   // Get class name for logger
   private final String className = this.getClass().toString();
	
	
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	
	@RequestMapping(value="/boardView.do")
	public String boardView(BoardVO vo, Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		logger.info("보드컨트롤러 " + className + paramMap);
		return "board/boardList";
		
	}
	
	@RequestMapping(value="boardList.do")
	public String boardList(BoardVO vo, Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			   HttpServletResponse response) throws Exception {
		
		logger.info("보드컨트롤러222 " + className + paramMap);
		
		int pagenum = Integer.parseInt((String) paramMap.get("pagenum"));
		int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
		int pageindex = (pagenum - 1) * pageSize;
		
		logger.info("보드컨트롤러2233 " + className + "여긴타냐");
		
		paramMap.put("pageSize", pageSize);
		paramMap.put("pageindex", pageindex);
		logger.info("보드컨트롤러 파람맵 확인 " + className + paramMap);
		
		List<BoardVO> list = boardService.SelectBoardList(paramMap);
		logger.info("보드컨트롤러 " + className + "SelectBoardList");
		
		int totalcnt = boardService.countList(paramMap);
		logger.info("countList -totalcnt 값 " + totalcnt);
		
		model.addAttribute("list",list);
		model.addAttribute("totalcnt", totalcnt);
		
		logger.info("list값 " + list);
		logger.info("totalcnt 값 " + totalcnt);
		
		
		return "board/boardListGrd";
		
	}

}