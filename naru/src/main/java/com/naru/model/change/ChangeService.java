package com.naru.model.change;

import java.util.List;


public interface ChangeService {
		
		void updateChange(ChangeVO vo) throws Exception;					//게시글 수정
		

	/*	
		//게시글 목록
		List<ChangeVO> listAllChange(String searchOption, String keyword, String selectedDate, int start, int end) throws Exception;
		
		//게시글 갯수
		int getCountChange(String searchOption, String keyword) throws Exception;

		List<ChangeVO> listByDate(String selectedDate) throws Exception;

*/
		
	}
