package com.risata181.sizai.entity;

import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.bean.TblStock;
import com.risata181.sizai.config.Mapper;
import java.util.List;

/**
 * @brief 切手・印紙在庫マッパークラス
 * @class StampStockMapper
 * @author sae.hayashi
 */

@Mapper
public interface StampStockMapper {

  /**
   * @brief 在庫のリストデータ取得
   * @param comBean 画面の取得項目
   * @return resultMap 取得したリストデータ
   */
  List<TblStock> getStockList(Combean comBean);

  /**
   * @brief 排他処理
   * @param tblStock 画面の取得項目
   * @return ロックしたレコード
   */
  TblStock exclusiveCtrl(TblStock tblStock);

  /**
   * @brief 在庫(種別)の登録
   * @param tblStock 画面の取得項目
   * @return code 処理結果
   */
  int insertStock(TblStock tblStock);

  /**
   * @brief 在庫の修正
   * @param tblStock 画面の取得項目
   * @return code 処理結果
   */
  int updateStock(TblStock tblStock);

  /**
   * @brief 在庫(種別)の削除
   * @param tblStock 画面の取得項目
   * @return code 処理結果
   */
  int deleteStock(TblStock tblStock);

  /**
   * @brief 入庫/出庫テーブルで削除対象の種別の有無を取得
   * @param tblStocklist 画面の取得項目
   * @return code 処理結果
   */
  int getInstockOutgoingCount(TblStock tblStock);
}
