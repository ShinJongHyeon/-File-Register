package com.naru.model.codecheck;


	public class CodecheckVO {
		
		private String codecheck_bcode; 			//은행 코드
		private String codecheck_bname;			//은행명
		private String codecheck_bshop;			//점포명
		private String codecheck_btel;				//전화번호
		private String codecheck_bpax;				//팩스
		private String codecheck_bzipcode;			//우편번호
		private String codecheck_baddr;			//주소
		private String codecheck_bsection;		//구분
		private String codecheck_bspot;			//폐쇄관리지점
		
		
		public String getCodecheck_bcode() {
			return codecheck_bcode;
		}
		public void setCodecheck_bcode(String codecheck_bcode) {
			this.codecheck_bcode = codecheck_bcode;
		}
		public String getCodecheck_bname() {
			return codecheck_bname;
		}
		public void setCodecheck_bname(String codecheck_bname) {
			this.codecheck_bname = codecheck_bname;
		}
		public String getCodecheck_bshop() {
			return codecheck_bshop;
		}
		public void setCodecheck_bshop(String codecheck_bshop) {
			this.codecheck_bshop = codecheck_bshop;
		}
		public String getCodecheck_btel() {
			return codecheck_btel;
		}
		public void setCodecheck_btel(String codecheck_btel) {
			this.codecheck_btel = codecheck_btel;
		}
		public String getCodecheck_bpax() {
			return codecheck_bpax;
		}
		public void setCodecheck_bpax(String codecheck_bpax) {
			this.codecheck_bpax = codecheck_bpax;
		}
		public String getCodecheck_bzipcode() {
			return codecheck_bzipcode;
		}
		public void setCodecheck_bzipcode(String codecheck_bzipcode) {
			this.codecheck_bzipcode = codecheck_bzipcode;
		}
		public String getCodecheck_baddr() {
			return codecheck_baddr;
		}
		public void setCodecheck_baddr(String codecheck_baddr) {
			this.codecheck_baddr = codecheck_baddr;
		}
		public String getCodecheck_bsection() {
			return codecheck_bsection;
		}
		public void setCodecheck_bsection(String codecheck_bsection) {
			this.codecheck_bsection = codecheck_bsection;
		}
		public String getCodecheck_bspot() {
			return codecheck_bspot;
		}
		public void setCodecheck_bspot(String codecheck_bspot) {
			this.codecheck_bspot = codecheck_bspot;
		}
		@Override
		public String toString() {
			return "CodecheckVO [codecheck_bcode=" + codecheck_bcode + ", codecheck_bname=" + codecheck_bname
					+ ", codecheck_bshop=" + codecheck_bshop + ", codecheck_btel=" + codecheck_btel
					+ ", codecheck_bpax=" + codecheck_bpax + ", codecheck_bzipcode=" + codecheck_bzipcode
					+ ", codecheck_baddr=" + codecheck_baddr + ", codecheck_bsection=" + codecheck_bsection
					+ ", codecheck_bspot=" + codecheck_bspot + "]";
		}
		
			
	}