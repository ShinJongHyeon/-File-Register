
  package com.naru.view.fileregister;
  
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Time;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naru.main.Pager;
import com.naru.model.fileregister.FileregisterService;
import com.naru.model.fileregister.FileregisterVO;
  
  @Controller
  
  @SessionAttributes("fileregister")
  public class FileregisterController {
  
  @Autowired private FileregisterService fileregisterService;
  

  @RequestMapping(value="/uploadFile", method=RequestMethod.POST)
  @ResponseBody
  public String uploadFile(@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) {
      if (!file.isEmpty()) {
          try {
        	  
              BufferedReader br = new BufferedReader(new InputStreamReader(file.getInputStream(), "UTF-8"));
              System.out.println(file);
              String line = null;
              
              while ((line = br.readLine()) != null) {
            	  System.out.println(line);
                  String[] fields = line.trim().split(",");
                  FileregisterVO vo = new FileregisterVO();	
                  
                  
                  vo.setFileregister_currentdate(fields[0].trim());
                  vo.setFileregister_blocknumber(fields[1].trim());
                  vo.setFileregister_handlenumber(fields[2].trim());
                  vo.setFileregister_billtype(fields[3].trim());
                  vo.setFileregister_state(fields[4].trim());
                  vo.setFileregister_checknumber(fields[5].trim());
                  vo.setFileregister_bankcode(fields[6].trim());
                  vo.setFileregister_shopcode(fields[7].trim());
                  vo.setFileregister_moneytype(fields[8].trim());
                  vo.setFileregister_price(fields[9].trim());
                  vo.setFileregister_imagepath(fields[10].trim());
                  
                  DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
                  java.util.Date utilDate = dateFormat.parse(fields[11].trim());
                  java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
                  vo.setFileregister_createdate(sqlDate);
                  
                  DateFormat datetimeFormat = new SimpleDateFormat("HHmmss");
                  Time sqlTime = new java.sql.Time(datetimeFormat.parse(fields[12].trim()).getTime());
                  vo.setFileregister_createtime(sqlTime);
                  
                  vo.setFileregister_creater(fields[13].trim());
                  fileregisterService.uploadFile(vo);
              }
              redirectAttributes.addFlashAttribute("message", "File uploaded successfully");
              return "redirect:/fileregister";
          } catch (Exception e) {
              e.printStackTrace();
              return "fail";
          }
      } else {
          return "fail";
      }
  }

  
  @RequestMapping(value = "/updateFileregister", method = RequestMethod.POST)
	public String updateFileregister(@RequestParam("selectedDate") String selectedDate) throws Exception {
		
		FileregisterVO vo = new FileregisterVO();
		vo.setFileregister_currentdate(selectedDate);
		
		fileregisterService.updateFileregister(vo);
		
		return "redirect:/fileregister"; // 작업일자를 변경한 후에는 홈으로 리다이렉트합니다.
	}

  
  	//게시글 목록 + 검색 + 페이징
  @RequestMapping(value = "/fileregister")
  public String listAllFileregister(Model model, HttpSession session,
      @RequestParam(defaultValue = "FILEREGISTER_CURRENTDATE") String searchOption,
      @RequestParam(defaultValue = "") String keyword,
      @RequestParam(defaultValue = "") String search,
      @RequestParam(defaultValue = "1") int curPage,
      @RequestParam(defaultValue = "") String selectedDate) throws Exception {

	  // 게시글 갯수 계산
      int count = fileregisterService.getCountFileregister(searchOption, keyword);
	  
      	session.setAttribute("searchOption", searchOption);
		session.setAttribute("keyword", keyword);
		session.setAttribute("search", search);
		session.setAttribute("curPage", curPage);
      
      // 페이지 관련 설정
      Pager pager = new Pager(count, curPage);
      int start = pager.getPageBegin();
      int end = pager.getPageEnd();
      
	  List<FileregisterVO> list = fileregisterService.listAllFileregister(searchOption, keyword, selectedDate, start, end); // 게시글 목록


      HashMap<String, Object> map = new HashMap<String, Object>();
      map.put("list", list);
      map.put("count", count);
      map.put("pager", pager);
      map.put("searchOption", searchOption);
      map.put("keyword", keyword);
      map.put("search", search);
      map.put("selectedDate", selectedDate); // 추가된 파라미터
      model.addAttribute("map", map);
      return "fileregister/file";
  }
		}
