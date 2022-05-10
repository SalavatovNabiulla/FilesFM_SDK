﻿//Генераторы
Функция СгенерироватьДанныеДляРегистрации()
	ИмяПользователя = СтрЗаменить(Строка(Новый УникальныйИдентификатор()), "-", "");
	Пароль = СтрЗаменить(Строка(Новый УникальныйИдентификатор()), "-", "");
	Почта = СтрЗаменить(Строка(Новый УникальныйИдентификатор()), "-", "")+"@gmail.com";
	//
	ДанныеДляРегистрации = Новый Структура;
	ДанныеДляРегистрации.Вставить("ИмяПользователя",ИмяПользователя);
	ДанныеДляРегистрации.Вставить("Пароль",Пароль);
	ДанныеДляРегистрации.Вставить("Почта",Почта);
	Возврат ДанныеДляРегистрации;
КонецФункции
//Служебные функции
Функция ПолучитьУчетнуюЗапись()
	ИмяПользователя = Константы.FilesFM_Пользователь.Получить();
	Пароль = Константы.FilesFM_Пароль.Получить();
	УчетнаяЗапись = Новый Структура;
	УчетнаяЗапись.Вставить("ИмяПользователя",ИмяПользователя);
	УчетнаяЗапись.Вставить("Пароль",Пароль);
	Возврат УчетнаяЗапись;
КонецФункции
Функция ПолучитьCookie(УчетнаяЗапись)
	АдресСервера = "api.files.fm";
	//
	SSL = Новый ЗащищенноеСоединениеOpenSSL();
	HTTPСоединение = Новый HTTPСоединение(АдресСервера,,,,,,SSL,);
	//
	HTTPЗапрос = Новый HTTPЗапрос("/api/login.php?user="+УчетнаяЗапись.ИмяПользователя+"&pass="+УчетнаяЗапись.Пароль);
	Результат = HTTPСоединение.Получить(HTTPЗапрос);
	КодСостояния = Результат.КодСостояния;
	Ответ = Результат.ПолучитьТелоКакСтроку();
	Cookie = Результат.Заголовки["Set-Cookie"];
	Возврат Cookie;
КонецФункции
Функция СоздатьУчетнуюЗапись()
	SSL = Новый ЗащищенноеСоединениеOpenSSL();
	HTTPСоединение = Новый HTTPСоединение("api.files.fm",,,,,,SSL);
	ДанныеДляРегистрации = СгенерироватьДанныеДляРегистрации();
	HTTPЗапрос = Новый HTTPЗапрос("/api/register.php?user="+ДанныеДляРегистрации.ИмяПользователя+"&pass="+ДанныеДляРегистрации.Пароль+"&email="+ДанныеДляРегистрации.Почта+"&source=devapi&lang=en");
	Результат = HTTPСоединение.Получить(HTTPЗапрос);
	КодСостояния = Результат.КодСостояния;
	Ответ = Результат.ПолучитьТелоКакСтроку();
	Если СтрНайти(Ответ,"Congratulations on setting up a new Files.fm account!") <> 0 Тогда
		Возврат ДанныеДляРегистрации;
	Иначе
		СоздатьУчетнуюЗапись();
	КонецЕсли;
