package com.naru.model.change.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naru.model.change.ChangeService;
import com.naru.model.change.ChangeVO;

@Service("ChangeService")
public class ChangeServiceImpl implements ChangeService {

	@Autowired
	private ChangeDAO ChangeDAO;

	// 게시글 수정
	public void updateChange(ChangeVO vo) throws Exception {
		ChangeDAO.updateChange(vo);
	}


/*	// 게시글 목록
	public List<ChangeVO> listAllChange(String searchOption, String keyword, String selectedDate, int start, int end) throws Exception {
		return ChangeDAO.listAllChange(searchOption, keyword, selectedDate, start, end);
	}

	// 게시글 갯수
		public int getCountChange(String searchOption, String keyword) throws Exception {
			return ChangeDAO.getCountChange(searchOption, keyword);
		}
		
		
	public List<ChangeVO> listByDate(String selectedDate) throws Exception {
	    return ChangeDAO.listByDate(selectedDate);
	}
*/
	
}