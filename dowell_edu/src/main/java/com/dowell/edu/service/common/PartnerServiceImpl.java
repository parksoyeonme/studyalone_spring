package com.dowell.edu.service.common;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dowell.edu.dao.common.PartnerDAO;
import com.dowell.edu.vo.common.PartnerVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Transactional
@Service
public class PartnerServiceImpl implements PartnerService {

	@Autowired
	private PartnerDAO partnerDao;

	@Override
	public List<PartnerVO> selectPartnerSearchList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return partnerDao.selectPartnerSearchList(param);
	}

//	@Override
//	public List<PartnerVO> selectPartnerSearchList(String prt_nm) {
//		// TODO Auto-generated method stub
//		return partnerDao.selectPartnerSearchList(prt_nm);
//	}
}
