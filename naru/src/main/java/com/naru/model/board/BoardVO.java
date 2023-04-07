package com.naru.model.board;

import java.sql.Date;

	public class BoardVO {
		private int bno; 			//�Խñ� ��ȣ
		private String title; 		//�Խñ� ����
		private String content;		//�Խñ� ����
		private String writer; 		//�ۼ��� ID
		private Date regDate; 		//java.util.Date
		private int viewCnt; 		//��ȸ��
		private String name;		//�ۼ��� �̸�
		private String cnt; 		//��� ����
		private String show; 		//ȭ�� ǥ�ÿ���
		
		
		public int getBno() {
			return bno;
		}
		
		public void setBno(int bno) {
			this.bno = bno;
		}
		
		public String getTitle() {
			return title;
		}
		
		public void setTitle(String title) {
			this.title = title;
		}
		
		public String getContent() {
			return content;
		}
		
		public void setContent(String content) {
			this.content = content;
		}
		
		public String getWriter() {
			return writer;
		}
		
		public void setWriter(String writer) {
			this.writer = writer;
		}
		
		public Date getRegDate() {
			return regDate;
		}

		public void setRegDate(Date regDate) {
			this.regDate = regDate;
		}

		public int getViewCnt() {
			return viewCnt;
		}

		public void setViewCnt(int viewCnt) {
			this.viewCnt = viewCnt;
		}

		public String getName() {
			return name;
		}
		
		public void setName(String name) {
			this.name = name;
		}
		
		public String getCnt() {
			return cnt;
		}
		
		public void setCnt(String cnt) {
			this.cnt = cnt;
		}
		
		public String getShow() {
			return show;
		}
		
		public void setShow(String show) {
			this.show = show;
		}

		@Override
		public String toString() {
			return "BoardVO [bno=" + bno + ", title=" + title + ", content=" + content + ", writer=" + writer
					+ ", regDate=" + regDate + ", viewCnt=" + viewCnt + ", name=" + name + ", cnt=" + cnt + ", show=" + show
					+ "]";
		}
		
		
		
	}
