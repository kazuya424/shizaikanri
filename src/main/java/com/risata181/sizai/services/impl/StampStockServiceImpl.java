package com.risata181.sizai.services.impl;

import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.bean.TblStock;
import com.risata181.sizai.entity.StampStockMapper;
import com.risata181.sizai.services.StampStockService;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * @brief 切手・印紙在庫サービスクラス
 * @class StampStockServiceImpl
 * @author sae.hayashi
 */

@Service("StampStockService")
public class StampStockServiceImpl implements StampStockService {

  /** StampStockのマッパー . */
  @Autowired
  StampStockMapper stampStockMapper;

  /**
   * @brief 在庫のリストデータ取得
   * @param comBean 画面の取得項目
   * @return resultMap リストデータ
   */
  @Override
  public List<TblStock> getStockList(Combean comBean) {
    List<TblStock> tblStock = stampStockMapper.getStockList(comBean);

    return tblStock;
  }

  /**
   * @brief 在庫(種別)の登録
   * @param tblStock 画面の取得項目
   * @return code 処理結果
   */
  @Override
  public String insertStock(TblStock tblStock) {
    String code = "";
    int rows = stampStockMapper.insertStock(tblStock);
    if (rows != 0) {
      code = "success";
    } else {
      code = "failure";
    }

    return code;
  }

  /**
   * @brief 在庫(種別)の修正
   * @param tblStocklist 画面の取得項目
   * @return code 処理結果
   * @throws Exception 1件でも登録できなかった場合エラー
   */
  @Override
  @Transactional
  public String updateStock(List<TblStock> tblStocklist) throws Exception {
    String code = "";
    int countOfUpdated = 0;

    for (TblStock bean : tblStocklist) {
      // 排他処理
      TblStock exclusive = stampStockMapper.exclusiveCtrl(bean);

      // データベースの最終更新日
      String updtDb = exclusive.getStockUpdDt();

      // 画面の最終更新日
      String updDtScr = bean.getStockUpdDt();

      // Date型に変換
      SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
      Date updtDbParsed = sdFormat.parse(updtDb);
      Date updtScrParsed = sdFormat.parse(updDtScr);

      // 画面の最終更新日とデータベースの更新日を比べ、同じもしくは画面のほうが新しい場合のみ更新処理
      if (updtScrParsed.compareTo(updtDbParsed) >= 0) {
        int i = stampStockMapper.updateStock(bean);
        if (i == 0) {
          throw new RuntimeException();
        }
        countOfUpdated++;
      } else {
        throw new RuntimeException();
      }
      stampStockMapper.updateStock(bean);
    }
    code = Integer.toString(countOfUpdated);
    return code;
  }

  /**
   * @brief 在庫(種別)の削除
   * @param tblStockList 画面の取得項目
   * @return code 処理結果
   * @throws Exception 1件でも登録できなかった場合エラー
   */
  @Override
  @Transactional
  public String deleteStock(List<TblStock> tblStockList) throws Exception {
    String code = "";
    int countOfDeleted = 0;

    for (TblStock bean : tblStockList) {
      // 排他処理
      TblStock exclusive = stampStockMapper.exclusiveCtrl(bean);

      // データベースの最終更新日
      String updtDb = exclusive.getStockUpdDt();

      // 画面の最終更新日
      String updDtScr = bean.getStockUpdDt();

      // Date型に変換
      SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
      Date updtDbParsed = sdFormat.parse(updtDb);
      Date updtScrParsed = sdFormat.parse(updDtScr);

      // 画面の最終更新日とデータベースの更新日を比べ、同じもしくは画面のほうが新しい場合のみ削除処理
      if (updtScrParsed.compareTo(updtDbParsed) >= 0) {
        // 入庫・出庫テーブルで削除対象の種別を使用するデータがないことを確認する処理
        int getInstockOutgoingCount = stampStockMapper.getInstockOutgoingCount(bean);
        if (getInstockOutgoingCount == 0) {
          int i = stampStockMapper.deleteStock(bean);
          if (i == 0) {
            throw new RuntimeException();
          }
          countOfDeleted++;
        } else {
          code = "cantDelete";
          return code;
        }
      }
      stampStockMapper.deleteStock(bean);
    }
    code = Integer.toString(countOfDeleted);
    return code;
  }
}
