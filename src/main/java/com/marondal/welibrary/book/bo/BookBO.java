package com.marondal.welibrary.book.bo;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.book.borrow.bo.BorrowBO;
import com.marondal.welibrary.book.dao.BookDAO;
import com.marondal.welibrary.book.interibrary.bo.InteribrayCountBO;
import com.marondal.welibrary.book.model.Book;
import com.marondal.welibrary.book.model.BookCount;
import com.marondal.welibrary.book.model.BookDetail;
import com.marondal.welibrary.book.model.BorrowBook;
import com.marondal.welibrary.book.model.ReserveBook;
import com.marondal.welibrary.book.reserve.bo.ReserveBO;
import com.marondal.welibrary.book.reserve.bo.ReserveCountBO;
import com.marondal.welibrary.user.bo.UserBO;
import com.marondal.welibrary.user.model.User;


@Service
public class BookBO {
	
	
	@Autowired
	private BookDAO bookDAO;
	
	@Autowired
	private ReserveCountBO reserveCountBO;

	@Autowired
	private InteribrayCountBO interibrayCountBO;
	
	
	//@Autowired
	//private UserBO userBO;
	
	
	//책목록 조회(dto로 바꾸기)
	public List<BookDetail> getBookListByTitle(String title){
		
		List<Book> bookList = bookDAO.selectBookListByTitle(title);
		
		List<BookDetail> bookDetailList = new ArrayList<>();
		
		
		for(Book book : bookList) {
			
			
			BookDetail bookDetail = new BookDetail();
			
			
			//예약정보1행 이거 만들기
			//ReserveBook reservebook = reserveCountBO.getReserveBook(book.getId());
			
			int reserveCount = reserveCountBO.getReserveCount(book.getId());
			
			boolean isBorrow = reserveCountBO.isBorrow(book.getId());
			
			boolean isInteribrary = interibrayCountBO.isInteribrary(book.getId());
			
			//boolean isReserve = reserveCountBO.isReserve(book.getId(), reservebook.getUserId());
			
			bookDetail.setId(book.getId());
			bookDetail.setLibrary(book.getLibrary());
			bookDetail.setTitle(book.getTitle());
			bookDetail.setImagePath(book.getImagePath());
			bookDetail.setAuthor(book.getAuthor());
			bookDetail.setPublisher(book.getPublisher());
			bookDetail.setIsbn(book.getIsbn());
			bookDetail.setPubyear(book.getPubyear());
			bookDetail.setAppendix(book.getAppendix());
			bookDetail.setReserveCount(reserveCount);
			bookDetail.setBorrow(isBorrow);
			bookDetail.setInteribrary(isInteribrary);
			//bookDetail.setReserve(isReserve);
			
			bookDetailList.add(bookDetail);
		}
		
		
		
		
		return bookDetailList;
		
		
	}
	//상세정보 정보 id로 불러오기
	public List<BookDetail> getBookListById(int id){
		
		List<Book> bookList = bookDAO.selectBookListById(id);
		
		List<BookDetail> bookDetailList = new ArrayList<>();
		
		
		for(Book book : bookList) {
			
			
			BookDetail bookDetail = new BookDetail();
			
			int reserveCount = reserveCountBO.getReserveCount(book.getId());
			
			boolean isBorrow = reserveCountBO.isBorrow(book.getId());
			
			boolean isInteribrary = interibrayCountBO.isInteribrary(id);
			
			
			
			bookDetail.setId(book.getId());
			bookDetail.setLibrary(book.getLibrary());
			bookDetail.setTitle(book.getTitle());
			bookDetail.setImagePath(book.getImagePath());
			bookDetail.setAuthor(book.getAuthor());
			bookDetail.setPublisher(book.getPublisher());
			bookDetail.setIsbn(book.getIsbn());
			bookDetail.setPubyear(book.getPubyear());
			bookDetail.setAppendix(book.getAppendix());
			bookDetail.setReserveCount(reserveCount);
			bookDetail.setBorrow(isBorrow);
			bookDetail.setInteribrary(isInteribrary);
			
			
			
			bookDetailList.add(bookDetail);
		}
		
	
		return bookDetailList;
		
		
	}
	

	//책 1행정보 조회(상호대차 팝업창)
	public BookDetail getBookById(int id) {
	
		return bookDAO.selectBookById(id);

	}
	
	
	//책 제목별로 갯수표시
	public List<BookCount> getBookNumberBytitle(String title){
		
		List<Book> bookList = bookDAO.selectBookListByTitle(title);
		
		List<BookCount> bookCountList = new ArrayList<>();
		
		for(Book book : bookList) {
			
			BookCount bookCount= new BookCount();
			
			//갯수불러오기
			int numberCount = bookDAO.selectBookCount(title);
			
			
			bookCount.setNumberCount(numberCount);
			
			
			bookCountList.add(bookCount);
		}
		
		return bookCountList;
		
		
	}
	
	
	//이전의 충모투어에선 딥스체크비오를 만들어서 진행했는데 그건 로징비오와 딥스비오가 서로서로 참조하는 현상이있어서 그랬던거고 이번엔 따로 북스체크비오를 안만들어도될듯.
	//대출 가능 여부
	
	
	//현재 예약 인원 표시 3권이 되면 예약못함 여기서 하던 아니면 jstl상에서 버튼표시로 하던
	//public int isReserve(int bookId) {
		
	//	return bookDAO.selectReserveBookId(bookId);
		
	//}
	
	
	//상호대차 가능 여부
	
	
	
	
	
}