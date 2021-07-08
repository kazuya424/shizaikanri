package com.risata181.sizai.entity;

import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.config.Mapper;
import java.util.HashMap;
import java.util.List;

/**
 * @brief 入出庫一覧マッパーインターフェース。
 * @interface StampMapper
 * @author masashi.takada
 *
 */
@Mapper
public interface StampMapper {
  /**
   * @brief 入出庫一覧のデータ取得
   * @param comBean 共通ビーン
   * @return 入出庫一覧のリスト
   */
  List<HashMap<String, Object>> getInOutStockList(Combean comBean);

}
