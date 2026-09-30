---
title: 모노스페이스 웹
subtitle: 미니멀리스트 디자인 탐구
author: Oskar Wickström
author-url: "https://wickstrom.tech"
lang: ko
cjk-font: KR
label-version: 버전
label-updated: 업데이트
label-author: 저자
label-license: 라이선스
label-debug: 디버그 모드
toc-title: 목차
---

## 소개

고정폭 글꼴은 많은 사람에게 사랑받고 있습니다.
가변폭 글꼴보다 더 읽기 쉽고, 일관성 있고, 아름답다고 느끼는 사람도 있습니다.
터미널에서 수년을 보내며 세뇌당한 것일 수도 있습니다.
아니면 구제불능의 향수병일까요?
잘 모르겠습니다.
하지만 좋아하니까, 전부 고정폭 글꼴로 된 웹을 실험해 보기로 했습니다.

이 페이지에서는 고정폭 그리드를 사용하여 텍스트를 정렬하고 다이어그램을 그립니다.
간단한 Markdown 문서(Pandoc 사용)에서 생성되며, CSS와 약간의 Javascript가 그리드 위에 렌더링합니다.
페이지는 반응형이며 문자 크기 단위로 단계적으로 축소됩니다.
표준 요소는 _그냥 작동해야_ 합니다. 적어도 그것이 목표입니다.
시맨틱 HTML을 마치 70년대로 돌아간 것처럼 렌더링합니다.

좋습니다만, 이것이 정말 좋은 아이디어일까요?
기술적이고 창의적인 도전이며 이 미학이 마음에 듭니다.
사용하고 싶으시다면 라이선스를 존중하면서 자유롭게 포크하거나 필요한 부분을 복사하세요.
개선 사항과 더 많은 표준 요소 지원으로 업데이트할 수도 있습니다.

## 기본

이 문서는 여기저기 추가 클래스를 사용하지만 대부분은 그냥 마크업입니다.
예를 들어, 이것은 일반 단락입니다.

이 수평선을 보세요:

<hr>

멋지죠. `<details>` 요소에 콘텐츠를 숨길 수 있습니다:

<details>
<summary>내용의 짧은 요약</summary>
<p>숨겨진 보물.</p>
</details>

## 목록

이것은 평범한 글머리 기호 목록입니다:

* 바나나
* 종이배
* 오이
* 로켓

번호 매기기 목록도 예상대로의 모습입니다:

1. 목표
1. 동기
    1. 내재적
    1. 외재적
1. 2차 효과

트리 시각화도 좋습니다.
이것은 `tree` 클래스가 있는 일반 비순서 목록입니다:

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

## 표

고정폭 그리드에 자동으로 맞춰지는 일반 표를 사용할 수 있습니다.
반응형입니다.

<table>
<thead>
  <tr>
    <th class="width-min">이름</th>
    <th class="width-auto">크기</th>
    <th class="width-min">위치</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>보볼리 오벨리스크</td>
    <td>1.41m &times; 1.41m &times; 4.87m</td>
    <td>43°45'50.78"N 11°15'3.34"E</td>
  </tr>
  <tr>
    <td>카프레의 피라미드</td>
    <td>215.25m &times; 215.25m &times; 136.4m</td>
    <td>29°58'34"N 31°07'51"E</td>
  </tr>
</tbody>
</table>

확장할 수 있는 열은 하나뿐입니다.

## 양식

버튼입니다:

<nav>
    <button>초기화</button>
    <button>저장</button>
</nav>

입력란:

<form class="grid">
<label>성 <input type="text" placeholder="입력하세요..." /></label>
<label>이름 <input type="text" placeholder="입력하세요..." /></label>
<label>나이 <input type="text" value="30" /></label>
</form>

라디오 버튼:

<form class="grid">
<label><input name="radio" type="radio" /> 옵션 1</label>
<label><input name="radio" type="radio" /> 옵션 2</label>
<label><input name="radio" type="radio" /> 옵션 3</label>
</form>

## 그리드

