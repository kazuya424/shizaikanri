/**
 *
 */
package com.risata181.sizai.exception;

/**
 * @brief 実行時例外クラス
 * @class RuntimeException
 * @author sae.hayashi
 */
public class SizaiRuntimeException extends RuntimeException {

  /**
   * エラーコード
   */
  private String code;


  /**
   * @brief コンストラクタ
   * @param code エラーコード
   */
  public SizaiRuntimeException(String code) {
    super();
    this.code = code;
  }

  /**
   * @brief コンストラクタ
   * @param code エラーコード
   * @param message エラーメッセージ
   */
  public SizaiRuntimeException(String code, String message) {
    super(message);
    this.code = code;
  }

  /**
   * @brief コンストラクタ
   * @param code エラーコード
   * @param message エラーメッセージ
   * @param cause
   */
  public SizaiRuntimeException(String code, String message, Throwable cause) {
    super(message, cause);
    this.code = code;
  }

  /**
   * @brief エラーコード取得。
   * @return code エラーコード
   */
  public String getCode() {
    return code;
  }
}
