package com.ezen.dda.qna;

public class PageDTO {
	// 현재페이지, (한 블럭 내에서)시작페이지, (한 블럭 내에서)끝페이지, 레코드총개수,페이지당레코드의수, 전체페이지,쿼리 start, end
		private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end;
		private int cntPage=5;  //한 화면에 표시하고자 하는 페이지의 수
		public PageDTO() {}
		public PageDTO(int total, int nowPage, int cntPerPage) {
			setNowPage(nowPage);
			setCntPerPage(cntPerPage);
			setTotal(total);
			calcLastPage(getTotal(), getCntPerPage());
			calcStartEndPage(getNowPage(), cntPage);
			calcStartEnd(getNowPage(), getCntPerPage());					   
			}   
		// 전체 페이지 수
		public void calcLastPage(int total, int cntPerPage) {
			setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
							  }   
		//시작페이지와 끝 페이지 
		public void calcStartEndPage(int nowPage, int cntPage) {
			setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
			if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
			}
			setStartPage(getEndPage() - cntPage + 1);
			if(getStartPage()<1) {
				setStartPage(1);
				}
			}					
		// DB쿼리에 정의할  start,end 
		public void calcStartEnd(int nowPage, int cntPerPage) {
			setEnd(nowPage * cntPerPage);
			setStart(getEnd() - cntPerPage + 1);
			}
							
		public int getNowPage() {	return nowPage;	}
		public void setNowPage(int nowPage) {	this.nowPage = nowPage;	}
		public int getStartPage() {	return startPage;}
		public void setStartPage(int startPage) {this.startPage = startPage;}
		public int getEndPage() {return endPage;}
		public void setEndPage(int endPage) {this.endPage = endPage;}
		public int getTotal() {return total;}
		public void setTotal(int total) {this.total = total;}
		public int getCntPerPage() {return cntPerPage;}
		public void setCntPerPage(int cntPerPage) {	this.cntPerPage = cntPerPage;}
		public int getLastPage() {return lastPage;}
		public void setLastPage(int lastPage) {	this.lastPage = lastPage;}
		public int getStart() {return start;}
		public void setStart(int start) {this.start = start;}
		public int getEnd() {return end;}
		public void setEnd(int end) {this.end = end;}
		public int getCntPage() {return cntPage;}
		public void setCntPage(int cntPage) {this.cntPage = cntPage;}
		
		// 검색용
		String searchType, searchContent;
		public String getSearchType() {
			return searchType;
		}
		public void setSearchType(String searchType) {
			this.searchType = searchType;
		}
		public String getSearchContent() {
			return searchContent;
		}
		public void setSearchContent(String searchContent) {
			this.searchContent = searchContent;
		}
		
}
