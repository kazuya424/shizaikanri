<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.accordion-search-pc {
	margin-top: 10px;
	margin-bottom: 15px;
	display: inline-block;
	width: 100%;
}

.search-three {
	display: inline-block;
	width: 30%;
}

.select-Operation {
	padding: 8px;
	border-radius: 5px;
	border: 1px solid #626c76;
	height: 43px;
	margin: 13px;
	width: 78%;
}

.input-area {
	width: 75%;
}

.contents .full-conts .scrollbar .inner {
	width: 5700px;
	height: 1px;
}

#paging {
	text-align: initial;
	padding-left: 600px;
	word-spacing: 2100px;
}
</style>

<div class="accordion-conts">
	<div class="cont-title filter">
		<div class="cont-title-text">フィルター</div>
		<div class="cont-title-arrow">
			<img src="/resources/images/left-arrow.png"
				style="transform: rotate(0deg);">
		</div>
	</div>
	<div class="cont-contents" style="display: block;">
		<div class="accordion-search-pc">
			<div class="search-three">

				<div class="search-title">稼働区分</div>
				<select name="pcadminOperation" class="select-Operation">
					<option value="">未選択</option>
					<option value="待機">待機</option>
					<option value="稼働中">稼働中</option>
					<option value="故障">故障</option>
				</select>
			</div>
			<div class="search-three">
				<div class="search-title">メーカー</div>
				<input type="text" name="pcadminMaker" class="input-area" />

			</div>
			<div class="search-three">
				<div class="search-title">利用者</div>
				<input type="text" name="pcadminUser" class="input-area" />

			</div>
			<div class="search-three">
				<div class="search-title">返却月</div>
				<input type="text" class="input-area" name="pcadminRetDt"
					placeholder="yyyy/mm 例:2020/01" />

			</div>
			<div class="search-three">
				<div class="search-title">アカウント名</div>
				<input type="text" name="pcadminAccountName" class="input-area" />

			</div>
			<div class="search-three">
				<div class="search-title">CPU</div>
				<input type="text" name="pcadminCpu" class="input-area" />

			</div>
			<div class="search-three">
				<div class="search-title">メモリ</div>
				<input type="text" name="pcadminMemory" class="input-area" />

			</div>
			<div class="search-three">
				<div class="search-title">ハードディスク</div>
				<input type="text" name="pcadminHardDisk" class="input-area" />

			</div>
			<div class="search-three">
				<div class="search-title">OS</div>
				<input type="text" name="pcadminOs" class="input-area" />

			</div>
		</div>
		<br /> <input type="button" value="検索" class="search-button"
			onclick="PcadminListScript.search(this);" />
	</div>
</div>

