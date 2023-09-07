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
	
	//자유게시판 첫화면 로드(게시판 목록화면)
	@RequestMapping(value="/boardView.do")
	public String boardView(BoardVO vo, Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		return "board/boardList";
	}
	
	//게시판 목록화면(목록 및 검색 가능)
	@RequestMapping(value="boardList.do")
	public String boardList(BoardVO vo, Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			   HttpServletResponse response) throws Exception {

		logger.info("보드컨트롤러  파람맵" + "boardList" + paramMap);
		
		//Ajax로 넘어온 파라미터 int로 캐스팅(mapper에서 사용하기 위해)
		int pagenum = Integer.parseInt((String) paramMap.get("pagenum"));
		int pageSize = Integer.parseInt((String) paramMap.get("pageSize"));
		int pageindex = (pagenum - 1) * pageSize;
		
		//paramMap에 담아 같이 보내기
		paramMap.put("pageSize", pageSize);
		paramMap.put("pageindex", pageindex);
		
		//리스트로 게시글 목록 받아오기
		List<BoardVO> list = boardService.SelectBoardList(paramMap);
		
		//총 게시글 개수 구하기
		int totalcnt = boardService.countList(paramMap);
		
		//모두 넘겨서 게시글 목록 및 페이지네이션에 활용
		model.addAttribute("list",list);
		model.addAttribute("totalcnt", totalcnt);
		
		return "board/boardListGrd";
		
	}
	
	//게시글 한 글 조회
	@RequestMapping(value="boardSelectOne.do")
	@ResponseBody
	public Map<String, Object> boardSelectOne(BoardVO vo, Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		//파라미터에 있는 board_no룰 int 캐스팅
		int board_no = Integer.parseInt((String) paramMap.get("board_no"));
		
		//캐스팅된 변수 paramMap에 담기
		paramMap.put("board_no", board_no);

		//게시글 한 글 조회에 필요한 데이터를 BoardVO에 담기
		BoardVO boardSelectOne = boardService.boardSelectOne(paramMap);
		
		//Ajax 응답데이터로 넘길 Map 생성 후 해당 데이터 담기
		Map<String, Object> returnmap = new HashMap<String, Object>();
		returnmap.put("boardSelectOne", boardSelectOne);
		
		return returnmap;
		
		
	}
	
	@RequestMapping(value="/boardSelectOnePage.do")
	public String boardSelectOnePage(BoardVO vo, Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		//파라미터에 있는 board_no int 캐스팅 후 paramMap에 담기
		int board_no = Integer.parseInt((String) paramMap.get("board_no"));
		paramMap.put("board_no", board_no);
		
		//한 글 조회시 조회수 증가
		int returnHit = boardService.boardHitUp(paramMap);
		BoardVO boardSelectOnePage = boardService.boardSelectOne(paramMap);
		
		//조회 데이터 JSP로 넘김
		model.addAttribute("boardSelectOne", boardSelectOnePage);
		
		return "board/boardSelectOnePage" ;
	}
	
	//게시글 비밀번호 체크
	@RequestMapping(value="/boardPwChk.do")
	@ResponseBody
	public Map<String, Object> boardPwChk(BoardVO vo, Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		//파라미터 값 캐스팅해서 다시 파라미터에 담기
		int board_no = Integer.parseInt((String) paramMap.get("board_no"));
		paramMap.put("board_no", board_no);
		
		int board_pw = Integer.parseInt((String) paramMap.get("board_pw"));
		paramMap.put("board_pw", board_pw);
		
		//패스워드 조회 값 초기화
		int returnPw = 0;
		
		//게시글 번호에 패스워드 값이 맞는지 확인 후 count 결과 조회
		returnPw = boardService.boardPwChk(paramMap);
		logger.info("보드컨트롤러 returnPw 결과확인" + "returnPw 값은?" + returnPw);
		
		//Ajax에 보낼 데이터 map(패스워드 확인 결과 값, 게시글 번호 담기)
		Map<String, Object> returnmap = new HashMap<String, Object>();
		
		returnmap.put("returnPw", returnPw);
		returnmap.put("board_no", board_no);
		
		return returnmap;
	}
	
	//게시글 삭제
	@RequestMapping(value="/boardDel.do")
	@ResponseBody
	public Map<String, Object> boardDel(BoardVO vo, Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		//파라미터 값 캐스팅해서 다시 파라미터에 담기
		int board_no = Integer.parseInt((String) paramMap.get("board_no"));
		paramMap.put("board_no", board_no);
		
		//삭제 결과 값 초기화
		int returnDel = 0;
		
		//삭제 쿼리 실행 후 결과 값 
		returnDel = boardService.boardDel(paramMap);
		
		//Ajax 응답데이터로 보낼 Map 생성 후 삭제 결과 값, 게시글 번호 담아 보내기
		Map<String, Object> returnmap = new HashMap<String, Object>();
		
	    returnmap.put("returnDel", returnDel);
	    returnmap.put("board_no", board_no);
	    
		return returnmap;
	}

	//
	@RequestMapping(value="/boardWrite.do")
	public String boardWrite(BoardVO vo, Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		logger.info("보드컨트롤러 write  파람맵" + "null" + paramMap);
		
		int board_no = 0;
		
		if(paramMap.get("board_no") == null) {//새글 작성
			System.out.println("하하하하 파람 널이다");
			board_no = 0;
			
		}else if(paramMap.get("board_no") != null) {//글 수정
			System.out.println("하하하하 파람 널 아니다");
			board_no = Integer.parseInt((String) paramMap.get("board_no"));
		}
		
		model.addAttribute("board_no",board_no);
		return "board/boardWriteUpdate";
		
	}
	
	@RequestMapping(value="/boardInsert.do")
	@ResponseBody
	public Map<String, Object> boardInsert(BoardVO vo, Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		logger.info("보드컨트롤러 write  파람맵" + "boardWrite" + paramMap);
		
		int board_pw = Integer.parseInt((String) paramMap.get("board_pw"));
		paramMap.put("board_pw", board_pw);
		
		int returnInsert = 0;
		returnInsert = boardService.boardInsert(paramMap);
		logger.info("보드컨트롤러 delete 결과확인" + "returnDel" + returnInsert);
		
		Map<String, Object> returnmap = new HashMap<String, Object>();
		logger.info("보드컨트롤러 Insert 결과확인" + "returnmap" + returnmap);
		
		returnmap.put("returnInsert", returnInsert);
		
		return returnmap;
		
	}
	
	@RequestMapping(value="/boardUpdate.do")
	@ResponseBody
	public Map<String, Object> boardUpdate(BoardVO vo, Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		logger.info("보드컨트롤러 write  파람맵" + "boardUpdate" + paramMap);
		
		int board_no = Integer.parseInt((String) paramMap.get("board_no"));
		paramMap.put("board_no", board_no);
		
		int board_pw = Integer.parseInt((String) paramMap.get("board_pw"));
		paramMap.put("board_pw", board_pw);
		
		
		
		int returnUpdate = 0;
		returnUpdate = boardService.returnUpdate(paramMap);
		logger.info("보드컨트롤러 returnUpdate 결과확인" + "returnUpdate" + returnUpdate);
		
		Map<String, Object> returnmap = new HashMap<String, Object>();
		logger.info("보드컨트롤러 Insert 결과확인" + "returnmap" + returnmap);
		
		returnmap.put("returnUpdate", returnUpdate);
		returnmap.put("board_no", board_no);
		
		return returnmap;
		
	}

	
	
	
	
	
	
	
}