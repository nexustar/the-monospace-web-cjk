---
title: 等幅フォントのウェブ
subtitle: ミニマリストデザインの探求
author: Oskar Wickström
author-url: "https://wickstrom.tech"
lang: ja
cjk-font: JP
label-version: 版
label-updated: 更新日
label-author: 著者
label-license: ライセンス
label-debug: デバッグ
toc-title: 目次
---

## はじめに

等幅フォントは多くの人に愛されています。
プロポーショナルフォントよりも読みやすく、一貫性があり、美しいと感じる人もいます。
ターミナルで何年も過ごして洗脳されただけかもしれません。
それとも、どうしようもなくノスタルジックなのでしょうか。
よくわかりません。
でも好きなんです。だから等幅フォントだけのウェブを試してみることにしました。

このページでは、等幅グリッドを使ってテキストの整列や図の描画を行っています。
シンプルな Markdown ドキュメント（Pandoc を使用）から生成され、CSS と少しの Javascript でグリッド上にレンダリングされます。
ページはレスポンシブで、文字サイズ単位で段階的に縮小します。
標準要素は*そのまま動く*はずです。少なくともそれが目標です。
セマンティックな HTML を、まるで 70 年代に戻ったかのようにレンダリングしています。

さて、これは本当に良いアイデアなのでしょうか？
技術的・創造的な挑戦であり、この美学が好きです。
使いたい方は、ライセンスを尊重した上で、自由にフォークやコピーしてください。
改善や標準要素のサポート追加で更新するかもしれません。

## 基本

このドキュメントはところどころ追加のクラスを使っていますが、基本的にはただのマークアップです。
例えば、これは普通の段落です。

この水平線を見てください：

<hr>

素敵ですね。`<details>` 要素にコンテンツを隠すことができます：

<details>
<summary>内容の短い要約</summary>
<p>隠された宝物。</p>
</details>

## リスト

これは普通の箇条書きリストです：

* バナナ
* 紙の船
* きゅうり
* ロケット

番号付きリストも期待通りの見た目です：

1. 目標
1. 動機
    1. 内発的
    1. 外発的
1. 二次的効果

ツリーの視覚化も便利です。
これは `tree` クラスを付けた普通の非順序リストです：

<ul class="tree"><li><p style="margin: 0;"><strong>/dev/nvme0n1p2</strong></p>

* usr                               
    * local                         
    * share                         
    * libexec                       
    * include                       
    * sbin                          
    * src                           
    * lib64                         
    * lib                           
    * bin                           
    * games                         
        * solitaire
        * snake
        * tic-tac-toe
    * media                         
* media                             
* run                               
* tmp                               

</li></ul>

## テーブル

等幅グリッドに自動調整される通常のテーブルが使えます。
レスポンシブです。

<table>
<thead>
  <tr>
    <th class="width-min">名前</th>
    <th class="width-auto">寸法</th>
    <th class="width-min">位置</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>ボーボリのオベリスク</td>
    <td>1.41m &times; 1.41m &times; 4.87m</td>
    <td>43°45'50.78"N 11°15'3.34"E</td>
  </tr>
  <tr>
    <td>カフラー王のピラミッド</td>
    <td>215.25m &times; 215.25m &times; 136.4m</td>
    <td>29°58'34"N 31°07'51"E</td>
  </tr>
</tbody>
</table>

拡張できるカラムは一つだけです。

## フォーム

ボタンはこちら：

<nav>
    <button>リセット</button>
    <button>保存</button>
</nav>

入力欄：

<form class="grid">
<label>姓 <input type="text" placeholder="入力してください..." /></label>
<label>名 <input type="text" placeholder="入力してください..." /></label>
<label>年齢 <input type="text" value="30" /></label>
</form>

ラジオボタン：

<form class="grid">
<label><input name="radio" type="radio" /> オプション 1</label>
<label><input name="radio" type="radio" /> オプション 2</label>
<label><input name="radio" type="radio" /> オプション 3</label>
</form>