<div class="full-conts">
	<div class="button-conts" style="display: block;">
		<input type="button" value="変更"
			onclick="PcadminListScript.updateAction(this);"> <input
			type="button" value="削除"
			onclick="PcadminListScript.deleteAction(this);">
	</div>

	<div class="table-area scrollbar" id="scrollbarlist">
		<div class="inner"></div>
	</div>
	<div class="table-area scrollbox" id="scrollboxlist">
		<div class="inner">
			<table style="width: 5700px;">
				<colgroup>
					<col width="100px" />
					<col width="180px" />
					<col width="180px" />
					<col width="180px" />
					<col width="180px" />
					<col width="180px" />
					<col width="180px" />
					<col width="180px" />
					<col width="180px" />
					<col width="180px" />
					<col width="180px" />
					<col width="180px" />
					<col width="180px" />
					<col width="180px" />
					<col width="180px" />
					<col width="180px" />
					<col width="180px" />
					<col width="180px" />
					<col width="180px" />
					<col width="180px" />
					<col width="180px" />
					<col width="180px" />
					<col width="180px" />
					<col width="180px" />
					<col width="180px" />
					<col width="180px" />
					<col width="180px" />
					<col width="180px" />
					<col width="300px" />
					<col width="300px" />
				</colgroup>
				<thead>
					<tr>
						<th><span>チェック</span></th>
						<th class="sortable" data-sort="PCADMIN_ID"><span>ID</span><img
							src="/resources/images/left-arrow.png"></th>
						<th class="sortable" data-sort="PCADMIN_HOLDING_COMPANY"><span>保有会社</span><img
							src="/resources/images/left-arrow.png"></th>
						<th class="sortable" data-sort="PCADMIN_HOLDING_PLACE"><span>保管場所</span><img
							src="/resources/images/left-arrow.png"></th>
						<th class="sortable" data-sort="PCADMIN_USE_PLACE"><span>使用場所</span><img
							src="/resources/images/left-arrow.png"></th>
						<th class="sortable" data-sort="PCADMIN_OPERATION"><span>稼働区分</span><img
							src="/resources/images/left-arrow.png"></th>
						<th class="sortable" data-sort="PCADMIN_USER"><span>利用者</span><img
							src="/resources/images/left-arrow.png"></th>
						<th class="sortable" data-sort="PCADMIN_LAST_USER"><span>前回利用者</span><img
							src="/resources/images/left-arrow.png"></th>
						<th class="sortable" data-sort="PCADMIN_TYPE"><span>種類</span><img
							src="/resources/images/left-arrow.png"></th>
						<th class="sortable" data-sort="PCADMIN_ACCOUNT_NAME"><span>アカウント名</span><img
							src="/resources/images/left-arrow.png"></th>
						<th class="sortable" data-sort="PCADMIN_PASSWORD"><span>パスワード</span><img
							src="/resources/images/left-arrow.png"></th>
						<th class="sortable" data-sort="PCADMIN_MAKER"><span>メーカー</span><img
							src="/resources/images/left-arrow.png"></th>
						<th class="sortable" data-sort="PCADMIN_MODEL"><span>モデル</span><img
							src="/resources/images/left-arrow.png"></th>
						<th class="sortable" data-sort="PCADMIN_MODEL_NUM"><span>型番</span><img
							src="/resources/images/left-arrow.png"></th>
						<th class="sortable" data-sort="PCADMIN_ETHERNET"><span>MACアドレス</br>(イーサネット用)</span><img
							src="/resources/images/left-arrow.png"></th>
						<th class="sortable" data-sort="PCADMIN_WIFI_ADDRESS"><span>MACアドレス</br>(無線LAN用)</span><img
							src="/resources/images/left-arrow.png"></th>
						<th class="sortable" data-sort="PCADMIN_CPU"><span>CPU</span><img
							src="/resources/images/left-arrow.png"></th>
						<th class="sortable" data-sort="PCADMIN_MEMORY"><span>メモリ</span><img
							src="/resources/images/left-arrow.png"></th>
						<th class="sortable" data-sort="PCADMIN_HARD_DISK"><span>ハードディスク</span><img
							src="/resources/images/left-arrow.png"></th>
						<th class="sortable" data-sort="PCADMIN_INSTALL_MEDIA"><span>インストールメディア</span><img
							src="/resources/images/left-arrow.png"></th>
						<th class="sortable" data-sort="PCADMIN_SECURITY_SOFT"><span>セキュリティソフト</span><img
							src="/resources/images/left-arrow.png"></th>
						<th class="sortable" data-sort="PCADMIN_OFFICE"><span>Ofiice</span><img
							src="/resources/images/left-arrow.png"></th>
						<th class="sortable" data-sort="PCADMIN_OS"><span>OS</span><img
							src="/resources/images/left-arrow.png"></th>
						<th class="sortable" data-sort="PCADMIN_PRODUCT_KEY"><span>プロダクトキー</span><img
							src="/resources/images/left-arrow.png"></th>
						<th class="sortable" data-sort="PCADMIN_FORM"><span>形態</span><img
							src="/resources/images/left-arrow.png"></th>
						<th class="sortable" data-sort="PCADMIN_RET_DT"><span>返却日</span><img
							src="/resources/images/left-arrow.png"></th>
						<th class="sortable" data-sort="PCADMIN_PURCHASE_DATE"><span>購入日</span><img
							src="/resources/images/left-arrow.png"></th>
						<th class="sortable" data-sort="PCADMIN_COMMENT"><span>備考</span><img
							src="/resources/images/left-arrow.png"></th>
						<th class="double-column sortable" data-sort="PCADMIN_REG_DT"><span>登録者<br />登録日
						</span><img src="/resources/images/left-arrow.png"></th>
						<th class="double-column sortable" data-sort="PCADMIN_UPD_DT"><span>修正者<br />修正日
						</span><img src="/resources/images/left-arrow.png"></th>
					</tr>
				</thead>
				<tbody class="list-area">
				</tbody>
			</table>
		</div>
	</div>
</div>