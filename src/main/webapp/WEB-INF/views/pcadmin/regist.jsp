<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.contents .full-conts .scrollbar .inner {
	width: 5600px;
	height: 1px;
}
</style>

<form name="form2">
	<div class="full-conts">
		<div class="button-conts" style="display: block;">
			<span>※</span> <span style="color: red">赤色</sapn> <span>は必須項目です。</span>
				<input type="button" value="新規登録"
				onclick="PcAdminRegistScript.registAction();">
		</div>

		<div class="table-area scrollbar" id="scrollbar">
			<div class="inner"></div>
		</div>
		<div class="table-area scrollbox" id="scrollbox">
			<div class="inner">

				<table style="width: 5600px">
					<thead>
						<tr>
							<th><span style="color: red">ID</span></th>
							<th><span style="color: red">保有会社</span></th>
							<th><span style="color: red">保管場所</span></th>
							<th>使用場所</th>
							<th><span style="color: red">稼働区分</th>
							<th><span style="color: red">利用者</span></th>
							<th>前回利用者</th>
							<th><span style="color: red">種類</span></th>
							<th>アカウント名</th>
							<th>パスワード</th>
							<th>メーカー</th>
							<th>モデル</th>
							<th>型番</th>
							<th>MACアドレス</br>(イーサネット用)
							</th>
							<th>MACアドレス</br>(無線LAN用)
							</th>
							<th>CPU</th>
							<th>メモリ</th>
							<th>ハードディスク</th>
							<th>インストールメディア</th>
							<th>セキュリティソフト</th>
							<th>Ofiice</th>
							<th>OS</th>
							<th>プロダクトキー</th>
							<th><span style="color: red">形態</span></th>
							<th>返却日</th>
							<th><span style="color: red">購入日</span></th>
							<th>備考</th>
						</tr>
					</thead>
					<tbody class="list-area">
					</tbody>
				</table>
			</div>
		</div>
	</div>
</form>