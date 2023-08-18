package egovframework.example.sample.service;

import java.util.List;

public interface BoardService {
	public List<BoardVO> SelectBoardList(BoardVO vo) throws Exception;
}