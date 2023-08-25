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
		
		logger.info("보드컨트롤러 " + className + "boardView");
		
		return "board/boardList";
		
	}
	
	
	@RequestMapping(value="boardList.do")
	public String boardList(BoardVO vo, Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			   HttpServletResponse response) throws Exception {
		
		logger.info("보드컨트롤러222 " + className + "boardList");
		
		
		
		int pagenum = Integer.parseInt((String) paramMap.get("pagenum"));
		int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
		int pageindex = (pagenum - 1) * pageSize;
		
		System.out.println("1차 체크");
       
		paramMap.put("pageSize", pageSize);
		paramMap.put("pageindex", pageindex);
		
		List<BoardVO> list = boardService.SelectBoardList(vo);
		logger.info("보드컨트롤러 " + className + "SelectBoardList");
		
		int totalcnt = boardService.countactlist(paramMap);
		logger.info("보드컨트롤러 " + className + "countactlist");
		logger.info("countactlist" + totalcnt);
		
		
		
		System.out.println(list);

		model.addAttribute("list",list);
		return "board/boardListGrd";
	}
}