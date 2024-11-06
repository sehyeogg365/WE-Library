package com.marondal.welibrary.book.interest.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.marondal.welibrary.book.interest.dao.InterestDAO;
import com.marondal.welibrary.book.model.InterestBookCount;

@Service
public class InterestCountBO {

	@Autowired
	private InterestDAO interestDAO;

	public int getInterestBookCount(int userId) {

		return interestDAO.selectInterestBookCount(userId);
	}

}
