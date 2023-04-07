package com.naru.model.fileregister;

import java.sql.Time;

public class FileregisterVO {
		
		private String fileregister_currentdate; // 작업일자
	    private String fileregister_blocknumber; // 블럭번호
	    private String fileregister_handlenumber; // 처리번호
	    private String fileregister_billtype; // 장표구분
	    private String fileregister_state; // 독취구분
	    private String fileregister_checknumber; // 수표번호
	    private String fileregister_bankcode; // 은행코드
	    private String fileregister_shopcode; // 지점코그
	    private String fileregister_moneytype; // 권종
	    private String fileregister_price; // 금액
	    private String fileregister_imagepath; // 이미지 경로
	    private java.sql.Date fileregister_createdate; // 생성일자
	    private Time fileregister_createtime; // 생성시간
	    private String fileregister_creater;
	    
	    
	    
		
		public String getFileregister_currentdate() {
			return fileregister_currentdate;
		}
		public void setFileregister_currentdate(String fileregister_currentdate) {
			this.fileregister_currentdate = fileregister_currentdate;
		}
		
		public String getFileregister_blocknumber() {
			return fileregister_blocknumber;
		}
		public void setFileregister_blocknumber(String fileregister_blocknumber) {
			this.fileregister_blocknumber = fileregister_blocknumber;
		}
		public String getFileregister_handlenumber() {
			return fileregister_handlenumber;
		}
		public void setFileregister_handlenumber(String fileregister_handlenumber) {
			this.fileregister_handlenumber = fileregister_handlenumber;
		}
		public String getFileregister_billtype() {
			return fileregister_billtype;
		}
		public void setFileregister_billtype(String fileregister_billtype) {
			this.fileregister_billtype = fileregister_billtype;
		}
		public String getFileregister_state() {
			return fileregister_state;
		}
		public void setFileregister_state(String fileregister_state) {
			this.fileregister_state = fileregister_state;
		}
		public String getFileregister_checknumber() {
			return fileregister_checknumber;
		}
		public void setFileregister_checknumber(String fileregister_checknumber) {
			this.fileregister_checknumber = fileregister_checknumber;
		}
		public String getFileregister_bankcode() {
			return fileregister_bankcode;
		}
		public void setFileregister_bankcode(String fileregister_bankcode) {
			this.fileregister_bankcode = fileregister_bankcode;
		}
		public String getFileregister_shopcode() {
			return fileregister_shopcode;
		}
		public void setFileregister_shopcode(String fileregister_shopcode) {
			this.fileregister_shopcode = fileregister_shopcode;
		}
		public String getFileregister_moneytype() {
			return fileregister_moneytype;
		}
		public void setFileregister_moneytype(String fileregister_moneytype) {
			this.fileregister_moneytype = fileregister_moneytype;
		}
		public String getFileregister_price() {
			return fileregister_price;
		}
		public void setFileregister_price(String fileregister_price) {
			this.fileregister_price = fileregister_price;
		}
		public String getFileregister_imagepath() {
			return fileregister_imagepath;
		}
		public void setFileregister_imagepath(String fileregister_imagepath) {
			this.fileregister_imagepath = fileregister_imagepath;
		}
		public java.sql.Date getFileregister_createdate() {
			return fileregister_createdate;
		}
		public void setFileregister_createdate(java.sql.Date fileregister_createdate) {
			this.fileregister_createdate = fileregister_createdate;
		}
		public Time getFileregister_createtime() {
			return fileregister_createtime;
		}
		public void setFileregister_createtime(Time fileregister_createtime) {
			this.fileregister_createtime = fileregister_createtime;
		}
		public String getFileregister_creater() {
			return fileregister_creater;
		}
		public void setFileregister_creater(String fileregister_creater) {
			this.fileregister_creater = fileregister_creater;
		}
		
		@Override
		public String toString() {
			return "FileregisterVO [fileregister_currentdate=" + fileregister_currentdate
					+ ", fileregister_blocknumber=" + fileregister_blocknumber + ", fileregister_handlenumber="
					+ fileregister_handlenumber + ", fileregister_billtype=" + fileregister_billtype
					+ ", fileregister_state=" + fileregister_state + ", fileregister_checknumber="
					+ fileregister_checknumber + ", fileregister_bankcode=" + fileregister_bankcode
					+ ", fileregister_shopcode=" + fileregister_shopcode + ", fileregister_moneytype="
					+ fileregister_moneytype + ", fileregister_price=" + fileregister_price
					+ ", fileregister_imagepath=" + fileregister_imagepath + ", fileregister_createdate="
					+ fileregister_createdate + ", fileregister_createtime=" + fileregister_createtime
					+ ", fileregister_creater=" + fileregister_creater + "]";
		}
		
	
	    
	    
		
	}