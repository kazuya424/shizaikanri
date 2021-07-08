package com.risata181.sizai.entity;

import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.bean.TblInstock;
import com.risata181.sizai.bean.TblStock;
import com.risata181.sizai.config.Mapper;
import java.util.List;

/**
 * .
 * @brief 切手・印紙入庫マッパークラス
 * @class StampInstockMapper
 * @author sae.hayashi
 */

@Mapper
public interface StampInstockMapper {
  /**
   * .
   * @brief 入庫一覧のリストデータ取得
   * @param comBean 画面の取得項目
   * @return 取得したリストデータ
   */
  List<TblInstock> getInstockList(Combean comBean);

  /**
   * .
   * @brief 入庫登録
   * @param row 画面の取得項目
   * @return 登録件数
   */
  int insertInstock(TblInstock row);

  /**
   * .
   * @brief 在庫更新
   * @param tblInstock 画面の取得項目
   */
  void updateAddToStockByInstock(TblInstock tblInstock);

  /**
   * .
   * @brief 排他処理
   * @param row 画面の取得項目
   * @return 入庫テーブル
   */
  TblInstock exclusiveCtrl(TblInstock bean);

  /**
   * .
   * @brief 入庫一覧更新
   * @param tblInstockList 画面の取得項目
   * @return 処理件数
   */
  int updateInstock(TblInstock tblInstockList);

  /**
   * .
   * @brief 変更前の入庫テーブル項目の取得
   * @param tblInstockList 画面の取得項目
   * @return tblInstock
   */
  TblInstock getOriginalInstock(TblInstock tblInstockList);

  /**
   * .
   * @brief 入庫削除
   * @param tblInstock 画面の取得項目
   * @return 処理件数
   */
  int deleteInstock(TblInstock tblInstock);

  /**
   * .
   * @brief 変更後の入庫テーブル項目の取得
   * @param tblInstockList 画面の取得項目
   * @return tblInstock
   */
  TblStock getOriginalStockByInstock(TblInstock tblInstockList);


  /**
   * .
   * @brief 在庫データの修正
   * @param tblStock 在庫テーブル
   * @return 更新件数
   */
  int updateStock(TblStock tblStock);

}
