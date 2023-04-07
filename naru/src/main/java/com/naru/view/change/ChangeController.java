package com.naru.view.change;
  
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.naru.model.board.BoardVO;
import com.naru.model.change.ChangeService;
import com.naru.model.change.ChangeVO;
  
  @Controller
  
  @SessionAttributes("change")
  public class ChangeController {
  
  @Autowired private ChangeService changeService;

  @RequestMapping(value = "/change")
	public String Change() {
		return "change/change";
	}
  
  	/*
	@RequestMapping("/updateChange")
	public String updateChange1(ChangeVO vo) throws Exception {
		return "change/updateChange";
	}
	*/
  
	// 게시글 수정
		@RequestMapping(value = "/updateChange", method = RequestMethod.POST)
		public String updateChange(ChangeVO vo) throws Exception {
			if (vo. getChange_date() != null) {
				changeService.updateChange(vo);
				return "change/updateChange";
			} 
			// return "redirect:/board";
			return null;
		}
  
  }

