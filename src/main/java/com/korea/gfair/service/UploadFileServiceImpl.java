package com.korea.gfair.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.korea.gfair.domain.AttachFileDTO;
import com.korea.gfair.domain.AttachFileVO;
import com.korea.gfair.domain.BoardDTO;
import com.korea.gfair.domain.MemberDTO;
import com.korea.gfair.mapper.UploadFileMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor
@Service
public class UploadFileServiceImpl implements UploadFileService {

	private String imgFileName = "/Users/jinsung/Desktop/opt/eclipse/workspace/PROJECT/G-Fair-BackEnd/src/main/webapp/resources/img";
	

	@Setter(onMethod_ = @Autowired)
	private UploadFileMapper mapper;

	
	//FILE 처리 
	@Override
	public void uploadFile(AttachFileDTO dto) {
		this.mapper.insertFile(dto);
		
	}

	@Override
	public void addFileId(BoardDTO dto) {
		this.mapper.updateFileId(dto);
		
	}

	@Override
	public AttachFileVO getFileById(BoardDTO dto) {
		
		AttachFileVO file = this.mapper.selectFileById(dto);
		
		return file;
	}

	@Override
	public AttachFileVO getFileById(Integer fid) {
		AttachFileVO file = this.mapper.selectFileById(fid);
		return file;
	}//overLOADING

	@Override
	public void updateFile(AttachFileDTO dto) {
		this.mapper.updateFile(dto);
		
	}

	@Override
	public void removeExistFileFromBoard(BoardDTO dto) {
		this.mapper.updateExistFileFromBoard(dto);
		this.mapper.deleteExistFile(dto);
		
	}

	
	
	
	
	@Override
	public void load_img(BoardDTO dto, AttachFileVO file, HttpServletResponse response) {

		String path = "/Users/jinsung/Desktop/opt/eclipse/workspace/PROJECT/G-Fair-BackEnd/src/main/webapp/resources/img" + file.getFpath() + "/";
		String fileReName = file.getFrename();
		
		File img = new File(path + fileReName);
		
		
		try {
			
			FileInputStream fis = new FileInputStream(img);
			OutputStream out = response.getOutputStream();
			
			
			byte[] buffer = new byte[1024];
			
			try(out; fis;) {
				
				int data;
				while ( (data = fis.read(buffer)) != -1) {
					out.write(buffer, 0, data);
				}//while
				
			}//try-with-resource
			
		} catch (Exception e) {
			
		}//try-catch
		
	}

	//글수
	@Override
	public void uploadFileByModify(BoardDTO dto, MultipartFile file) throws Exception {
		AttachFileDTO attachDTO = new AttachFileDTO();
		
		
		//String uploadDir = "/Users/jinsung/Desktop/temp/upload/";
		String uploadBaseDir = imgFileName;
		File uploadPath = new File(uploadBaseDir, getFolder());
		
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		
		
		if(file.getSize() > 0) {
			try {
				
				String uuidFile = UUID.randomUUID().toString();
				
				byte[] fileData = file.getBytes();
				FileOutputStream fos = new FileOutputStream(uploadPath + "/" + uuidFile + "_" + file.getOriginalFilename());
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				
				try(fos; bos;) {
					attachDTO.setFpath("/"+getFolder());
					attachDTO.setForname(file.getOriginalFilename());
					attachDTO.setFrename(uuidFile + "_" + file.getOriginalFilename());
					
					bos.write(fileData);
					if(dto.getFid() != null) { //만약 기존 게시글의 파일이있는데 첨부파일 변경을 할때,
						attachDTO.setFid(dto.getFid()); //파일DTO의 FID값을 기존 게시글의 FID값으로 대치하고
						updateFile(attachDTO); //기존 파일테이블의 기존FID의 파일정보를 새로 첨부한 파일로 업데이트   
					} else { //만약 기존 게시글의 첨부된 파일이 없었는데 파일 첨부를 한다면,
						uploadFile(attachDTO); //새로운 파일테이블의 파일 업로드 
						addFileId(dto); //새로 작성한 게시글의 fid정보 업데이트
					}

				}//try-with-resources
				
			} catch (Exception e) {
				// TODO: handle exception
			}//try-catch
		}//if

		
	}

	
	//글쓸때
	@Override
	public void uploadFileByWrite(BoardDTO dto, MultipartFile file) throws Exception {
		AttachFileDTO attachDTO = new AttachFileDTO();
		
		
		//String uploadDir = "/Users/jinsung/Desktop/temp/upload/";
		String uploadBaseDir = imgFileName;
		File uploadPath = new File(uploadBaseDir, getFolder());
		
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		
		
		if(file.getSize() > 0) {
			try {
				
				String uuidFile = UUID.randomUUID().toString();
				 
				byte[] fileData = file.getBytes();
				FileOutputStream fos = new FileOutputStream(uploadPath + "/" + uuidFile + "_" + file.getOriginalFilename());
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				
				try(fos; bos;) {
					attachDTO.setFpath("/"+getFolder());
					attachDTO.setForname(file.getOriginalFilename());
					attachDTO.setFrename(uuidFile + "_" + file.getOriginalFilename());
					
					bos.write(fileData);
					
					uploadFile(attachDTO);
					addFileId(dto);
				}//try-with-resources
				
			} catch (Exception e) {
				// TODO: handle exception
			}//try-catch
		}//if
		
	}

	//회원가입할때
	@Override
	public void uploadFileByRegister(MemberDTO dto, MultipartFile file) throws Exception {
		AttachFileDTO attachDTO = new AttachFileDTO();
		
		
		//String uploadDir = "/Users/jinsung/Desktop/temp/upload/";
		String uploadBaseDir = imgFileName;
		File uploadPath = new File(uploadBaseDir, getFolder());
		
		if(!uploadPath.exists()) {
			uploadPath.mkdirs();
		}
		
		
		if(file.getSize() > 0) {
			try {
				
				String uuidFile = UUID.randomUUID().toString();
				
				byte[] fileData = file.getBytes();
				FileOutputStream fos = new FileOutputStream(uploadPath + "/" + uuidFile + "_" + file.getOriginalFilename());
				BufferedOutputStream bos = new BufferedOutputStream(fos);
				
				try(fos; bos;) {
					attachDTO.setFpath("/"+getFolder());
					attachDTO.setForname(file.getOriginalFilename());
					attachDTO.setFrename(uuidFile + "_" + file.getOriginalFilename());
					
					bos.write(fileData);
					
					uploadFile(attachDTO);
				}//try-with-resources
				
			} catch (Exception e) {
				// TODO: handle exception
			}//try-catch
		}//if
		
	}

	
	@Override
	public String getFolder() throws Exception {
		log.debug("getFolder() invoked");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		log.info("\t +SimpleDateFormat : "+sdf);
		
		Date date = new Date();
		log.info("\t +date : "+date);
		
		String str = sdf.format(date);
		log.info("\t +str : "+str);
		
		return str;
//		return str.replace("-", File.separator);
	}//getFolder
	

}
