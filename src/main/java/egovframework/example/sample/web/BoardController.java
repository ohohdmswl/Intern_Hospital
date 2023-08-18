package egovframework.example.sample.web;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
//import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.sample.service.BoardService;
import egovframework.example.sample.service.BoardVO;


@Controller
public class BoardController {
//	private static Logger Logger = LoggerFactory.getLogger(BoardController.class);
	
   // Set logger
   private final Logger logger = LogManager.getLogger(this.getClass());

   // Get class name for logger
   private final String className = this.getClass().toString();
	
	
	
	@Resource(name="boardService")
	private BoardService boardService;
	
	
	@RequestMapping(value="/boardList.do")
	public String selectDeptList(BoardVO vo, Model model) throws Exception {
		
		logger.info("보드컨트롤러 " + className + "selectDeptList");
		
//		List<BoardVO> list = boardService.SelectBoardList(vo);
		List<BoardVO> list = boardService.SelectBoardList(vo);
		
		System.out.println(list);

		model.addAttribute("list",list);
		return "board/boardList";
	}
	
}