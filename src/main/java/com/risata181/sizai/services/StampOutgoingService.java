package com.risata181.sizai.services;

import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.bean.TblOutgoing;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

/**
 * .
 *
 * @brief 切手・印紙出庫修正・登録サービスインターフェース
 * @class StampOutgoingService
 * @author shuto.senda
 */

public interface StampOutgoingService {

  /**
   * .
   *
   * @brief 出庫一覧のリストデータ取得
   * @param comBean 画面の取得項目
   * @return resultMap リストデータ
   */
  public List<TblOutgoing> getOutgoingList(Combean comBean);

  /**
   * .
   *
   * @brief 出庫一覧更新
   * @param tblOutgoingList 画面の取得項目
   * @return code 処理結果
   */
  public String deleteOutgoing(TblOutgoing[] tblOutgoingList);

  /**
   * .
   *
   * @brief 出庫一覧削除
   * @param tblOutgoingList 画面の取得項目
   * @return code 処理結果
   */
  public String updateOutgoing(TblOutgoing[] tblOutgoingList);

  /**
   * @brief 出庫登録
   * @param tblOutgoinglist 出庫登録画面の取得項目
   * @return code 処理結果
   * @throws RuntimeException 1件でも登録できなかった場合エラー
   */

  @Transactional
  public String insertOutgoing(List<TblOutgoing> tblOutgoinglist) throws RuntimeException;

}
