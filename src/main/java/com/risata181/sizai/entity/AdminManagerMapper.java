package com.risata181.sizai.entity;

import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.bean.TblManager;
import com.risata181.sizai.config.Mapper;
import java.util.List;

/**
 * @brief 担当者マッパークラス
 * @class AdminManagerMapper
 * @author masashi.takada
*/

@Mapper
public interface AdminManagerMapper{

  /**
   * @brief 担当者一覧のリストデータ取得
   * @param comBean 共通ビーン
   * @return resultMap 取得したリストデータ
   */
  List<TblManager> getManagerList(Combean comBean);

  /**
   * @brief 担当者新規登録
   * @param tblManager 管理者テーブル
   * @return 処理件数
   */
  int registManager(TblManager tblManager);

  /**
   * @brief 担当者一覧更新
   * @param tblManager 管理者テーブル
   * @return 処理件数
   */
  int updateManager(TblManager tblManager);

  /**
   * @brief 担当者一覧削除
   * @param tblManager 管理者テーブル
   * @return 処理件数
   */
  int deleteManager(TblManager tblManager);

  /**
   * @brief 担当者データ1件取得
   * @param seq 管理者番号
   * @return 管理者テーブル
   */
  TblManager getManagerBySeq(String seq);

  /**
   * @brief 排他処理
   * @param tblManager 管理者テーブル
   */
  TblManager exclusiveCtrl(TblManager tblManager);

  /**
   * @brief 郵便テーブルでどれだけデータが使われているか
   * @param seq 管理者番号
   * @return
   */
  int getPostCountByManager(String seq);

  /**
   * @brief 出庫テーブルでどれだけデータが使われているか
   * @param seq 管理者番号
   * @return
   */
  int getOutgoingCountByCompany(String seq);
}