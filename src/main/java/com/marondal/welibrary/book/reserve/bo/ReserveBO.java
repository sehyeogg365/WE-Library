package com.marondal.welibrary.book.reserve.bo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.book.bo.BookBO;
import com.marondal.welibrary.book.model.Book;
import com.marondal.welibrary.book.model.ReserveBook;
import com.marondal.welibrary.book.model.ReserveBookDetail;
import com.marondal.welibrary.book.reserve.dao.ReserveDAO;

@Service
public class ReserveBO {

	@Autowired
	private ReserveDAO reserveDAO;
	
	@Autowired
	private BookBO bookBO;
	
	//예약
	public int addReserve(int bookId, int userId) {
		
		return reserveDAO.insertReserve(bookId, userId);
		
		
	}
	
	//예약 조회 
	public List<ReserveBookDetail> getReserveList(int userId){
		
		List<ReserveBook> reserveList = reserveDAO.selectReserveList(userId);
		
		List<ReserveBookDetail> reserveDetailList = new ArrayList<>(); 
		
		for(ReserveBook reserveBook : reserveList) {
			
			Book book = bookBO.getBookById(reserveBook.getBookId());
			
			ReserveBookDetail reserveBookDetail = new ReserveBookDetail();
			
			reserveBookDetail.setId(reserveBook.getId());
			reserveBookDetail.setBookId(reserveBook.getBookId());
			reserveBookDetail.setLibrary(book.getLibrary());
			reserveBookDetail.setTitle(book.getTitle());
			reserveBookDetail.setAuthor(book.getAuthor());
			reserveBookDetail.setPublisher(book.getPublisher());
			reserveBookDetail.setCreatedAt(reserveBook.getCreatedAt());//반납예정일도 추가하기
		
			reserveDetailList.add(reserveBookDetail);
		}
		
		
		return reserveDetailList;
		
		
	}
	
	//예약 취소
	public int deleteReserve(int id, int userId) {
		
		return reserveDAO.deleteReserve(id, userId);
		
		
	}
	
	
}
