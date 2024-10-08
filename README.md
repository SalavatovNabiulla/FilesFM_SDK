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
	<img src="https://infostart.ru/upload/iblock/62d/62d3d5ec3ecb75b6a8deb3a4ba286066.png" alt="Project thumbnail"/>
</div>

Хочу представить вам модуль для автоматической выгрузки файлов в бесплатный файлообменник, который вы можете использовать во многих ваших проектах, начиная, например, от обмена между системами без необходимости выгружать сами файлы а отправляя лишь ссылки на них или же для взаимодействия с клиентами в виде указывания в документах ссылок для загрузки связанных файлов, рекламных данных и т.д.

<hr/>


<div align = "center">
	<h1>Функционал библиотеки</h1>
</div>

```
Функция ПолучитьCookie(УчетнаяЗапись)
```
Создаёт защищенное соединение и возвращает Cookie файлы для дальнейшего использования. Возвращает Cookie
```
Функция СоздатьУчетнуюЗапись()
```
Так как сервис не предоставляет возможность использовать некоторые функции API без активной учетной записи, я внедрил функцию автоматической регистрации новой учетной записи на случай если вы не хотите создавать свою. Возвращает структуру, которая хранит имя пользователя и пароль
```
Функция ВыгрузкаФайлаНаФайлообменник(ПолноеИмяФайла,ДанныеКаталога)
```
В качестве параметров получает путь к файлу, структуру "ДанныеКаталога" в которой хранится Hash папки родителя и её Add_Key. Возвращает ссылку на файл
```
Функция СоздатьПапкуНаФайлообменнике(УчетнаяЗапись,ИмяКаталога)
```
Создает новый каталог, в качестве параметров принимая учетную запись и имя каталога. Возвращает Hash, Add_Key и Delete_Key папки в виде структуры
```
Функция ПолучитьСсылкуНаФайл(ДанныеКаталога,УчетнаяЗапись)
```
Возвращает ссылку на файл получая Hash каталога родителя и учетную запись в качестве параметров. (Почему получает Hash папки? Принцип выгрузки в файлообменник по технической документации подразумевает предварительное создание каталога. Соответственно в новой папке будет единственный файл, хэш которого мы и получим. Далее генерируется ссылка по принципу домен+ключ+хеш
```
Функция ПолучитьКорневойКаталог(УчетнаяЗапись)
```
Если у вас есть учетная запись и вы хотите выгружать файлы в корневой каталог без создания новых папок то вы можете получить данные корневой папки с помощью этой функции в виде структуры и далее её передать в функцию выгрузки файла
```
Функция ПолучитьКлючиФайла(УчетнаяЗапись,ДанныеФайла)
```
Если у вас есть Hash каталога/файла то вы можете получить ключи редактирования с помощью этой функции. Ключи нужны для добавления файла в каталог и для прочих операций
```
Функция ПереименоватьФайл(УчетнаяЗапись,ДанныеФайла,ДанныеКаталога,НовоеИмяФайла)
```
Позволяет переименовать файл получая в качестве параметров учетную запись, данные файла и данные каталога в виде структуры а имя файла как строку
```
Функция ЗагрузитьФайлНаФайлообменник(ПолноеИмяФайла)Экспорт
```
Единственная экспортная функция, которая в качестве параметра принимает путь к файлу и возвращает готовую ссылку на файл, которую можно отправить в форму "FilesFM_Ссылка" или как либо по другому обработать

<hr/>


<div align = "center">
	<h1>Совместимость</h1>
</div>

Обратите внимание что версии ПО на вашем компьютере не обязательно должны быть идентичными версиям ниже, так как у библиотеки нет строгой зависимости. В разделе "Полезные советы" вы можете найти немного информации по этому вопросу!

<b>Платформа (На которой проводилось последнее тестирование): 8.3.19.1264</b>

<!-- Content -->

<!-- Partner -->
<hr>
<div align = "center">
	<h3>Страница проекта на Infostart</h3>
	<a href="https://infostart.ru/1c/tools/1530474/">
		<img src="https://infostart.ru/bitrix/templates/sandbox_empty/assets/tpl/abo/img/logo.svg" alt="Infostart" width="240" height="80" />
	</a>
</div>
<hr>
<!-- Partner -->
