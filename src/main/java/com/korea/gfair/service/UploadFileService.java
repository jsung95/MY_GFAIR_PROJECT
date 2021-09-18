package com.korea.gfair.service;

import javax.servlet.http.HttpServletResponse;

import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartFile;

import com.korea.gfair.domain.AttachFileDTO;
import com.korea.gfair.domain.AttachFileVO;
import com.korea.gfair.domain.BoardDTO;
import com.korea.gfair.domain.MemberDTO;

public interface UploadFileService {

	
	//FILE 처리 
	public abstract void uploadFile(AttachFileDTO dto);
	public abstract void addFileId(BoardDTO dto);
	public abstract AttachFileVO getFileById(BoardDTO dto);
	public abstract AttachFileVO getFileById(Integer fid);
	
	public abstract void updateFile(AttachFileDTO dto);
	
	public abstract void removeExistFileFromBoard(BoardDTO dto);
	
	public abstract void load_img(BoardDTO dto, AttachFileVO file, HttpServletResponse response);
	public abstract void uploadFileByModify(BoardDTO dto, MultipartFile file) throws Exception;
	public abstract void uploadFileByWrite(BoardDTO dto, MultipartFile file) throws Exception;
	
	
	public abstract void uploadFileByRegister(MemberDTO dto, MultipartFile file) throws Exception;
	
	public abstract String getFolder() throws Exception;
	
}
