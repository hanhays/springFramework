package ca.project.Controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ca.project.DTO.PageTO;
import ca.project.DTO.WineDTO;
import ca.project.Service.WineService;
import ca.project.utils.UploadFileUtils;

@Controller
@RequestMapping("wine")
public class WineController {
	
	@Autowired
	private WineService wine_service;
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	// 상품등록 get
	@RequestMapping(value = "insert", method = RequestMethod.GET)
	public String insertui() {
		return "wine/wine_insert";
	}
	
	// 상품등록 post
	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insert(WineDTO wdto, MultipartFile file) throws Exception{
		// 이미지를 업로드할 폴더를 설정
		// imageUploadPath = C:\workspace_spring_c601\Wine_shoppingmall\src\main\webapp\resources + \ + wine_images
		String imageUploadPath = uploadPath + File.separator + "wine_images";	
		
		String ymdPath = UploadFileUtils.calcPath(imageUploadPath);	// 위의 폴더를 기준으로 연월일 폴더 경로
		
		String newFileName = null;
		String newFileNameThumb = null;
		
		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			
			newFileName = UploadFileUtils.fileUpload(imageUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
			
			// 파일 경로 + 파일명 저장
			wdto.setWine_img(File.separator + "wine_images" + ymdPath + File.separator + newFileName);
			wdto.setWine_thumbimg(File.separator + "wine_images" + ymdPath + File.separator + "thumb" + File.separator + "thumb_" + newFileName);
			
		}else {	 // 첨부된 파일이 없으면
			// 미리 준비된 none.jpg파일을 대신 출력함
			newFileName = File.separator + "wine_images" + File.separator + "none.jpg";
			newFileNameThumb = File.separator + "wine_images" + File.separator + "thumb_none.jpg";
			wdto.setWine_img(newFileName);
			wdto.setWine_thumbimg(newFileNameThumb);
		}
		
		wine_service.insert(wdto);
		
		return "redirect:/wine/list";
	}

	// 상품 목록
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(PageTO to, Model model) {
		to = wine_service.list(to);
		model.addAttribute("to", to);
		
		String listname = "list?";
		model.addAttribute("listname", listname);
		return "wine/wine_list";
	}
	
	@RequestMapping("search")
	public String search(@RequestParam("content") String content, PageTO to, Model model) {
		to= wine_service.search(to, content);
		model.addAttribute("to", to);
		
		return "wine/wine_list";
	}

	// select list
	@RequestMapping(value = "selectList", method = RequestMethod.GET)
	public String selectList(@RequestParam("wine_type") String wine_type, PageTO to, Model model) {
		to = wine_service.selectList(to, wine_type);
		model.addAttribute("to", to);
		
		String listname = "selectList?wine_type=" + to.getWlist().get(0).getWine_type() + "&";
		model.addAttribute("listname", listname);
		return "wine/wine_list";
	}
	
	
	
	// 상품정보 자세히 보기
	@RequestMapping(value = "read/{wine_code}", method = RequestMethod.GET)
	public String read(@PathVariable("wine_code") String wine_code, Model model) {
		WineDTO wdto = wine_service.read(wine_code);
		model.addAttribute("wdto", wdto);
		return "wine/wine_read";
	}
	
	// 상품정보 수정하기 get
	@RequestMapping(value = "update/{wine_code}", method = RequestMethod.GET)
	public String updateui(@PathVariable("wine_code") String wine_code, Model model) {
		WineDTO wdto = wine_service.read(wine_code);
		model.addAttribute("wdto", wdto);
		return "wine/wine_update";
	}
	
	// 상품정보 수정하기 post
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(WineDTO wdto, MultipartFile file, HttpServletRequest request) throws Exception {
		
		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			new File(uploadPath + request.getParameter("wine_img")).delete();
			new File(uploadPath + request.getParameter("wine_thumbimg")).delete();
			
			String imageUploadPath = uploadPath + File.separator + "wine_images";	
			String ymdPath = UploadFileUtils.calcPath(imageUploadPath);	
			String newFileName = UploadFileUtils.fileUpload(imageUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
			
			wdto.setWine_img(File.separator + "wine_images" + ymdPath + File.separator + newFileName);
			wdto.setWine_thumbimg(File.separator + "wine_images" + ymdPath + File.separator + "thumb" + File.separator + "thumb_" + newFileName);
		}else {
			wdto.setWine_img(request.getParameter("wine_img"));
			wdto.setWine_thumbimg(request.getParameter("wine_thumbimg"));
		}
		
		wine_service.update(wdto);
		
		return "redirect:/wine/read/"+wdto.getWine_code();
	}
	
	// 상품 삭제
	@RequestMapping(value = "delete/{wine_code}", method = RequestMethod.GET)
	public String delete(@PathVariable("wine_code") String wine_code) {
		wine_service.delete(wine_code);
		return "redirect:/wine/list";
	}
	

	
}
