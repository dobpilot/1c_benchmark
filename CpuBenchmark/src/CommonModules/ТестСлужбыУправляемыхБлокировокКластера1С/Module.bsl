	
	
#Область ПрограммныйИнтерфейс

// Выполнить тест.
// 
// Параметры:
//  КоличествоИтераций - Число - Количество элементов
//  АдресДанныхЗамера - Строка - Адрес данных замера в хранилище
// 
// Возвращаемое значение:
//  ТаблицаЗначений - См. ЗамерВремени.ИнициализироватьДанныеЗамера
Функция ВыполнитьТест(Знач КоличествоИтераций, Знач АдресДанныхЗамера) Экспорт
	
	ДанныеЗамера = ЗамерВремени.ИнициализироватьДанныеЗамера();
	
	ЗапуститьТестМногопоточно(КоличествоИтераций, 1, ДанныеЗамера);
	ЗапуститьТестМногопоточно(КоличествоИтераций, 2, ДанныеЗамера);		
	ЗапуститьТестМногопоточно(КоличествоИтераций, 4, ДанныеЗамера);		
	ЗапуститьТестМногопоточно(КоличествоИтераций, 6, ДанныеЗамера);		
	ЗапуститьТестМногопоточно(КоличествоИтераций, 8, ДанныеЗамера);		
	ЗапуститьТестМногопоточно(КоличествоИтераций, 12, ДанныеЗамера);		
	ЗапуститьТестМногопоточно(КоличествоИтераций, 16, ДанныеЗамера);
	ЗапуститьТестМногопоточно(КоличествоИтераций, 24, ДанныеЗамера);
	ЗапуститьТестМногопоточно(КоличествоИтераций, 32, ДанныеЗамера);
	ЗапуститьТестМногопоточно(КоличествоИтераций, 48, ДанныеЗамера);
	ЗапуститьТестМногопоточно(КоличествоИтераций, 64, ДанныеЗамера);
	ЗапуститьТестМногопоточно(КоличествоИтераций, 128, ДанныеЗамера);
	ЗапуститьТестМногопоточно(КоличествоИтераций, 256, ДанныеЗамера);

	РегистрыСведений.РезультатыТестирования.Записать(ДанныеЗамера,ИмяТеста());
	
	ПоместитьВоВременноеХранилище(ДанныеЗамера, АдресДанныхЗамера);
		
	Возврат ДанныеЗамера;
	
КонецФункции

// Выполнить простой запрос в транзакции.
// 
// Параметры:
//  КоличествоИтераций - Число - Количество итераций
Процедура ВыполнитьПростойЗапросВТранзакции(Знач КоличествоИтераций) Экспорт
	
	
	Для Сч = 0 По КоличествоИтераций Цикл
			
		НачатьТранзакцию();
		
		Запрос = Новый Запрос;
		Запрос.Текст = 
			"ВЫБРАТЬ
			|	1 КАК Поле1";
		
		//@skip-check query-in-loop
		РезультатЗапроса = Запрос.Выполнить();

		ЗафиксироватьТранзакцию();
		
	КонецЦикла;        
	
		
КонецПроцедуры

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

// Запустить тест многопоточно.
// 
// Параметры:
//  КоличествоИтераций - Число - Количество элементов
//  КоличествоПотоков - Число - Количество потоков
//  ДанныеЗамера - См. ЗамерВремени.ИнициализироватьДанныеЗамера
Процедура ЗапуститьТестМногопоточно(Знач КоличествоИтераций, Знач КоличествоПотоков, ДанныеЗамера) Экспорт

	ИмяФЗ = ПолучитьИмяФЗ();

	ПараметрыФЗ = Новый Массив(1);	
	ПараметрыФЗ[0] = КоличествоИтераций / КоличествоПотоков;
			
	НаименованиеЗамера = ПолучитьИмяФЗ()+"_"+XMLСтрока(КоличествоПотоков);
	
	Замер = ЗамерВремени.НачатьЗамер(ДанныеЗамера, НаименованиеЗамера, КоличествоИтераций,КоличествоПотоков);
	
	Для Сч=1 По КоличествоПотоков Цикл
		ФоновыеЗадания.Выполнить("ТестСлужбыУправляемыхБлокировокКластера1С.ВыполнитьПростойЗапросВТранзакции",ПараметрыФЗ,ИмяФЗ+"_"+XMLСтрока(Сч),ИмяФЗ);		
	КонецЦикла;			

	ФоновыеЗаданияСервер.ОжидатьЗавершенияФоновыхЗадач(ИмяФЗ);
	
	ЗамерВремени.ЗавершитьЗамер(Замер);
	
КонецПроцедуры

// Получить имя теста.
// 
// Возвращаемое значение:
//  Строка - Имя теста
Функция ИмяТеста() Экспорт
	Возврат "Простой запрос в транзакции";
КонецФункции

// Количество итераций.
// 
// Возвращаемое значение:
//  Число - Количество итераций
Функция КоличествоИтераций() Экспорт
	Возврат 2400;
КонецФункции

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Получить имя ФЗ.
// 
// Возвращаемое значение:
//  Строка - Имя ФЗ
Функция ПолучитьИмяФЗ()
	Возврат "ПростойЗапросВТразнакции";
КонецФункции



#КонецОбласти
