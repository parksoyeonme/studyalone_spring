package com.dowell.edu.service.common;

import java.util.List;
import java.util.Map;

import com.dowell.edu.vo.common.PartnerVO;

public interface PartnerService {

	//매장팝업조회
	List<PartnerVO> selectPartnerSearchList(Map<String, Object> param);

}
