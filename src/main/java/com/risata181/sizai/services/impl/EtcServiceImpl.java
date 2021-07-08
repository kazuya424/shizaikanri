package com.risata181.sizai.services.impl;

import com.risata181.sizai.bean.EtcBean;
import com.risata181.sizai.entity.EtcMapper;
import com.risata181.sizai.services.EtcService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("EtcService")
public class EtcServiceImpl implements EtcService {

  @Autowired
  EtcMapper etcMapper;

  @Override
  public List<EtcBean> getSelectList(EtcBean etcBean) {

    List<EtcBean> selectList = etcMapper.getSelectList(etcBean);

    return selectList;
  }
  
  @Override
  public List<EtcBean> getSelectListAddOption(EtcBean etcBean) {
    
    List<EtcBean> selectList = etcMapper.getSelectListAddOption(etcBean);
    
    return selectList;
  }
}
