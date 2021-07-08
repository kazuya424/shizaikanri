package com.risata181.sizai.services.impl;

import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.bean.TblManager;
import com.risata181.sizai.entity.AdminManagerMapper;
import com.risata181.sizai.exception.SizaiRuntimeException;
import com.risata181.sizai.services.AdminManagerService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.CannotAcquireLockException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @brief 担当者サービスクラス。
 * @class AdminManagerServiceImpl
 * @author masashi.takada
 */

@Service("AdminManagerService")
public class AdminManagerServiceImpl implements AdminManagerService {

  /**
   * 担当者マッパークラス
   */
  @Autowired
  AdminManagerMapper adminManagerMapper;

  /**
   * @brief 担当者一覧のリストデータ取得
   * @param comBean 管理者テーブル
   * @return resultMap リストデータ
   */
  @Override
  public List<TblManager> getManagerList(Combean comBean) {

    List<TblManager> tblManager = adminManagerMapper.getManagerList(comBean);

    return tblManager;

  }

  /**
   * @brief 担当者新規登録
   * @param tblManager 管理者テーブル
   * @return code 処理結果
   */
  @Override
  public String registManager(TblManager tblManager) {
    try {
      int rows = adminManagerMapper.registManager(tblManager);
      if (rows == 0) {
        throw new SizaiRuntimeException("failure");
      }
    } catch (DuplicateKeyException e) {
      throw new SizaiRuntimeException("duplicate", "重複しています", e);
    }
    return "success";
  }

  /**
   * @brief 担当者一覧更新
   * @param tblManager 管理者テーブル
   * @return code 処理結果
   */
  @Override
  @Transactional
  public String updateManager(TblManager tblManager) {
    int rows = 0;
    try {
      // データベースから最終更新日を取得
      TblManager exclusive = adminManagerMapper.exclusiveCtrl(tblManager);
      if (exclusive == null
          || tblManager.getManagerUpdDt().compareTo(exclusive.getManagerUpdDt()) < 0) {
        // 他の端末で更新されている場合「更新済み」
        throw new SizaiRuntimeException("update", "他の端末で更新されています。");
      }
      rows = adminManagerMapper.updateManager(tblManager);
      if (rows == 0) {
        throw new SizaiRuntimeException("failure");
      }
    } catch (CannotAcquireLockException le) {
      // 他の端末でデータがロック中の場合「ロック」
      throw new SizaiRuntimeException("locked", "レコードがロックされています。", le);
    }catch (DuplicateKeyException e) {
      throw new SizaiRuntimeException("duplicate", "重複しています", e);
    }
    return "success";
  }



  /**
   * @brief 担当者一覧削除
   * @param tblManager 管理者テーブル
   * @return code 処理結果
   */
  @Override
  @Transactional
  public String deleteManager(TblManager tblManager) {
    int rows = 0;
    int PostManagerCount = adminManagerMapper.getPostCountByManager(tblManager.getManagerSeq());
    int OutgoingCompanyCount = adminManagerMapper.getOutgoingCountByCompany(tblManager.getManagerSeq());
    if (PostManagerCount > 0 || OutgoingCompanyCount > 0) {
      throw new SizaiRuntimeException("counted","他のテーブルで使用されています。");
    }
    try {
      // データベースから最終更新日を取得
      TblManager exclusive = adminManagerMapper.exclusiveCtrl(tblManager);
      if (exclusive == null
          || tblManager.getManagerUpdDt().compareTo(exclusive.getManagerUpdDt()) < 0) {
        // 他の端末で更新されている場合「更新済み」
        throw new SizaiRuntimeException("update", "他の端末で更新されています。");
      }
      rows = adminManagerMapper.deleteManager(tblManager);
      if (rows == 0) {
        throw new SizaiRuntimeException("failure");
      }
    } catch (CannotAcquireLockException le) {
      // 他の端末でデータがロック中の場合「ロック」
      throw new SizaiRuntimeException("locked", "レコードがロックされています。", le);
    }
    return "success";
  }

  /**
   * @brief 担当者情報1件取得
   * @param tblManager 管理者テーブル
   */
  @Override
  public TblManager getManagerBySeq(String seq) {
    TblManager tblData = adminManagerMapper.getManagerBySeq(seq);

    return tblData;
  }
}
