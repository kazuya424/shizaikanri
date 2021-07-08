package com.risata181.sizai.entity;

import com.risata181.sizai.bean.EtcBean;
import com.risata181.sizai.config.Mapper;
import java.util.List;

@Mapper
public interface EtcMapper {

  List<EtcBean> getSelectList(EtcBean etcBean);
  
  List<EtcBean> getSelectListAddOption(EtcBean etcBean);

}
