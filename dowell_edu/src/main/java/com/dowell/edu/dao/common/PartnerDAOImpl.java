package com.dowell.edu.dao.common;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dowell.edu.vo.common.PartnerVO;

@Repository
public class PartnerDAOImpl implements PartnerDAO {

	@Autowired
	private SqlSession sqlsSession;

	
	@Override
	public List<PartnerVO> selectPartnerSearchList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return sqlsSession.selectList("partner.selectPartnerSearchList", param);
	}
}
