
package com.naru.view.codecheck;

import java.io.EOFException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.naru.main.Pager;
import com.naru.model.codecheck.CodecheckVO;
import com.naru.model.codecheck.impl.CodecheckServiceImpl;

@Controller
@SessionAttributes("codecheck")
public class CodecheckController {

	@Autowired
	private CodecheckServiceImpl codecheckService;

	//���� ���ε�
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String handleFileUpload(@RequestParam("file") MultipartFile file) throws Exception {
	    InputStream inputStream = null;
	    Workbook workbook = null;
	    try {
	        inputStream = file.getInputStream();
	        workbook = new XSSFWorkbook(inputStream);
	        Sheet sheet = workbook.getSheetAt(0);
	        Iterator<Row> iterator = sheet.iterator();
	        while (iterator.hasNext()) {
	            Row currentRow = iterator.next();
	            CodecheckVO vo = new CodecheckVO();
	            vo.setCodecheck_bcode(currentRow.getCell(0).getStringCellValue());
	            vo.setCodecheck_bname(currentRow.getCell(1).getStringCellValue());
	            vo.setCodecheck_bshop(currentRow.getCell(2).getStringCellValue());
	            vo.setCodecheck_btel(currentRow.getCell(3).getStringCellValue());
	            vo.setCodecheck_bpax(currentRow.getCell(4).getStringCellValue());
	            vo.setCodecheck_bzipcode(currentRow.getCell(5).getStringCellValue());
	            vo.setCodecheck_baddr(currentRow.getCell(6).getStringCellValue());
	            vo.setCodecheck_bsection(currentRow.getCell(7).getStringCellValue());
	            vo.setCodecheck_bspot(currentRow.getCell(8).getStringCellValue());
	            codecheckService.createCodecheck(vo);
	        }
	    } catch (EOFException e) {
	        // ������ ���� �����Ͽ� �� �̻� �о���� �����Ͱ� ���� �� �߻��ϴ� ���� ó��
	        System.out.println("������ ���� �����Ͽ� �� �̻� �о���� �����Ͱ� �����ϴ�.");
	    } catch (Exception e) {
	        System.out.println(e.toString());
	        e.printStackTrace();
	    } finally {
	        if (workbook != null) {
	             ((AutoCloseable) workbook).close();
	        }
	        if (inputStream != null) {
	            inputStream.close();
	        }
	    }
	    return "redirect:/codelist";
	}

	
	//���ε� ���� ������ ����
	@RequestMapping(value = "/createCodecheck", method = RequestMethod.POST)
	public String createCodecheck(
	        @RequestParam String param1,
	        @RequestParam String param2,
	        @RequestParam String param3,
	        @RequestParam String param4,
	        @RequestParam String param5,
	        @RequestParam String param6,
	        @RequestParam String param7,
	        @RequestParam String param8,
	        @RequestParam String param9) throws Exception {
	    CodecheckVO vo = new CodecheckVO();
	    vo.setCodecheck_bcode(param1);
	    vo.setCodecheck_bname(param2);
	    vo.setCodecheck_bshop(param3);
	    vo.setCodecheck_btel(param4);
	    vo.setCodecheck_bpax(param5);
	    vo.setCodecheck_bzipcode(param6);
	    vo.setCodecheck_baddr(param7);
	    vo.setCodecheck_bsection(param8);
	    vo.setCodecheck_bspot(param9);
	    codecheckService.createCodecheck(vo);
	    return "redirect:/codelist";
	}
	
	//����Ʈ, ����¡, �˻�  
	@RequestMapping("/codecheck")
	public String listAllCodecheck(Model model, HttpSession session,
	    @RequestParam(defaultValue = "CODECHECK_BNAME") String searchOption,
	    @RequestParam(defaultValue = "") String keyword,
	    @RequestParam(defaultValue = "") String search,
	    @RequestParam(defaultValue = "1") int curPage)
	    throws Exception {
	  
	  // �Խñ� ���� ���
	  int count = codecheckService.getCountCodecheck(searchOption, keyword);
	  
	  	session.setAttribute("searchOption", searchOption);
		session.setAttribute("keyword", keyword);
		session.setAttribute("search", search);
		session.setAttribute("curPage", curPage);
	  
	  // ������ ���� ����
	  Pager pager = new Pager(count, curPage);
	  int start = pager.getPageBegin();
	  int end = pager.getPageEnd();
	  
	  List<CodecheckVO> list = codecheckService.listAllCodecheck(searchOption, keyword, start, end); // �Խñ� ���
	  
	  HashMap<String, Object> map = new HashMap<String, Object>();
	  map.put("list", list); // map�� �ڷ� ����
	  map.put("count", count);
	  map.put("pager", pager); // �������׹����̼��� ���� ����
	  map.put("searchOption", searchOption);
	  map.put("keyword", keyword);
	  map.put("search", search);
	  
	  model.addAttribute("map", map);

		  return "codecheck/codelist";
		  }
	}
