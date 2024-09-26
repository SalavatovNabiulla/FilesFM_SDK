<hr>
<!-- Donations -->
<div align = "center">
	<h3>Поддержать OpenSource разработку</h3>
	<a href="https://yookassa.ru/my/i/ZvMnfF25nCN8/l">
		<img src="https://yookassa.ru/files/Guide_files/logo-black.svg" alt="Donate RUB" width="240" height="80" />
	</a>
	<div>
		<b>Банковские карты RUB (СБП, SberPay и т.д.)</b>
	</div>
</div>
<!-- Donations -->

<hr/>

<!-- TG -->
<div align = "center">
	<h3>Вступайте в открытый чат по 1С Разработке</h3>
	<a href="https://t.me/grokking_1c">
		<img src="https://icon-icons.com/downloadimage.php?id=72055&root=923/PNG/256/&file=telegram_icon-icons.com_72055.png" alt="Telegram" width="80" height="80" />
	</a>
</div>
<div align = "center">
	<b><i>Общаемся, делимся мыслями, разработками и полезными материалами!</i></b>
</div>
<!-- TG -->

<hr/>

<!-- Content -->
<div align = "center">
	<h1>О Проекте</h1>
</div>

<div align = "center">
	<img src="https://infostart.ru/upload/iblock/c92/c92c2ad30386d1c9d9d3cd26058fec8a.png" alt="Project thumbnail"/>
</div>

Хочу представить вам модуль для интеграции 1С 8.3 с бесплатным сервисом для генерации штрих-кодов, с помощью которого вы сможете выводить на форму или на табличный документ штрих-коды различных типов (модуль поддерживает 105 типов штрихкодов) без необходимости устанавливать внешнюю компоненту!

<hr/>

<div align = "center">
	<h1>Типы поддерживаемых штрихкодов</h1>
</div>

Узнать требования к содержанию для любого типа штрих-кода вы можете перейдя по этой ссылке, а ниже представлен список всех доступных типов и их коды для работы с модулем
```
0: AusPost 4 State Customer Code
1: Aztec Code
2: Compact Aztec Code
3: Aztec Runes
4: BC412
5: Channel Code
6: Codablock F
7: Code 11
8: Code 128
9: Code 16K
10: Code 25
11: Italian Pharmacode
12: Code 39
13: Code 39 Extended
14: Code 49
15: Code 93
16: Code 93 Extended
17: Code One
18: COOP 2 of 5
19: Custom 4 state symbology
20: GS1 DataBar Expanded
21: GS1 DataBar Expanded Composite
22: GS1 DataBar Expanded Stacked
23: GS1 DataBar Expanded Stacked Composite
24: GS1 DataBar Limited
25: GS1 DataBar Limited Composite
26: GS1 DataBar Omnidirectional
27: GS1 DataBar Omnidirectional Composite
28: GS1 DataBar Stacked
29: GS1 DataBar Stacked Composite
30: GS1 DataBar Stacked Omnidirectional
31: GS1 DataBar Stacked Omnidirectional Composite
32: GS1 DataBar Truncated
33: GS1 DataBar Truncated Composite
34: Datalogic 2 of 5
35: Data Matrix
36: Data Matrix Rectangular
37: Data Matrix Rectangular Extension
38: DotCode
39: EAN-13
40: EAN-13 Composite
41: GS1-14
42: EAN-2 (2 digit addon)
43: EAN-5 (5 digit addon)
44: EAN-8
45: EAN-8 Composite
46: Flattermarken
47: GS1-128
48: GS1-128 Composite
49: GS1 Composite 2D Component
50: GS1 Data Matrix
51: GS1 Data Matrix Rectangular
52: GS1 DotCode
53: GS1 North American Coupon
54: GS1 QR Code
55: Han Xin Code
56: HIBC Aztec Code
57: HIBC Codablock F
58: HIBC Code 128
59: HIBC Code 39
60: HIBC Data Matrix
61: HIBC Data Matrix Rectangular
62: HIBC MicroPDF417
63: HIBC PDF417
64: HIBC QR Code
65: IATA 2 of 5
66: Deutsche Post Identcode
67: Industrial 2 of 5
68: Interleaved 2 of 5 (ITF)
69: ISBN
70: ISMN
71: ISSN
72: ITF-14
73: Japan Post 4 State Customer Code
74: Royal Dutch TPG Post KIX
75: Deutsche Post Leitcode
76: Royal Mail Mailmark
77: Matrix 2 of 5
78: MaxiCode
79: MicroPDF417
80: Micro QR Code
81: MSI Modified Plessey
82: USPS Intelligent Mail
83: PDF417
84: Compact PDF417
85: Pharmaceutical Binary Code
86: Two-track Pharmacode
87: USPS PLANET
88: Plessey UK
89: PosiCode
90: USPS POSTNET
91: Pharmazentralnummer (PZN)
92: QR Code
93: Codabar
94: Custom 1D symbology
95: Rectangular Micro QR Code
96: Royal Mail 4 State Customer Code
97: SSCC-18
98: Miscellaneous symbols
99: Telepen
100: Telepen Numeric
101: Ultracode
102: UPC-A
103: UPC-A Composite
104: UPC-E
105: UPC-E Composite
```

<hr/>

<div align = "center">
	<h1>Функционал библиотеки</h1>
</div>

```
Функция СгенерироватьШтрихКод(Тип,ШтрихКод)
```
В качестве параметров необходимо передать тип штрих-кода (Можете найти в списке выше, например у EAN-13 код 39) в виде числа в параметр "Тип" и содержание штрих-кода (Требования к содержанию кода можете найти в списке выше) в виде строки в параметр "ШтрихКод"

Возвращает адрес двоичных данных картинки во временном хранилище


<hr/>


<div align = "center">
	<h1>Совместимость</h1>
</div>

Обратите внимание что версии ПО на вашем компьютере не обязательно должны быть идентичными версиям ниже, так как у библиотеки нет строгой зависимости. В разделе "Полезные советы" вы можете найти немного информации по этому вопросу!

<b>Платформа (На которой проводилось последнее тестирование): 8.3.20.1996</b>

<!-- Content -->

<!-- Partner -->
<hr>
<div align = "center">
	<h3>Страница проекта на Infostart</h3>
	<a href="https://infostart.ru/1c/tools/2194329/">
		<img src="https://infostart.ru/bitrix/templates/sandbox_empty/assets/tpl/abo/img/logo.svg" alt="Infostart" width="240" height="80" />
	</a>
</div>
<hr>
<!-- Partner -->