컨테이너에 `grid` 클래스를 추가하면 수평 공간을 셀에 균등하게 나눕니다.
고정폭을 유지하므로 총 너비가 100%가 아닐 수 있습니다.
다음은 셀 수가 증가하는 6개의 그리드입니다:

<div class="grid"><input readonly value="1" /></div>
<div class="grid"><input readonly value="1" /><input readonly value="2" /></div>
<div class="grid"><input readonly value="1" /><input readonly value="2" /><input readonly value="3" /></div>
<div class="grid"><input readonly value="1" /><input readonly value="2" /><input readonly value="3" /><input readonly value="4" /></div>
<div class="grid"><input readonly value="1" /><input readonly value="2" /><input readonly value="3" /><input readonly value="4" /><input readonly value="5" /></div>
<div class="grid"><input readonly value="1" /><input readonly value="2" /><input readonly value="3" /><input readonly value="4" /><input readonly value="5" /><input readonly value="6" /></div>

특정 셀이 나머지를 채우게 하려면 해당 셀에 `flex-grow: 1;`을 설정합니다.

<div class="grid"><input readonly value="1" /><input readonly value="2" /><input readonly value="3!" style="flex-grow: 1;" /><input readonly value="4" /><input readonly value="5" /><input readonly value="6" /></div>

## ASCII 그리기

`<pre>` 태그에서 [상자 그리기 문자](https://ko.wikipedia.org/wiki/%EC%83%81%EC%9E%90_%EA%B7%B8%EB%A6%AC%EA%B8%B0)를 사용하여 그릴 수 있습니다:

```
╭─────────────────╮
│ MONOSPACE ROCKS │
╰─────────────────╯
```

`<pre>` 안의 상자 그리기 문자는 터미널처럼 기본적으로 한 칸을 차지합니다. 그래서 위의 상자는 영어판에서 그대로 복사할 수 있습니다. 그림에 한글이나 한자가 들어가서 선을 글자와 같은 전각(두 칸)으로 맞추고 싶다면 `<pre>`에 `class="ascii-cjk"`를 붙이세요. 아래 두 그림이 이렇게 그려졌습니다.

더 눈에 띄게 하려면 `<figure>` 태그로 감싸고 `<figcaption>`을 추가할 수 있습니다.

<figure>
<pre class="ascii-cjk">
┌────┐  ┌────┐  ┌────┐
│참여자１│  │참여자２│  │참여자３│
└──┬─┘  └──┬─┘  └──┬─┘
      │            │            │
      │            │  메시지１  │
      │            │─────► │
      │            │            │
      │  메시지２  │            │
      │─────► │            │
┌──┴─┐  ┌──┴─┐  ┌──┴─┐
│참여자１│  │참여자２│  │참여자３│
└────┘  └────┘  └────┘</pre>
<figcaption>예시: 메시지 전달.</figcaption>
</figure>

차트도 그려봅시다!

<figure><pre class="ascii-cjk">
              내가 가진 것들

    │                              ██ 사용 가능
15  │
    │                              ░░ 고장남
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
         양말   청바지   셔츠   USB
</pre></figure>

## 미디어

이미지와 비디오 같은 미디어 객체를 지원합니다:

![프랑스 고성의 방 (2024)](demo/castle.jpg)

![[웹의 중심 (1914), 위키미디어](https://en.wikisource.org/wiki/Page:The_Center_of_the_Web_(1914).webm/11)](https://upload.wikimedia.org/wikipedia/commons/e/e0/The_Center_of_the_Web_%281914%29.webm)

페이지 너비로 확장되며, 고정폭 그리드를 유지하기 위해 하단에 적절한 패딩이 추가됩니다.

## 마무리

지금은 여기까지입니다.
CSS 실력을 키우고 디자인을 즐기며 이 작업을 매우 즐겼습니다.
마음에 드시거나 사용하기로 하셨다면 [알려주세요](https://x.com/owickstrom).

전체 소스 코드는 여기에 있습니다: [github.com/owickstrom/the-monospace-web](https://github.com/owickstrom/the-monospace-web)

마지막으로, 모든 영감을 준 [U.S. Graphics Company](https://x.com/usgraphics)에 큰 감사를 보냅니다.
