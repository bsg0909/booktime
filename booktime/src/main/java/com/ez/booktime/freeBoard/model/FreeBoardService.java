package com.ez.booktime.freeBoard.model;

import java.util.List;

public interface FreeBoardService {
	int insertBoard(FreeBoardVO boardVo);
	List<FreeBoardVO> selectFreeBoardAll();
	FreeBoardVO selectByNo(int boardNo);
	FreeBoardVO selectById(String userid);
	int updateBoard(FreeBoardVO freeBoardVo);
	int drawBoard(int boardNo);
}
