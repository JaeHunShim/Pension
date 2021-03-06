package com.spring.pension.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.pension.domain.Criteria;
import com.spring.pension.domain.QuestionVO;
import com.spring.pension.domain.SearchCriteria;
import com.spring.pension.persistence.QuestionDAO;

@Service
public class QuestionServiceImpl implements QuestionService {
	
	public static final Logger logger = LoggerFactory.getLogger(QuestionServiceImpl.class);
	
	@Inject
	private QuestionDAO questionDAO;
	// 게시물 등록하는 부분 
	@Override
	public void regist(QuestionVO questionVO) throws Exception {
		
		logger.info("게시물 등록 Service" + questionDAO);
		
		questionDAO.creat(questionVO);
	}
	// 1. 게시글 목록 가져오기
	@Override
	public List<QuestionVO> listAll() throws Exception {
		
		return questionDAO.listAll();
	}
	// 2. 게시글 목록 가져오기 :페이징 처리 한 후 (Criteria 클래스 사용)
	@Override
	public List<QuestionVO> listCriteria(Criteria cri) throws Exception {
		
		return questionDAO.listCriteria(cri);
	}
	// 3. 게시글 목록 가져오기 : 페이징 처리 + 검색결결과 
	@Override
	public List<QuestionVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		
		return questionDAO.listSearch(cri);
	}
	// 1) 총 게시물수 가지고 오기
	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		
		return questionDAO.countPaging(cri);
	}
	// 2) 총 게시물수 가지고 오기 
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		
		return questionDAO.listSearchConunt(cri);
	}
	//비밀번호 받아오는 부분 (qno 와 일치하는 password받아오기)
	@Override
	public String getPassword(int qno,String password) throws Exception {
		
		return questionDAO.getPassword(qno,password);
	}
	// 상세글 가지고오기 
	@Transactional
	@Override
	public QuestionVO read(Integer qno, String password) throws Exception {
		//상세페이지 볼때 viewCnt 증가시키기 
		questionDAO.updateViewCnt(qno);
		logger.info("몇번돌아가나요?");
		return questionDAO.read(qno,password);
	}
	//게시물 삭제
	@Override
	public void remove(Integer qno) throws Exception {
		
		questionDAO.delete(qno);
	}
	//게시물 수정 
	@Override
	public void modify(QuestionVO questionVO) throws Exception{
		
		questionDAO.modify(questionVO);
	}
	//qno와 일치하는 데이터 가지고 오기
	@Override
	public QuestionVO getQno(Integer qno) throws Exception {
		
		return questionDAO.getQno(qno);
	}
	//이전글과 다음글에 대한 정보 가지고오는 부분 
	@Override
	public List<QuestionVO> preNePage(Integer qno) throws Exception {
		
		return questionDAO.preNePage(qno);
	}

}
