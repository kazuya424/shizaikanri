package com.risata181.sizai.services.impl;

import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.bean.TblOutgoing;
import com.risata181.sizai.bean.TblStock;
import com.risata181.sizai.entity.StampOutgoingMapper;
import com.risata181.sizai.exception.SizaiRuntimeException;
import com.risata181.sizai.services.StampOutgoingService;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * .
 *
 * @brief 切手・印紙出庫修正サービスクラス
 * @class StampOutgoingServiceImpl
 * @author shuto.senda
 */

@Service("StampOutgoingService")
public class StampOutgoingServiceImpl implements StampOutgoingService {

  @Autowired
  StampOutgoingMapper stampOutgoingMapper;


  /**
   * .
   *
   * @brief 出庫一覧のリストデータ取得
   * @param comBean 画面の取得項目
   * @return resultMap リストデータ
   */
  @Override
  public List<TblOutgoing> getOutgoingList(Combean comBean) {
    List<TblOutgoing> tblOutgoing = new ArrayList<TblOutgoing>();
    tblOutgoing = stampOutgoingMapper.getOutgoingList(comBean);

    return tblOutgoing;
  }

  /**
   * .
   *
   * @brief 出庫一覧更新
   * @param tblOutgoingList 画面の取得項目
   * @return code 処理結果
   */
  @Override
  @Transactional
  public String updateOutgoing(TblOutgoing[] tblOutgoingList) {
    String code = "";
    int countOfUpdated = 0;
    int i = 0;


    for (TblOutgoing bean : tblOutgoingList) {

      TblOutgoing original = stampOutgoingMapper.exclusiveCtrl(bean);
      // 日付比較

      if (original != null && original.getOutgoingUpdDt().compareTo(bean.getOutgoingUpdDt()) < 0) {
        return code = "updDtError";
      }
      if (original.getOutgoingRegDt().compareTo(bean.getOutgoingUpdDt()) > 0) {
        return code = "regDtError";
      }

      original = stampOutgoingMapper.getOriginalOutgoing(bean);
      TblStock originalStock = stampOutgoingMapper.getOriginalStockByOutgoing(bean);

      int originalOutgoingCount = Integer.valueOf(original.getOutgoingCount());
      int changedOutgoingCount = Integer.valueOf(bean.getOutgoingCount());
      int originalStockCount = Integer.valueOf(originalStock.getStockCount());
      int differenceOutgoingCount = changedOutgoingCount - originalOutgoingCount;
      int totalOutgoingCount = 0;

      // 変更前の個数 < 変更後の個数
      if (originalOutgoingCount < changedOutgoingCount) {
        // 在庫の個数 < 変更して増えた数
        if (originalStockCount < differenceOutgoingCount) {
          return code = "outOfStock";
        } else {
          totalOutgoingCount = originalStockCount - differenceOutgoingCount;
        }
      } else {
        totalOutgoingCount = originalStockCount + (originalOutgoingCount - changedOutgoingCount);
      }

      i = stampOutgoingMapper.updateOutgoing(bean);
      // updateに失敗した場合
      if (i == 0) {
        throw new RuntimeException();
      }
      TblStock stock = new TblStock();
      stock.setStockSeq(bean.getOutgoingType());
      stock.setStockCount(String.valueOf(totalOutgoingCount));
      stock.setStockUpdId(bean.getOutgoingUpdId());
      stampOutgoingMapper.updateStock(stock);
      countOfUpdated += i;
    }

    code = Integer.toString(countOfUpdated);
    return code;
  }

  /**
   * .
   *
   * @brief 出庫一覧削除
   * @param tblOutgoing 画面の取得項目
   * @return code 処理結果
   */
  @Override
  @Transactional
  public String deleteOutgoing(TblOutgoing[] tblOutgoing) {
    String code = "";
    int countOfUpdated = 0;
    int i = 0;

    for (TblOutgoing bean : tblOutgoing) {
      TblOutgoing original = stampOutgoingMapper.exclusiveCtrl(bean);
      if (original != null && original.getOutgoingUpdDt().compareTo(bean.getOutgoingUpdDt()) < 0) {
        throw new RuntimeException();
      }
      if (original.getOutgoingRegDt().compareTo(bean.getOutgoingUpdDt()) > 0) {
        throw new RuntimeException();
      }

      TblStock originalStock = stampOutgoingMapper.getOriginalStockByOutgoing(bean);

      int stockCount = Integer.valueOf(originalStock.getStockCount());
      int outgoingCount = Integer.valueOf(bean.getOutgoingCount());

      i = stampOutgoingMapper.deleteOutgoing(bean);
      // 削除に失敗した場合
      if (i == 0) {
        throw new RuntimeException();
      }
      TblStock stock = new TblStock();
      int totalOutgoingCount = stockCount + outgoingCount;
      stock.setStockSeq(bean.getOutgoingType());
      stock.setStockCount(String.valueOf(Integer.valueOf(totalOutgoingCount)));
      stock.setStockUpdId(bean.getOutgoingUpdId());
      stampOutgoingMapper.updateStock(stock);
      countOfUpdated += i;
    }
    code = Integer.toString(countOfUpdated);
    return code;
  }

  /**
   * @brief 出庫登録
   * @param tblOutgoinglist 出庫登録画面の取得項目
   * @return code 処理結果
   * @throws RuntimeException 1件でも登録できなかった場合エラー
   */
  @Override
  @Transactional
  public String insertOutgoing(List<TblOutgoing> tblOutgoinglist) throws RuntimeException {
    String code = "";
    int countOfUpdated = 0;

    for (TblOutgoing row : tblOutgoinglist) {
      stampOutgoingMapper.exclusiveCtrl(row);
      TblStock checkStock = stampOutgoingMapper.checkStock(row);
      if (Integer.valueOf(checkStock.getStockCount())
          - Integer.valueOf((row).getOutgoingCount()) < 0) {
        throw new SizaiRuntimeException("inventory","在庫が不足しています。");
      }

      int i = stampOutgoingMapper.insertOutgoing(row);
      if (i == 0) {
        throw new RuntimeException();
      }

      countOfUpdated++;
      stampOutgoingMapper.updateAddToStockByOutgoing(row);
    }
    code = Integer.toString(countOfUpdated);
    return code;
  }
}
