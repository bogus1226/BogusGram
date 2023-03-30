package com.bogus.bogusgram.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {
	

	//public static final String FILE_UPLOAD_PATH = "D:\\염근효\\springProject\\upload\\bogusGram\\images";
	public static final String FILE_UPLOAD_PATH = "C:\\Users\\user\\Desktop\\웹프로그래밍\\07springProject\\upload\\bogusGram\\images";
	
	private static Logger logger = LoggerFactory.getLogger(FileManagerService.class);
									
	
	public static String saveFile(int userId, MultipartFile file) {
		
		if(file == null) {
			return null;
		}
	
		
		String directoryName = "/" + userId + "_" + System.currentTimeMillis() + "/";
		
		String directoryPath = FILE_UPLOAD_PATH + directoryName;
		File directory = new File(directoryPath);
		if(!directory.mkdir()) {
			
			logger.error("saveFile : 디렉토리 생성 실패 " + directoryPath);
			return null;
		}
		
		try {
			byte[] bytes = file.getBytes();
			
			String filePath = directoryPath + file.getOriginalFilename();
			
			Path path = Paths.get(filePath);
			
			Files.write(path, bytes);
			
			
		} catch (IOException e) {
			
			logger.error("saveFile : 파일 저장 실패 " + directoryPath);
			e.printStackTrace();
			
			return null;
		}
		
		
		return "/images" + directoryName + file.getOriginalFilename();
	}
	
	public static boolean removeFile(String filePath) {
		
		if(filePath == null) {
			logger.info("삭제 대상 파일 없음");
			return false;
		}
		
		String fullFilePath = FILE_UPLOAD_PATH + filePath.replace("/images", "");
		Path path = Paths.get(fullFilePath);
		
		if(Files.exists(path)) {
			try {
				Files.delete(path);
			} catch (IOException e) {
				
				logger.error("removeFile : 파일 삭제 에러 " + path);
				e.printStackTrace();
				
				return false;
			}	
		}
		
		Path dirPath = path.getParent();
		
		if(Files.exists(dirPath)) {
			
			try {
				Files.delete(dirPath);
			} catch (IOException e) {
				logger.error("removeFile : 디렉토리 삭제 에러 " + dirPath);
				e.printStackTrace();
			}
		}
		
		return true;
		
	}
}
