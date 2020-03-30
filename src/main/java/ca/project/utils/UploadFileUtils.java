package ca.project.utils;

import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;
import org.springframework.util.FileCopyUtils;
import net.coobird.thumbnailator.Thumbnails;

public class UploadFileUtils {
	
	static final int THUM_WIDTH = 99;	// 썸네일의 가로 크기
	static final int THUM_HEIGHT = 119;	// 썸네일의 세로 크기
	
	public static String fileUpload(String imageUploadPath, String originalFileName, byte[] fileData, String ymdPath) throws Exception{
		
		UUID uuid = UUID.randomUUID();	// 랜덤문자 생성
		
		String newFileName = uuid + "_" + originalFileName;	// 새로운파일명 = "랜덤문자_원래파일명"
		
		String imageSavePath = imageUploadPath + ymdPath;		// 이미지 저장 경로 = 업로드 경로 + 연월일 경로
		
		// 업로드되는 이미지파일 객체생성(이미지저장경로에, 새로운파일명으로)
		File uploadNewImage = new File(imageSavePath, newFileName);
		FileCopyUtils.copy(fileData, uploadNewImage);	// 파라미터로 받아온 원본이미지파일데이터 복사해서 넣어줌
		
		String thumbFileName = "thumb_" + newFileName;	// 썸네일 파일명 = "thumb_새로운파일명"
		
		// 썸네일이미지파일 객체생성(썸네일저장경로에 썸네일 파일명으로)
		File thumbnail = new File(imageSavePath + File.separator + "thumb" + File.separator + thumbFileName);
		
		// 업로드된 이미지파일로 새로운 파일객체 생성
		File newImage = new File(imageSavePath + File.separator + newFileName);
		
		// 새로운 파일객체 존재하는가?
		if (newImage.exists()) {
			// 그러면
			thumbnail.getParentFile().mkdirs();	// 썸네일이 저장될 폴더를 생성
			Thumbnails.of(newImage).size(THUM_WIDTH, THUM_HEIGHT).toFile(thumbnail);	// 썸네일 생성
		}
		
		return newFileName;
	}
	
	// 연월일 경로
	public static String calcPath(String imageUploadPath) {
		Calendar cal = Calendar.getInstance();
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);     
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(imageUploadPath, yearPath, monthPath, datePath);
		makeDir(imageUploadPath, yearPath, monthPath, datePath + "\\thumb");
		
		return datePath;
	}

	// 폴더 생성
	private static void makeDir(String uploadPath, String... paths) {
		
		if (new File(paths[paths.length - 1]).exists()) {
			return;
		}
		
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);
			if (!dirPath.exists()) {
				dirPath.mkdir();
			}
		}
	}
	
	
	
}






