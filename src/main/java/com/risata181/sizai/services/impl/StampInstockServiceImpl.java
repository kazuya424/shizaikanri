package com.risata181.sizai.services.impl;

import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.bean.TblInstock;
import com.risata181.sizai.bean.TblStock;
import com.risata181.sizai.entity.StampInstockMapper;
import com.risata181.sizai.services.StampInstockService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * @brief 切手・印紙入庫登録サービスクラス
 * @class StampInstockServiceImpl
 * @author sae.hayashi
 */

@Service("StampInstockService")
public class StampInstockServiceImpl implements StampInstockService {

  /** StampInstockのマッパー */
  @Autowired
  StampInstockMapper stampInstockMapper;

  /**
   * .
   *
   * @brief 入庫一覧のリストデータ取得
   * @param comBean 画面の取得項目
   * @return リストデータ
   */
  @Override
  public List<TblInstock> getInstockList(Combean comBean) {
    List<TblInstock> tblInstockList = new ArrayList<TblInstock>();
    tblInstockList = stampInstockMapper.getInstockList(comBean);

    return tblInstockList;
  }

  /**
   * @brief 入庫登録
   * @param tblInstocklist 入庫登録画面の取得項目
   * @return code 処理結果
   * @throws Exception 1件でも登録できなかった場合エラー
   */
  @Override
  @Transactional
  public String insertInstock(List<TblInstock> tblInstocklist) throws Exception {
    String code = "";
    int countOfUpdated = 0;
    int i = 0;

    for (TblInstock row : tblInstocklist) {
      stampInstockMapper.exclusiveCtrl(row);
      i = stampInstockMapper.insertInstock(row);

      if (i == 0) {
        throw new Exception();
      }
      countOfUpdated += i;
      stampInstockMapper.updateAddToStockByInstock(row);
    }
    code = Integer.toString(countOfUpdated);
    return code;
  }

  /**
   * .
   *
   * @brief 入庫一覧更新
   * @param tblInstockList 画面の取得項目
   * @return code 処理結果
   */
  @Override
  @Transactional
  public String updateInstock(TblInstock[] tblInstockList) {
    String code = "";
    int countOfUpdated = 0;
    int i = 0;


    for (TblInstock bean : tblInstockList) {

      TblInstock original = stampInstockMapper.exclusiveCtrl(bean);
      // 日付比較

      if (original == null || original.getInstockUpdDt().compareTo(bean.getInstockUpdDt()) < 0) {
        return code = "updDtError";
      }

      original = stampInstockMapper.getOriginalInstock(bean);
      TblStock originalStock = stampInstockMapper.getOriginalStockByInstock(bean);

      int originalInstockCount = Integer.valueOf(original.getInstockCount());
      int changedInstockCount = Integer.valueOf(bean.getInstockCount());
      int originalStockCount = Integer.valueOf(originalStock.getStockCount());
      int differenceInstockCount = originalInstockCount - changedInstockCount;
      int totalInstockCount = 0;

      // 変更前の個数 < 変更後の個数 かつ 在庫の個数 < 変更して減った数
      if (originalInstockCount > changedInstockCount
          && originalStockCount < differenceInstockCount) {
        return code = "outOfStock";
      } else {
        totalInstockCount = originalStockCount - differenceInstockCount;
      }

      i = stampInstockMapper.updateInstock(bean);
      // updateに失敗した場合
      if (i == 0) {
        throw new RuntimeException();
      }
      TblStock stock = new TblStock();
      stock.setStockSeq(bean.getInstockType());
      stock.setStockCount(String.valueOf(totalInstockCount));
      stock.setStockUpdId(bean.getInstockUpdId());
      stampInstockMapper.updateStock(stock);
      countOfUpdated += i;
    }

    code = Integer.toString(countOfUpdated);
    return code;
  }

  /**
   * .
   *
   * @brief 入庫一覧削除
   * @param tblInstock 画面の取得項目
   * @return code 処理結果
   */
  @Override
  @Transactional
  public String deleteInstock(TblInstock[] tblInstock) {
    String code = "";
    int countOfUpdated = 0;
    int i = 0;

    for (TblInstock bean : tblInstock) {
      TblInstock original = stampInstockMapper.exclusiveCtrl(bean);

      // 日付比較
      if (original == null || original.getInstockUpdDt().compareTo(bean.getInstockUpdDt()) < 0) {
        return code = "updDtError";
      }

      original = stampInstockMapper.getOriginalInstock(bean);
      TblStock originalStock = stampInstockMapper.getOriginalStockByInstock(bean);

      int instockCount = Integer.valueOf(original.getInstockCount());
      int stockCount = Integer.valueOf(originalStock.getStockCount());

      // 変更前の個数 < 変更後の個数かつ在庫の個数 < 変更して減った数
      if (instockCount > stockCount) {
        return code = "outOfStock";
      } else {
      }

      i = stampInstockMapper.deleteInstock(bean);
      // 削除に失敗した場合
      if (i == 0) {
        throw new RuntimeException();
      }
      TblStock stock = new TblStock();
      stock.setStockSeq(bean.getInstockType());
      stock.setStockCount(String.valueOf(Integer.valueOf(stockCount - instockCount)));
      stock.setStockUpdId(bean.getInstockUpdId());
      stampInstockMapper.updateStock(stock);
      countOfUpdated += i;
    }
    code = Integer.toString(countOfUpdated);
    return code;
  }

}
