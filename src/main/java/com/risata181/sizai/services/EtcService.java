package com.risata181.sizai.services;

import com.risata181.sizai.bean.EtcBean;
import java.util.List;

public interface EtcService {

  public List<EtcBean> getSelectList(EtcBean etcBean);
  
  public List<EtcBean> getSelectListAddOption(EtcBean etcBean);

}
