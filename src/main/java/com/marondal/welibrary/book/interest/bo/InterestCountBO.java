package com.marondal.welibrary.book.interest.bo;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import com.marondal.welibrary.book.interest.dao.InterestDAO;

@Service
@RequiredArgsConstructor
public class InterestCountBO {
	private final InterestDAO interestDAO;

	public int getInterestBookCount(int userId) {
		return interestDAO.selectInterestBookCount(userId);
	}

}
