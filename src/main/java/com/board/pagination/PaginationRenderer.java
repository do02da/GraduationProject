package com.board.pagination;

import egovframework.rte.ptl.mvc.tags.ui.pagination.AbstractPaginationRenderer;

public class PaginationRenderer extends AbstractPaginationRenderer {
	/**
	 * Egov 페이지네이션
	 */
	public PaginationRenderer() {
		firstPageLabel 		= "<li class='page-item'><a class='page-link' href=\"#\" onclick=\"{0}({1}); return false;\">&laquo;</a></li>&#160;"; 
		previousPageLabel 	= "<li class='page-item'><a class='page-link' href=\"#\" onclick=\"{0}({1}); return false;\">이전</a></li>&#160;";
		currentPageLabel	= "<li class=\"page-item active\" aria-current='page'><a class='page-link' >{0}<span class='sr-only'>(current)</span></a></li>&#160;";
		otherPageLabel 		= "<li class='page-item'><a class='page-link' href=\"#\" onclick=\"{0}({1}); return false;\">{2}</a></li>&#160;";
		nextPageLabel 		= "<li class='page-item'><a class='page-link' href=\"#\" onclick=\"{0}({1}); return false;\">다음</a></li>&#160;";
		lastPageLabel 		= "<li class='page-item'><a class='page-link' href=\"#\" onclick=\"{0}({1}); return false;\">&raquo;</a></li>&#160;";
	}
}
	