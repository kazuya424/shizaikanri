package com.risata181.sizai.services;

import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.bean.TblInstock;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

/**
 * .
 * @brief 切手・印紙入庫登録サービスインターフェース
 * @class StampInstockService
 * @author sae.hayashi
 */
public interface StampInstockService {

  /**
   * .
   * @brief 入庫一覧のリストデータ取得
   * @param comBean 画面の取得項目
   * @return resultMap リストデータ
   */
  public List<TblInstock> getInstockList(Combean comBean);


  /**
   * .
   * @brief 入庫登録
   * @param tblInstocklist 入庫登録画面の取得項目
   * @return code 処理結果
   * @throws Exception 1件でも登録できなかった場合エラー
   */

  @Transactional
  public String insertInstock(List<TblInstock> tblInstocklist) throws Exception;


  /**
   * .
   * @brief 入庫一覧更新
   * @param tblInstockList 画面の取得項目
   * @return code 処理結果
   */
  public String deleteInstock(TblInstock[] tblInstockList);

  /**
   * .
   * @brief 入庫一覧削除
   * @param tblInstockList 画面の取得項目
   * @return code 処理結果
   */
  public String updateInstock(TblInstock[] tblInstockList);
}
