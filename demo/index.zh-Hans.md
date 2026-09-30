---
title: 等宽字体网页
subtitle: 一次极简设计探索
author: Oskar Wickström
author-url: "https://wickstrom.tech"
lang: zh-Hans
cjk-font: SC
label-version: 版本
label-updated: 更新
label-author: 作者
label-license: 许可
label-debug: 调试模式
toc-title: 目录
---

## 简介

等宽字体深受许多人喜爱。
有人觉得它比比例字体更易读、更一致、更美观。
也许我们只是在终端里待了太久被洗脑了？
还是说我们只是无可救药地怀旧？
我也不确定。
但我就是喜欢它，所以我开始尝试全等宽字体的网页设计。

在这个页面上，我使用等宽网格来对齐文本和绘制图表。
它从一个简单的 Markdown 文档（使用 Pandoc）生成，CSS 和少量 Javascript 将其渲染到网格上。
页面是响应式的，以字符为单位逐步缩放。
标准元素应该*开箱即用*，至少这是目标。
这是语义化的 HTML，渲染起来就像回到了 70 年代。

好吧，但这真的是个好主意吗？
这是一个技术和创意上的挑战，而且我喜欢这种美学风格。
如果你想使用它，请随意 fork 或复制你需要的部分，尊重许可协议即可。
我可能会持续更新，改进并支持更多标准元素。

## 基础

这个文档在某些地方使用了一些额外的 class，但基本上就是普通的标记。
比如，这就是一个普通的段落。

看看这条水平分割线：

<hr>

很漂亮。我们可以把内容藏在 `<details>` 元素里：

<details>
<summary>内容的简短摘要</summary>
<p>隐藏的宝藏。</p>
</details>

## 列表

这是一个普通的无序列表：

* 香蕉
* 纸船
* 黄瓜
* 火箭

有序列表看起来和你预期的差不多：

1. 目标
1. 动机
    1. 内在的
    1. 外在的
1. 二阶效应

可视化树形结构也不错。
这是一个带有 `tree` class 的普通无序列表：

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

我们可以使用会自动适配等宽网格的普通表格。
它们是响应式的。

<table>
<thead>
  <tr>
    <th class="width-min">名称</th>
    <th class="width-auto">尺寸</th>
    <th class="width-min">坐标</th>
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

注意只允许一列自动增长。

## 表单

这是一些按钮：

<nav>
    <button>重置</button>
    <button>保存</button>
</nav>

以及输入框：

<form class="grid">
<label>姓 <input type="text" placeholder="请输入..." /></label>
<label>名 <input type="text" placeholder="请输入..." /></label>
<label>年龄 <input type="text" value="30" /></label>
</form>

还有单选按钮：

<form class="grid">
<label><input name="radio" type="radio" /> 选项一</label>
<label><input name="radio" type="radio" /> 选项二</label>
<label><input name="radio" type="radio" /> 选项三</label>
</form>

## 网格

给容器添加 `grid` class 可以将水平空间均匀分配给单元格。
注意它会保持等宽，所以总宽度可能不是 100%。
以下是六个单元格数量递增的网格：

<div class="grid"><input readonly value="1" /></div>
<div class="grid"><input readonly value="1" /><input readonly value="2" /></div>
<div class="grid"><input readonly value="1" /><input readonly value="2" /><input readonly value="3" /></div>
<div class="grid"><input readonly value="1" /><input readonly value="2" /><input readonly value="3" /><input readonly value="4" /></div>
<div class="grid"><input readonly value="1" /><input readonly value="2" /><input readonly value="3" /><input readonly value="4" /><input readonly value="5" /></div>
<div class="grid"><input readonly value="1" /><input readonly value="2" /><input readonly value="3" /><input readonly value="4" /><input readonly value="5" /><input readonly value="6" /></div>

如果想让某个单元格填满剩余空间，给它设置 `flex-grow: 1;` 即可。

<div class="grid"><input readonly value="1" /><input readonly value="2" /><input readonly value="3!" style="flex-grow: 1;" /><input readonly value="4" /><input readonly value="5" /><input readonly value="6" /></div>

## ASCII 绘图

我们可以在 `<pre>` 标签中使用[制表符](https://zh.wikipedia.org/wiki/%E5%88%B6%E8%A1%A8%E7%AC%A6)绘图：

```
╭─────────────────╮
│ MONOSPACE ROCKS │
╰─────────────────╯
```

`<pre>` 里的制表符默认占一格，和终端里一样，所以上面这个框可以直接从英文版复制过来。如果图里有汉字，想让制表符和汉字一样宽（占两格），就给 `<pre>` 加上 `class="ascii-cjk"`，下面两张图都是这样画的。

为了更突出，可以用 `<figure>` 标签包裹，再加上 `<figcaption>`。

<figure>
<pre class="ascii-cjk">
┌────┐  ┌────┐  ┌────┐
│参与者１│  │参与者２│  │参与者３│
└──┬─┘  └──┬─┘  └──┬─┘
      │            │            │
      │            │  消息１    │
      │            │─────► │
      │            │            │
      │  消息２    │            │
      │─────► │            │
┌──┴─┐  ┌──┴─┐  ┌──┴─┐
│参与者１│  │参与者２│  │参与者３│
└────┘  └────┘  └────┘</pre>
<figcaption>示例：消息传递。</figcaption>
</figure>

再来画一个图表！

<figure><pre class="ascii-cjk">
              我拥有的东西

    │                              ██ 可用
15  │
    │                              ░░ 损坏
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
         袜子   牛仔裤   衬衫   U盘
</pre></figure>

## 媒体

支持媒体对象，如图片和视频：

![法国古堡中的一个房间 (2024)](demo/castle.jpg)

![[网之中心 (1914), 维基媒体](https://en.wikisource.org/wiki/Page:The_Center_of_the_Web_(1914).webm/11)](https://upload.wikimedia.org/wikipedia/commons/e/e0/The_Center_of_the_Web_%281914%29.webm)

它们会扩展到页面宽度，并在底部添加适当的内边距以保持等宽网格对齐。

## 讨论

目前就是这些了。
我非常享受制作这个页面的过程，锻炼了我的 CSS 技能，设计也很有趣。
如果你喜欢它，甚至决定使用它，请[告诉我](https://x.com/owickstrom)。

完整源代码在这里：[github.com/owickstrom/the-monospace-web](https://github.com/owickstrom/the-monospace-web)

最后，向 [U.S. Graphics Company](https://x.com/usgraphics) 致以崇高的敬意，感谢所有的灵感。
