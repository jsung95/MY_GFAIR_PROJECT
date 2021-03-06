package com.korea.gfair.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.korea.gfair.domain.BoardDTO;
import com.korea.gfair.domain.BoardVO;
import com.korea.gfair.domain.Criteria;
import com.korea.gfair.domain.ReplyDTO;
import com.korea.gfair.domain.ReplyVO;

public interface NoticeBoardMapper {
	
	public abstract BoardVO select(BoardDTO dto);
	public abstract List<BoardVO> getNotice(@Param("bname")String bname);
	public abstract boolean insert(BoardDTO dto);
	public abstract boolean update(BoardDTO dto);
	public abstract boolean delete(BoardDTO dto);
	
	public abstract List<BoardVO> list(@Param("cri")Criteria cri, @Param("bname")String bname);

	
	public abstract int totalCount(@Param("cri")Criteria cri, @Param("bname")String bname);
	
	
	public abstract boolean readcnt(BoardDTO dto);
	
	
	
	//ANSWER 답글
	public abstract boolean repInsert(BoardDTO dto);
	public abstract boolean repStepUp(BoardDTO dto);
	
	

	
	
	
}
