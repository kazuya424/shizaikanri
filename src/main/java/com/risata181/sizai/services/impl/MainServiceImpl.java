package com.risata181.sizai.services.impl;

import com.risata181.sizai.entity.MainMapper;
import com.risata181.sizai.services.MainService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("MainService")
public class MainServiceImpl implements MainService {

  @Autowired
  MainMapper mainMapper;

}
