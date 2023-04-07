package com.naru.main;

	public class Pager {
		 //페이지당 게시물 수
		public static final int PAGE_SCALE = 10;
		
		//화면당 페이지 수
		public static final int BLOCK_SCALE = 5;
		
		public int curPage;  	//현재 페이지
		public int prevPage; 	//이전페이지
		public int nextPage;	//다음페이지
		public int totPage;  	//전체 페이지 갯수
		public int totBlock;	//전체 페이지 블록 갯수
		public int curBlock; 	//현재 블록
		public int prevBlock;	//이전 블록
		public int nextBlock;	//다음 블록
		public int pageBegin;	//#{start}변수에 전달될 값
		public int pageEnd;  	//#{end}변수에 전달될 값
		public int blockBegin;	//블록의 시작 페이지 번호
		public int blockEnd; 	//블록의 끝 페이지 번호
		
		
		//생성자
		//Pager(레코드 갯수, 출력할 페이지 번호)
		public Pager(int count, int curPage) {
			curBlock = 1; 				//현재 블록번호
			this.curPage = curPage; 	//현재 페이지 번호
			setTotPage(count);			//전체 페이지 갯수 계산
			setPageRange(); 			//#{}, #{} 값 계산
			setTotBlock(); 				//전체 블록 갯수 계산 
			setBlockRange(); 			//블록의 시작, 끝 번호 계산
		}
		
		public void setBlockRange() {
			//원하는 페이지가 몇번째 블록에 속하는지 계산
			curBlock = (int)Math.ceil((curPage - 1) / BLOCK_SCALE) + 1;
			//블록의 시작, 끝 페이지 번호 계산
			blockBegin = (curBlock - 1) * BLOCK_SCALE + 1;
			blockEnd = blockBegin + BLOCK_SCALE - 1;
			
			//마지막 페이지 번호가 범위를 초과하지 않도록 처리
			if(blockEnd > totPage) {
				blockEnd = totPage;
			}
			
			//[이전], [다음]을 눌렀을 때 이동할 페이지 번호
			prevPage = (curBlock == 1) ? 1 : (curBlock - 1) * BLOCK_SCALE;
			nextPage = curBlock > totBlock ? (curBlock * BLOCK_SCALE) : (curBlock * BLOCK_SCALE) + 1;
			
			//마지막 페이지가 범위를 초과하지 않도록 처리
			if(nextPage >= totPage) {
				nextPage = totPage;
			}

		}
		
		//블록의 갯수 계산
		public void setTotBlock() {
			totBlock = (int)Math.ceil(totPage * 1.0 / BLOCK_SCALE);
		}
		
		//where rn getween #{start} and #{end}에 입력될 값
		public void setPageRange() {
			//시작번호 = (현재 페이지 - 1) X 페이지 당 게시물 수 + 1
			pageBegin = (curPage -1) * PAGE_SCALE + 1;
			//끝번호 = 시작번호 + 페이지 당 게시물 수 -1
			pageEnd = pageBegin + PAGE_SCALE - 1;
		}
		
		@Override
		public String toString() {
			return "Pager [curPage=" + curPage + ", prevPage=" + prevPage + ", nextPage=" + nextPage + ", totPage="
					+ totPage + ", totBlock=" + totBlock + ", curBlock=" + curBlock + ", prevBlock=" + prevBlock
					+ ", nextBlock=" + nextBlock + ", pageBegin=" + pageBegin + ", pageEnd=" + pageEnd + ", blockBegin="
					+ blockBegin + ", blockEnd=" + blockEnd + "]";
		}
		
		public int getCurPage() {
			return curPage;
		}
	
		public void setCurPage(int curPage) {
			this.curPage = curPage;
		}
		
		public int getPrevPage() {
			return prevPage;
		}
		
		public void setPrevPage(int prevPage) {
			this.prevPage = prevPage;
		}
		
		public int getNextPage() {
			return nextPage;
		}
		
		public void setNextPage(int nextPage) {
			this.nextPage = nextPage;
		}
		
		public int getTotPage() {
			return totPage;
		}
		
		public void setTotPage(int totPage) {
			this.totPage = totPage;
		}
		
		public int getTotBlock() {
			return totBlock;
		}
		
		public void setTotBlock(int totBlock) {
			this.totBlock = totBlock;
		}
		
		public int getCurBlock() {
			return curBlock;
		}
		
		public void setCurBlock(int curBlock) {
			this.curBlock = curBlock;
		}
		
		public int getPrevBlock() {
			return prevBlock;
		}
		
		public void setPrevBlock(int prevBlock) {
			this.prevBlock = prevBlock;
		}
		
		public int getNextBlock() {
			return nextBlock;
		}
		
		public void setNextBlock(int nextBlock) {
			this.nextBlock = nextBlock;
		}
		
		public int getPageBegin() {
			return pageBegin;
		}
		
		public void setPageBegin(int pageBegin) {
			this.pageBegin = pageBegin;
		}
		
		public int getPageEnd() {
			return pageEnd;
		}
		
		public void setPageEnd(int pageEnd) {
			this.pageEnd = pageEnd;
		}
		
		public int getBlockBegin() {
			return blockBegin;
		}
		
		public void setBlockBegin(int blockBegin) {
			this.blockBegin = blockBegin;
		}
		
		public int getBlockEnd() {
			return blockEnd;
		}
		
		public void setBlockEnd(int blockEnd) {
			this.blockEnd = blockEnd;
		}
		
		public static int getPageScale() {
			return PAGE_SCALE;
		}
		
		public static int getBlockScale() {
			return BLOCK_SCALE;
		}
		
	}
