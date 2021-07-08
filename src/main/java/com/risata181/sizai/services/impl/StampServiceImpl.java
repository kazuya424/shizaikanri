package com.risata181.sizai.services.impl;

import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.entity.StampMapper;
import com.risata181.sizai.services.StampService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @brief 入出庫一覧サービスクラス。
 * @class StampServiceImpl
 * @author masashi.takada
 *
 */
@Service("StampService")
public class StampServiceImpl implements StampService {

  @Autowired
  StampMapper stampMapper;

  /**
   * @brief 入出庫一覧のデータ取得
   * @param comBean 共通ビーン
   * @return 入出庫一覧のリスト
   */
  @Override
  public List<HashMap<String, Object>> getInOutStockList(Combean comBean) {
    List<HashMap<String, Object>> listObject = new ArrayList<HashMap<String, Object>>();
    listObject = stampMapper.getInOutStockList(comBean);

    return listObject;
  }
}
