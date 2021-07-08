package com.risata181.sizai.services;

import com.risata181.sizai.bean.Combean;
import java.util.HashMap;
import java.util.List;

/**
 * @brief 入出庫一覧サービスインターフェース。
 * @interface StampService
 * @author masashi.takada
 *
 */
public interface StampService {
  /**
   * @brief 入出庫一覧のデータ取得
   * @param comBean 共通ビーン
   * @return 入出庫一覧のリスト
   */
  public List<HashMap<String, Object>> getInOutStockList(Combean comBean);

}
