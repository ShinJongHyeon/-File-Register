package com.naru.model.fileregister.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naru.model.change.ChangeVO;
import com.naru.model.fileregister.FileregisterService;
import com.naru.model.fileregister.FileregisterVO;

@Service("fileregisterService")
public class FileregisterServiceImpl implements FileregisterService {

	@Autowired
	private FileregisterDAO fileregisterDAO;

	// �Խñ� ����
	public void uploadFile(FileregisterVO vo) throws Exception {
		fileregisterDAO.uploadFile(vo);
	}
	
	public void updateFileregister(FileregisterVO vo) throws Exception {
		fileregisterDAO.updateFileregister(vo);
	}

	// �Խñ� ���
	public List<FileregisterVO> listAllFileregister(String searchOption, String keyword, String selectedDate, int start, int end) throws Exception {
		return fileregisterDAO.listAllFileregister(searchOption, keyword, selectedDate, start, end);
	}

	// �Խñ� ����
		public int getCountFileregister(String searchOption, String keyword) throws Exception {
			return fileregisterDAO.getCountFileregister(searchOption, keyword);
		}
		
		
	public List<FileregisterVO> listByDate(String selectedDate) throws Exception {
	    return fileregisterDAO.listByDate(selectedDate);
	}

	
}