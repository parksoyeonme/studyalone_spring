package com.dowell.edu.dao.common;

import java.util.List;
import java.util.Map;

import com.dowell.edu.vo.common.PartnerVO;

public interface PartnerDAO {

	List<PartnerVO> selectPartnerSearchList(Map<String, Object> param);

}
