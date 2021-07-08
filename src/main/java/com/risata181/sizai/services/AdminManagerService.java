package com.risata181.sizai.services;

import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.bean.TblManager;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

/**
 * @brief 担当者サービスインターフェース。
 * @class AdminManagerService
 * @author masashi.takada
 *
 */

public interface AdminManagerService {

  /**
   * @brief 担当者一覧のリストデータ取得
   * @param comBean 画面の取得項目
   * @return resultMap リストデータ
   */
  public List<TblManager> getManagerList(Combean comBean);

  /**
   * @brief 担当者新規登録
   * @param tblManager 画面の取得項目
   * @return code 処理結果
   */
  public String registManager(TblManager tblManager);

  /**
   * @brief 担当者一覧更新
   * @param tblManager 画面の取得項目
   * @return code 処理結果
   */
  @Transactional
  public String updateManager(TblManager tblManager);

  /**
   * @brief 担当者一覧削除
   * @param tblManager 画面の取得項目
   * @return code 処理結果
   */
  @Transactional
  public String deleteManager(TblManager tblManager);

  /**
   * @brief 担当者情報1件取得
   * @param seq 画面の取得項目
   */
  public TblManager getManagerBySeq(String seq);

}