## グリッド

コンテナに `grid` クラスを追加すると、水平方向のスペースをセルに均等に分割します。
等幅を維持するため、合計幅が 100% にならない場合があります。
以下はセル数が増えていく 6 つのグリッドです：

<div class="grid"><input readonly value="1" /></div>
<div class="grid"><input readonly value="1" /><input readonly value="2" /></div>
<div class="grid"><input readonly value="1" /><input readonly value="2" /><input readonly value="3" /></div>
<div class="grid"><input readonly value="1" /><input readonly value="2" /><input readonly value="3" /><input readonly value="4" /></div>
<div class="grid"><input readonly value="1" /><input readonly value="2" /><input readonly value="3" /><input readonly value="4" /><input readonly value="5" /></div>
<div class="grid"><input readonly value="1" /><input readonly value="2" /><input readonly value="3" /><input readonly value="4" /><input readonly value="5" /><input readonly value="6" /></div>

特定のセルを残りのスペースで埋めたい場合は、そのセルに `flex-grow: 1;` を設定します。

<div class="grid"><input readonly value="1" /><input readonly value="2" /><input readonly value="3!" style="flex-grow: 1;" /><input readonly value="4" /><input readonly value="5" /><input readonly value="6" /></div>

## ASCII 描画

`<pre>` タグで[罫線素片](https://ja.wikipedia.org/wiki/%E7%BD%AB%E7%B7%9A%E7%B4%A0%E7%89%87)を使って描画できます：

```
╭─────────╮
│ MONOSPACE ROCKS  │
╰─────────╯
```

より目立たせるために `<figure>` タグで囲み、`<figcaption>` を追加することもできます。

<figure>
<pre>
┌────┐  ┌────┐  ┌────┐
│参加者１│  │参加者２│  │参加者３│
└──┬─┘  └──┬─┘  └──┬─┘
      │            │            │
      │            │  通知１    │
      │            │─────► │
      │            │            │
      │  通知２    │            │
      │─────► │            │
┌──┴─┐  ┌──┴─┐  ┌──┴─┐
│参加者１│  │参加者２│  │参加者３│
└────┘  └────┘  └────┘</pre>
<figcaption>例：メッセージパッシング。</figcaption>
</figure>

チャートも描いてみましょう！

<figure><pre>
              持っているもの

    │                              ██ 使える
15  │
    │                              ░░ 壊れた
    │
12  │            ░
    │            ░
    │    ░      ░
 9  │    ░      ░
    │    ░      ░
    │    ░      ░              ░
 6  │    █      ░      ░      ░
    │    █      ░      ░      ░
    │    █      ░      █      ░
 3  │    █      █      █      ░
    │    █      █      █      ░
    │    █      █      █      ░
 0  └──▀───▀───▀───▀──
         靴下   ズボン  シャツ  USB
</pre></figure>

## メディア

画像や動画などのメディアオブジェクトに対応しています：

![フランスの古城の一室 (2024)](demo/castle.jpg)

![[ウェブの中心 (1914), ウィキメディア](https://en.wikisource.org/wiki/Page:The_Center_of_the_Web_(1914).webm/11)](https://upload.wikimedia.org/wikipedia/commons/e/e0/The_Center_of_the_Web_%281914%29.webm)

ページ幅まで拡張され、等幅グリッドを維持するために下部に適切なパディングが追加されます。

## おわりに

今のところは以上です。
CSS のスキルを磨き、デザインを楽しみながら、この制作をとても楽しみました。
気に入った方、使ってみようと思った方は、ぜひ[お知らせください](https://x.com/owickstrom)。

ソースコード全体はこちら：[github.com/owickstrom/the-monospace-web](https://github.com/owickstrom/the-monospace-web)

最後に、すべてのインスピレーションをくれた [U.S. Graphics Company](https://x.com/usgraphics) に大きな感謝を。
