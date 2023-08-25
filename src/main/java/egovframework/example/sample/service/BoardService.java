package egovframework.example.sample.service;

import java.util.List;
import java.util.Map;

public interface BoardService {
	//게시글 리스트 조회
	public List<BoardVO> SelectBoardList(BoardVO vo) throws Exception;
	
	//총 게시글 수 조회
	public int countactlist(Map<String, Object> paramMap);
}