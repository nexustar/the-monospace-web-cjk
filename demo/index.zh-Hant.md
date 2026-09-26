---
title: 等寬字體網頁
subtitle: 一次極簡設計探索
author: Oskar Wickström
author-url: "https://wickstrom.tech"
lang: zh-Hant
cjk-font: TC
label-version: 版本
label-updated: 更新
label-author: 作者
label-license: 授權
label-debug: 除錯模式
toc-title: 目錄
---

## 簡介

等寬字體深受許多人喜愛。
有人覺得它比比例字體更易讀、更一致、更美觀。
也許我們只是在終端機裡待了太久被洗腦了？
還是說我們只是無可救藥地懷舊？
我也不確定。
但我就是喜歡它，所以我開始嘗試全等寬字體的網頁設計。

在這個頁面上，我使用等寬網格來對齊文字和繪製圖表。
它從一個簡單的 Markdown 文件（使用 Pandoc）產生，CSS 和少量 Javascript 將其渲染到網格上。
頁面是響應式的，以字元為單位逐步縮放。
標準元素應該*開箱即用*，至少這是目標。
這是語意化的 HTML，渲染起來就像回到了 70 年代。

好吧，但這真的是個好主意嗎？
這是一個技術和創意上的挑戰，而且我喜歡這種美學風格。
如果你想使用它，請隨意 fork 或複製你需要的部分，尊重授權條款即可。
我可能會持續更新，改進並支援更多標準元素。

## 基礎

這個文件在某些地方使用了一些額外的 class，但基本上就是普通的標記。
比如，這就是一個普通的段落。

看看這條水平分隔線：

<hr>

很漂亮。我們可以把內容藏在 `<details>` 元素裡：

<details>
<summary>內容的簡短摘要</summary>
<p>隱藏的寶藏。</p>
</details>

## 列表

這是一個普通的無序列表：

* 香蕉
* 紙船
* 黃瓜
* 火箭

有序列表看起來和你預期的差不多：

1. 目標
1. 動機
    1. 內在的
    1. 外在的
1. 二階效應

視覺化樹狀結構也不錯。
這是一個帶有 `tree` class 的普通無序列表：

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

## 表格

我們可以使用會自動適配等寬網格的普通表格。
它們是響應式的。

<table>
<thead>
  <tr>
    <th class="width-min">名稱</th>
    <th class="width-auto">尺寸</th>
    <th class="width-min">座標</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>波波里方尖碑</td>
    <td>1.41m &times; 1.41m &times; 4.87m</td>
    <td>43°45'50.78"N 11°15'3.34"E</td>
  </tr>
  <tr>
    <td>卡夫拉金字塔</td>
    <td>215.25m &times; 215.25m &times; 136.4m</td>
    <td>29°58'34"N 31°07'51"E</td>
  </tr>
</tbody>
</table>

注意只允許一欄自動增長。

## 表單

這是一些按鈕：

<nav>
    <button>重設</button>
    <button>儲存</button>
</nav>

以及輸入框：

<form class="grid">
<label>姓 <input type="text" placeholder="請輸入..." /></label>
<label>名 <input type="text" placeholder="請輸入..." /></label>
<label>年齡 <input type="text" value="30" /></label>
</form>

還有單選按鈕：

<form class="grid">
<label><input name="radio" type="radio" /> 選項一</label>
<label><input name="radio" type="radio" /> 選項二</label>
<label><input name="radio" type="radio" /> 選項三</label>
</form>

## 網格

給容器添加 `grid` class 可以將水平空間均勻分配給儲存格。
注意它會保持等寬，所以總寬度可能不是 100%。
以下是六個儲存格數量遞增的網格：

<div class="grid"><input readonly value="1" /></div>
<div class="grid"><input readonly value="1" /><input readonly value="2" /></div>
<div class="grid"><input readonly value="1" /><input readonly value="2" /><input readonly value="3" /></div>
<div class="grid"><input readonly value="1" /><input readonly value="2" /><input readonly value="3" /><input readonly value="4" /></div>
<div class="grid"><input readonly value="1" /><input readonly value="2" /><input readonly value="3" /><input readonly value="4" /><input readonly value="5" /></div>
<div class="grid"><input readonly value="1" /><input readonly value="2" /><input readonly value="3" /><input readonly value="4" /><input readonly value="5" /><input readonly value="6" /></div>

如果想讓某個儲存格填滿剩餘空間，給它設定 `flex-grow: 1;` 即可。

<div class="grid"><input readonly value="1" /><input readonly value="2" /><input readonly value="3!" style="flex-grow: 1;" /><input readonly value="4" /><input readonly value="5" /><input readonly value="6" /></div>

## ASCII 繪圖

我們可以在 `<pre>` 標籤中使用[製表符](https://zh.wikipedia.org/wiki/%E5%88%B6%E8%A1%A8%E7%AC%A6)繪圖：

```
╭─────────╮
│ MONOSPACE ROCKS  │
╰─────────╯
```

為了更突出，可以用 `<figure>` 標籤包裹，再加上 `<figcaption>`。

<figure>
<pre>
┌────┐  ┌────┐  ┌────┐
│參與者１│  │參與者２│  │參與者３│
└──┬─┘  └──┬─┘  └──┬─┘
      │            │            │
      │            │  訊息１    │
      │            │─────► │
      │            │            │
      │  訊息２    │            │
      │─────► │            │
┌──┴─┐  ┌──┴─┐  ┌──┴─┐
│參與者１│  │參與者２│  │參與者３│
└────┘  └────┘  └────┘</pre>
<figcaption>範例：訊息傳遞。</figcaption>
</figure>

再來畫一個圖表！

<figure><pre>
              我擁有的東西

    │                              ██ 可用
15  │
    │                              ░░ 損壞
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
         襪子   牛仔褲   襯衫 隨身碟
</pre></figure>

## 媒體

支援媒體物件，如圖片和影片：

![法國古堡中的一個房間 (2024)](demo/castle.jpg)

![[網之中心 (1914), 維基媒體](https://en.wikisource.org/wiki/Page:The_Center_of_the_Web_(1914).webm/11)](https://upload.wikimedia.org/wikipedia/commons/e/e0/The_Center_of_the_Web_%281914%29.webm)

它們會擴展到頁面寬度，並在底部添加適當的內邊距以保持等寬網格對齊。

## 討論

目前就是這些了。
我非常享受製作這個頁面的過程，鍛鍊了我的 CSS 技能，設計也很有趣。
如果你喜歡它，甚至決定使用它，請[告訴我](https://x.com/owickstrom)。

完整原始碼在這裡：[github.com/owickstrom/the-monospace-web](https://github.com/owickstrom/the-monospace-web)

最後，向 [U.S. Graphics Company](https://x.com/usgraphics) 致以崇高的敬意，感謝所有的靈感。
