package egovframework.example.sample.service;

import java.util.List;
import java.util.Map;

public interface BoardService {
	//게시글 리스트 조회
	public List<BoardVO> SelectBoardList(Map<String, Object> paramMap) throws Exception;
	
	//총 게시글 수 조회
	public int countList(Map<String, Object> paramMap);

	//선택한 게시글 조회
	public BoardVO boardSelectOne(Map<String, Object> paramMap);

	//선택한 게시글 조회수 증가
	public int boardHitUp(Map<String, Object> paramMap);

	//게시글 비밀번호 확인
	public int boardDelPwChk(Map<String, Object> paramMap);
	
	//게시글 삭제
	public int boardDel(Map<String, Object> paramMap);

	
}