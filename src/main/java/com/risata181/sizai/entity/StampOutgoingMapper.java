package com.risata181.sizai.entity;

import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.bean.TblOutgoing;
import com.risata181.sizai.bean.TblStock;
import com.risata181.sizai.config.Mapper;
import java.util.List;

/**
 * .
 *
 * @brief 切手・印紙出庫マッパーインターフェース
 * @class StampOutgoingMapper
 * @author shuto.senda
 */
@Mapper
public interface StampOutgoingMapper {

  /**
   * .
   *
   * @brief 出庫一覧のリストデータ取得
   * @param comBean 画面の取得項目
   * @return 取得したリストデータ
   */
  List<TblOutgoing> getOutgoingList(Combean comBean);

  /**
   * .
   *
   * @brief 出庫一覧更新
   * @param tblOutgoingList 画面の取得項目
   * @return 処理件数
   */
  int updateOutgoing(TblOutgoing tblOutgoingList);

  /**
   * .
   *
   * @brief 排他処理
   * @param tblOutgoing 画面の取得項目
   * @return ロックしたレコード
   */
  TblOutgoing exclusiveCtrl(TblOutgoing tblOutgoing);

  /**
   * .
   *
   * @brief 変更前の出庫テーブル項目の取得
   * @param tblOutgoingList 画面の取得項目
   * @return tblOutgoing
   */
  TblOutgoing getOriginalOutgoing(TblOutgoing tblOutgoingList);

  /**
   * .
   *
   * @brief 出庫削除
   * @param tblOutgoing 画面の取得項目
   * @return 処理件数
   */
  int deleteOutgoing(TblOutgoing tblOutgoing);

  /**
   * .
   *
   * @brief 変更後の出庫テーブル項目の取得
   * @param tblOutgoingList 画面の取得項目
   * @return tblOutgoing
   */
  TblStock getOriginalStockByOutgoing(TblOutgoing tblOutgoingList);


  /**
   * .
   *
   * @brief 在庫データの修正
   * @param tblStock 在庫テーブル
   * @return 在庫件数
   */
  int updateStock(TblStock tblStock);

  /**
   * @brief 出庫登録
   * @param row 画面の取得項目
   * @return 登録件数
   */
  int insertOutgoing(TblOutgoing row);

  /**
   * @brief 在庫更新
   * @param tblOutgoing 画面の取得項目
   */
  void updateAddToStockByOutgoing(TblOutgoing tblOutgoing);

  /**
   * @brief 在庫チェック
   * @param tblOutgoing 画面の取得項目
   * @return 不足しているか否かチェック結果
   */
  TblStock checkStock(TblOutgoing tblOutgoing);

}
