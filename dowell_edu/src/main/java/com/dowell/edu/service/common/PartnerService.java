package com.dowell.edu.service.common;

import java.util.List;
import java.util.Map;

import com.dowell.edu.vo.common.PartnerVO;

public interface PartnerService {

	List<PartnerVO> selectPartnerSearchList(Map<String, Object> param);

}
