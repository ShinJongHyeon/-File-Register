package com.naru.model.fileregister;

import java.util.List;

import com.naru.model.change.ChangeVO;
import com.naru.model.codecheck.CodecheckVO;


public interface FileregisterService {
		
		void uploadFile(FileregisterVO vo) throws Exception;				 	//�Խñ� ����
		
		void updateFileregister(FileregisterVO vo) throws Exception;
		
		//�Խñ� ���
		List<FileregisterVO> listAllFileregister(String searchOption, String keyword, String selectedDate, int start, int end) throws Exception;
		
		//�Խñ� ����
		int getCountFileregister(String searchOption, String keyword) throws Exception;

		List<FileregisterVO> listByDate(String selectedDate) throws Exception;


		
	}
