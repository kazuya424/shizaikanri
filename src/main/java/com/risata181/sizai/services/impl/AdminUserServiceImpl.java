package com.risata181.sizai.services.impl;

import com.risata181.sizai.Util.AES256Util;
import com.risata181.sizai.bean.Combean;
import com.risata181.sizai.bean.TblUser;
import com.risata181.sizai.entity.AdminUserMapper;
import com.risata181.sizai.exception.SizaiRuntimeException;
import com.risata181.sizai.services.AdminUserService;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.CannotAcquireLockException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @brief 利用者サービスクラス。
 * @class AdminUserServiceImpl
 * @author masashi.takada
 */

@Service("AdminUserService")
public class AdminUserServiceImpl implements AdminUserService {

  /**
   * 利用者マッパークラス
   */
  @Autowired
  AdminUserMapper adminUserMapper;

  /**
   * @brief 利用者一覧のリストデータ取得
   * @param comBean 管理者テーブル
   * @return resultMap リストデータ
   */
  @Override
  public List<TblUser> getUserList(Combean comBean) {

    List<TblUser> tblUser = adminUserMapper.getUserList(comBean);

    return tblUser;

  }

  /**
   * @brief 利用者新規登録
   * @param tblUser 管理者テーブル
   * @return code 処理結果
   */
  @Override
  public String registUser(TblUser tblUser)
      throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {

    try {
      AES256Util encrypt = new AES256Util();

      tblUser.setUserPw(encrypt.encrypt(tblUser.getUserPw()));

      int rows = adminUserMapper.registUser(tblUser);

      if(rows == 0) {
        throw new SizaiRuntimeException("failure");

      }

    }catch(DuplicateKeyException e){
      throw new SizaiRuntimeException("duplicate","重複",e);
    }
    return "success";
  }

  /**
   * @brief 利用者一覧更新
   * @param tblUser 管理者テーブル
   * @return code 処理結果
   */
  @Override
  @Transactional
  public String updateUser(TblUser tblUser)
      throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {


    try {
      AES256Util encrypt = new AES256Util();
      tblUser.setUserPw(encrypt.encrypt(tblUser.getUserPw()));

      int rows = adminUserMapper.updateUser(tblUser);

      if(rows == 0) {
        throw new SizaiRuntimeException("failure");
      }
    }catch(DuplicateKeyException e){
      throw new SizaiRuntimeException("duplicate","重複",e);
    }catch(CannotAcquireLockException e){
      throw new SizaiRuntimeException("locked","他の人が更新中",e);
    }
    return "success";
  }

  /**
   * @brief 利用者一覧削除
   * @param tblUser 管理者テーブル
   * @return code 処理結果
   */
  @Override
  @Transactional
  public String deleteUser(TblUser tblUser) {

    try {
     int rows = adminUserMapper.deleteUser(tblUser);

     if(rows == 0) {
       throw new SizaiRuntimeException("failure");
     }
    }catch(CannotAcquireLockException e){
      throw new SizaiRuntimeException("locked","他の人が更新中",e);
    }
    return "success";
  }

  /**
   * @brief 利用者情報1件取得
   * @param tblUser 管理者テーブル
   */
  @Override
  public TblUser getUserBySeq(String seq)
      throws NoSuchAlgorithmException, UnsupportedEncodingException, GeneralSecurityException {
    TblUser tblData = adminUserMapper.getUserBySeq(seq);
    if(tblData != null) {
      AES256Util decrypt = new AES256Util();
      tblData.setUserPw(decrypt.decrypt(tblData.getUserPw()));
    }
    return tblData;
  }
}