КонецФункции
Функция ВыгрузкаФайлаНаФайлообменник(ПолноеИмяФайла,ДанныеКаталога)
	//
	Файл = Новый Файл(ПолноеИмяФайла);
	ДвоичныеДанные = Новый ДвоичныеДанные(ПолноеИмяФайла);
	//
	АдресСервера = "files.fm";
	АдресСкрипта = "/save_file.php?up_id="+ДанныеКаталога.hash+"&key="+ДанныеКаталога.add_key;
	//
	SSL = Новый ЗащищенноеСоединениеOpenSSL();
	HTTPСоединение = Новый HTTPСоединение(АдресСервера,,,,,,SSL,);
	//
	Разделитель = СтрЗаменить(Новый УникальныйИдентификатор, "-", "");
	РазделительСтрок = Символы.ВК + Символы.ПС;
	//
	Заголовки = Новый Соответствие;
	Заголовки.Вставить("Content-Type","multipart/form-data; boundary="+Разделитель);
	Заголовки.Вставить("Accept-Encoding","gzip");
	Заголовки.Вставить("Accept","*/*");
	//
	HTTPЗапрос = Новый HTTPЗапрос(АдресСкрипта,Заголовки);
	//
	ТелоЗапроса = HTTPЗапрос.ПолучитьТелоКакПоток();
	ЗаписьДанных = Новый ЗаписьДанных(ТелоЗапроса, КодировкаТекста.UTF8, ПорядокБайтов.LittleEndian, "", "", Ложь);
	ЗаписьДанных.ЗаписатьСтроку("--" + Разделитель + РазделительСтрок);
	ЗаписьДанных.ЗаписатьСтроку("Content-Disposition: form-data; name=""F""; filename="""+Файл.Имя+""""); 
	ЗаписьДанных.ЗаписатьСтроку(РазделительСтрок);
	ЗаписьДанных.ЗаписатьСтроку("Content-Type: application/octet-stream");
	ЗаписьДанных.ЗаписатьСтроку(РазделительСтрок);
	ЗаписьДанных.ЗаписатьСтроку("");
	//
	ЗаписьДанных.ЗаписатьСтроку(РазделительСтрок);
	ЗаписьДанных.Записать(ДвоичныеДанные);
	ЗаписьДанных.ЗаписатьСтроку(РазделительСтрок);
	ЗаписьДанных.ЗаписатьСтроку("--" + Разделитель + "--" + РазделительСтрок);
	ЗаписьДанных.Закрыть();
	//
	Результат = HTTPСоединение.ВызватьHTTPМетод("POST",HTTPЗапрос);
	КодСостояния = Результат.КодСостояния;
	Ответ = Результат.ПолучитьТелоКакСтроку();
КонецФункции
Функция СоздатьПапкуНаФайлообменнике(УчетнаяЗапись,ИмяКаталога)
	АдресСервера = "api.files.fm";
	//
	SSL = Новый ЗащищенноеСоединениеOpenSSL();
	HTTPСоединение = Новый HTTPСоединение(АдресСервера,,,,,,SSL,);
	HTTPЗапрос = Новый HTTPЗапрос("/api/get_upload_id.php?user="+УчетнаяЗапись.ИмяПользователя+"&pass="+УчетнаяЗапись.Пароль+"&folder_name="+ИмяКаталога);
	Результат = HTTPСоединение.Получить(HTTPЗапрос);
	КодСостояния = Результат.КодСостояния;
	Ответ = Результат.ПолучитьТелоКакСтроку();
	//
	ЧтениеJSON = Новый ЧтениеJSON;
	ЧтениеJSON.УстановитьСтроку(Ответ);
	JSON = ПрочитатьJSON(ЧтениеJSON);
	Для Каждого Стр Из JSON Цикл
		Если Стр.Ключ = "hash" Тогда
			hash = Стр.Значение;
		ИначеЕсли Стр.Ключ = "add_key" Тогда
			add_key = Стр.Значение;
		КонецЕсли;
	КонецЦикла;
	ДанныеКаталога = Новый Структура;
	ДанныеКаталога.Вставить("hash",hash);
	ДанныеКаталога.Вставить("add_key",add_key);
	Возврат ДанныеКаталога;
КонецФункции
Функция ПолучитьСсылкуНаФайл(ДанныеКаталога,УчетнаяЗапись)
	Заголовки = Новый Соответствие;
	Заголовки.Вставить("Cookie",ПолучитьCookie(УчетнаяЗапись));
	АдресСервера = "api.files.fm";
	SSL = Новый ЗащищенноеСоединениеOpenSSL();
	HTTPСоединение = Новый HTTPСоединение(АдресСервера,,,,,,SSL,);
	HTTPЗапрос = Новый HTTPЗапрос("/api/get_file_list_for_upload.php?hash="+ДанныеКаталога.hash,Заголовки);
	Результат = HTTPСоединение.Получить(HTTPЗапрос);
	КодСостояния = Результат.КодСостояния;
	Ответ = Результат.ПолучитьТелоКакСтроку();
	ЧтениеJSON = Новый ЧтениеJSON;
	ЧтениеJSON.УстановитьСтроку(Ответ);
	JSON = ПрочитатьJSON(ЧтениеJSON);
	Для Каждого Стр Из JSON Цикл
		hash = Стр.hash;
	КонецЦикла;
	//
	СсылкаНаФайл = "https://files.fm/f/"+hash;
	Возврат СсылкаНаФайл;
КонецФункции
Функция ПолучитьКорневойКаталог(УчетнаяЗапись) 
	АдресСервера = "api.files.fm";
	SSL = Новый ЗащищенноеСоединениеOpenSSL();
	HTTPСоединение = Новый HTTPСоединение(АдресСервера,,,,,,SSL,);
	HTTPЗапрос = Новый HTTPЗапрос("api/login.php?user="+УчетнаяЗапись.ИмяПользователя+"&pass="+УчетнаяЗапись.Пароль);
	Результат = HTTPСоединение.Получить(HTTPЗапрос);
	КодСостояния = Результат.КодСостояния;
	Ответ = Результат.ПолучитьТелоКакСтроку();
	МассивСлов = СтрРазделить(Ответ,";",Ложь);
	МассивСлов1 = СтрРазделить(МассивСлов[5],"=",Ложь);
	МассивСлов2 = СтрРазделить(МассивСлов[6],"=",Ложь);
	ДанныеКаталога = Новый Структура;
	ДанныеКаталога.Вставить("hash",МассивСлов1[1]);
	ДанныеКаталога.Вставить("add_key",МассивСлов2[1]);
	Возврат ДанныеКаталога;
КонецФункции
Функция ПолучитьКлючиФайла(УчетнаяЗапись,ДанныеФайла) 
	АдресСервера = "api.files.fm";
	SSL = Новый ЗащищенноеСоединениеOpenSSL();
	HTTPСоединение = Новый HTTPСоединение(АдресСервера,,,,,,SSL,);
	HTTPЗапрос = Новый HTTPЗапрос("/api/get_upload_keys.php?hash="+ДанныеФайла.hash+"&user="+УчетнаяЗапись.ИмяПользователя+"&pass="+УчетнаяЗапись.Пароль);
	Результат = HTTPСоединение.Получить(HTTPЗапрос);
	КодСостояния = Результат.КодСостояния;
	Ответ = Результат.ПолучитьТелоКакСтроку();
	ЧтениеJSON = Новый ЧтениеJSON;
	ЧтениеJSON.УстановитьСтроку(Ответ);
	JSON = ПрочитатьJSON(ЧтениеJSON);
	КлючиФайла = Новый Структура;
	Для Каждого Стр Из JSON Цикл
		Если Стр.Ключ = "AddFileKey" Тогда
			КлючиФайла.Вставить("AddFileKey",Стр.Значение);
		ИначеЕсли Стр.Ключ = "DeleteKey" Тогда
			КлючиФайла.Вставить("DeleteKey",Стр.Значение);
		КонецЕсли;
	КонецЦикла;
	Возврат КлючиФайла;
КонецФункции
Функция ПереименоватьФайл(УчетнаяЗапись,ДанныеФайла,ДанныеКаталога,НовоеИмяФайла)
	Заголовки = Новый Соответствие;
	Заголовки.Вставить("Cookie",ПолучитьCookie(УчетнаяЗапись));
	АдресСервера = "api.files.fm";
	SSL = Новый ЗащищенноеСоединениеOpenSSL();
	HTTPСоединение = Новый HTTPСоединение(АдресСервера,,,,,,SSL,);
	HTTPЗапрос = Новый HTTPЗапрос("/api/change_file.php?file_hash="+ДанныеФайла.hash+"&folder_hash="+ДанныеКаталога.hash+"&file_display_name="+НовоеИмяФайла,Заголовки);
	Результат = HTTPСоединение.Получить(HTTPЗапрос);
	КодСостояния = Результат.КодСостояния;
	Ответ = Результат.ПолучитьТелоКакСтроку();
КонецФункции
//Клиентские функции
Функция ЗагрузитьФайлНаФайлообменник(ПолноеИмяФайла)Экспорт
	УчетнаяЗапись = ПолучитьУчетнуюЗапись();
	Если ПустаяСтрока(УчетнаяЗапись.ИмяПользователя) ИЛИ ПустаяСтрока(УчетнаяЗапись.Пароль) Тогда
		Файл = Новый Файл(ПолноеИмяФайла);
		УчетнаяЗапись = СоздатьУчетнуюЗапись();
		ДанныеКаталога = СоздатьПапкуНаФайлообменнике(УчетнаяЗапись,Файл.ИмяБезРасширения);
		ВыгрузкаФайлаНаФайлообменник(ПолноеИмяФайла,ДанныеКаталога);
		СсылкаНаФайл = ПолучитьСсылкуНаФайл(ДанныеКаталога,УчетнаяЗапись);
	Иначе
		ДанныеКаталога = СоздатьПапкуНаФайлообменнике(УчетнаяЗапись,Файл.ИмяБезРасширения);
		ВыгрузкаФайлаНаФайлообменник(ПолноеИмяФайла,ДанныеКаталога);
		СсылкаНаФайл = ПолучитьСсылкуНаФайл(ДанныеКаталога,УчетнаяЗапись);
	КонецЕсли;
	Возврат СсылкаНаФайл;
КонецФункции
//
