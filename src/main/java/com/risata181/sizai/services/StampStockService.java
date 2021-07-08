package com.risata181.sizai.services;

import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.bean.TblStock;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

/**
 * @brief 切手・印紙在庫サービスインターフェース
 * @class StampStockService
 * @author sae.hayashi
 */
public interface StampStockService {

  /**
   * @brief 在庫のリストデータ取得
   * @param comBean 画面の取得項目
   * @return resultMap リストデータ
   */
  public List<TblStock> getStockList(Combean comBean);

  /**
   * @brief 在庫(種別)の登録
   * @param tblStock 画面の取得項目
   * @return code 処理結果
   */
  public String insertStock(TblStock tblStock);

  /**
   * @brief 在庫(種別)の修正
   * @param tblStocklist 画面の取得項目
   * @return code 処理結果
   * @throws Exception 1件でも登録できなかった場合エラー
   */
  @Transactional
  public String updateStock(List<TblStock> tblStocklist) throws Exception;

  /**
   * @brief 在庫(種別)の削除
   * @param tblStocklist 画面の取得項目
   * @return code 処理結果
   */
  @Transactional
  public String deleteStock(List<TblStock> tblStocklist) throws Exception;

}
