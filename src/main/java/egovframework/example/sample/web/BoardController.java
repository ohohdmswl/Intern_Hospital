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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

		logger.info("보드컨트롤러  파람맵" + "boardList" + paramMap);
		
		int pagenum = Integer.parseInt((String) paramMap.get("pagenum"));
		int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
		int pageindex = (pagenum - 1) * pageSize;
		
		paramMap.put("pageSize", pageSize);
		paramMap.put("pageindex", pageindex);
		
		List<BoardVO> list = boardService.SelectBoardList(paramMap);
		
		int totalcnt = boardService.countList(paramMap);
		
		model.addAttribute("list",list);
		model.addAttribute("totalcnt", totalcnt);
		
		return "board/boardListGrd";
		
	}
	
	
	@RequestMapping(value="boardSelectOne.do")
	public String boardSelectOne(BoardVO vo, Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		logger.info("보드컨트롤러 셀렉트원  파람맵" + "boardSelectOne" + paramMap);
		
		int board_no = Integer.parseInt((String) paramMap.get("board_no"));
		
		paramMap.put("board_no", board_no);

		//조회수 증가
		int returnHit = boardService.boardHitUp(paramMap);
		
		BoardVO boardSelectOne = boardService.boardSelectOne(paramMap);
		
		model.addAttribute("boardSelectOne", boardSelectOne);
		
		return "board/boardSelectOne";
		
	}
	
	@RequestMapping(value="/boardSelectOnePage.do")
	public String boardSelectOnePage(BoardVO vo, Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		logger.info("보드컨트롤러 셀렉트원페이지  파람맵" + "boardSelectOnePage" + paramMap);
		
		int board_no = Integer.parseInt((String) paramMap.get("board_no"));
		paramMap.put("board_no", board_no);
		
		int returnHit = boardService.boardHitUp(paramMap);
		BoardVO boardSelectOnePage = boardService.boardSelectOne(paramMap);
		
		model.addAttribute("boardSelectOne", boardSelectOnePage);
		
		return "board/boardSelectOnePage" ;
		
	}
	
	
	
	@RequestMapping(value="/boardDelPwChk.do")
	@ResponseBody
	public Map<String, Object> boardDelPwChk(BoardVO vo, Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		logger.info("보드컨트롤러 deletePw  파람맵" + "boardDelPw" + paramMap);
		
		int board_no = Integer.parseInt((String) paramMap.get("board_no"));
		paramMap.put("board_no", board_no);
		
		int board_pw = Integer.parseInt((String) paramMap.get("board_pw"));
		paramMap.put("board_pw", board_pw);
		
		
		int returnPw = 0;
		
		returnPw = boardService.boardDelPwChk(paramMap);
		logger.info("보드컨트롤러 returnPw 결과확인" + "returnPw 값은?" + returnPw);
		
		Map<String, Object> returnmap = new HashMap<String, Object>();
		
		returnmap.put("returnPw", returnPw);
		returnmap.put("board_no", board_no);
		
		logger.info("보드컨트롤러 delete 결과확인" + "returnmap" + returnmap);
		
		return returnmap;
		
	}
	
	@RequestMapping(value="/boardDel.do")
	@ResponseBody
	public Map<String, Object> boardDel(BoardVO vo, Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		logger.info("보드컨트롤러 delete  파람맵" + "boardDel" + paramMap);
		
		int board_no = Integer.parseInt((String) paramMap.get("board_no"));
		paramMap.put("board_no", board_no);
		
		int returnDel = 0;
		
		returnDel = boardService.boardDel(paramMap);
		logger.info("보드컨트롤러 delete 결과확인" + "returnDel" + returnDel);
		
		Map<String, Object> returnmap = new HashMap<String, Object>();
		
	    returnmap.put("returnDel", returnDel);
	    returnmap.put("board_no", board_no);
	    
	    logger.info("보드컨트롤러 delete 결과확인" + "returnmap" + returnmap);
	    
		return returnmap;
		
	}

	
	
	
}