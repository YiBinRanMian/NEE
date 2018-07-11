package scdx.group17.controller;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import scdx.group17.common.util.FileInfoUtils;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/FileUpload")
public class FileUploadController {
	 @RequestMapping(value="/upload.do",method=RequestMethod.POST)
	 public String upload(HttpServletRequest request,
			@RequestParam("description") String description,
			@RequestParam("file") MultipartFile file) throws Exception {
		 
	    System.out.println(description);
		if(!file.isEmpty()) {
		/*此处设置保存路径*/
			String path = "/Users/macbookair/Desktop/courseware/";
			String filename = file.getOriginalFilename();
		    File filepath = new File(path,filename);
	        if (!filepath.getParentFile().exists()) {
	        	filepath.getParentFile().mkdirs();
	        }
			file.transferTo(new File(path + File.separator + filename));
			return "userInfo";
		} else {
			return "error";
		}
	 }
	 


	 
	 @RequestMapping(value="/download.do")
	 public ResponseEntity<byte[]> download(HttpServletRequest request,
			 @RequestParam("filename") String filename,
			 Model model)throws Exception {
		/*此处设置保存路径*/
		 String path = "/Users/macbookair/Desktop/courseware/";

		 File file = new File(path + File.separator + filename);
        HttpHeaders headers = new HttpHeaders();  
        String downloadFielName = new String(filename.getBytes("UTF-8"),"iso-8859-1");
        headers.setContentDispositionFormData("attachment", downloadFielName);
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),    
                headers, HttpStatus.CREATED);  
	 }
/*页面跳转*/
	 @RequestMapping("/uploadForm.do")
	public String transto(){
	 	return "upload";
	 }

	 @RequestMapping("/getAllFiles.do")
	public String getAllFiles(Model model){
		 String path = "/Users/macbookair/Desktop/courseware/";
		 File file = new File(path);
		 String [] fileNames = file.list();
		 Map<String,String> nameSizeMap = new HashMap<String, String>();
		 if (fileNames != null) {
			 for (String temp:fileNames){
                 nameSizeMap.put(temp, FileInfoUtils.FormetFileSize(FileInfoUtils.getFileSize(path+File.separator+temp)));
             }
		 }
		 model.addAttribute("fileNames",fileNames);
		 model.addAttribute("nameSizeMap",nameSizeMap);
		 return "filelist";
	 }

}