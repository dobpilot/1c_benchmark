	
#Область ПрограммныйИнтерфейс

// Выполнить тест.
// 
// Параметры:
//  КоличествоЭлементов - Число - Количество элементов
//  АдресДанныхЗамера - Строка - Адрес данных замера в хранилище
// 
// Возвращаемое значение:
//  ТаблицаЗначений - См. ЗамерВремени.ИнициализироватьДанныеЗамера
Функция ВыполнитьТест(Знач КоличествоЭлементов, Знач АдресДанныхЗамера) Экспорт
	
	ДанныеЗамера = ЗамерВремени.ИнициализироватьДанныеЗамера();
	
	ЗапуститьТестМногопоточно(КоличествоЭлементов, 1, ДанныеЗамера);
	ЗапуститьТестМногопоточно(КоличествоЭлементов, 2, ДанныеЗамера);		
	ЗапуститьТестМногопоточно(КоличествоЭлементов, 4, ДанныеЗамера);		
	ЗапуститьТестМногопоточно(КоличествоЭлементов, 6, ДанныеЗамера);		
	ЗапуститьТестМногопоточно(КоличествоЭлементов, 8, ДанныеЗамера);		
	ЗапуститьТестМногопоточно(КоличествоЭлементов, 12, ДанныеЗамера);		
	ЗапуститьТестМногопоточно(КоличествоЭлементов, 16, ДанныеЗамера);
	ЗапуститьТестМногопоточно(КоличествоЭлементов, 24, ДанныеЗамера);
	ЗапуститьТестМногопоточно(КоличествоЭлементов, 32, ДанныеЗамера);
	ЗапуститьТестМногопоточно(КоличествоЭлементов, 48, ДанныеЗамера);
	ЗапуститьТестМногопоточно(КоличествоЭлементов, 64, ДанныеЗамера);
	ЗапуститьТестМногопоточно(КоличествоЭлементов, 128, ДанныеЗамера);
	ЗапуститьТестМногопоточно(КоличествоЭлементов, 256, ДанныеЗамера);
	
	ПоместитьВоВременноеХранилище(ДанныеЗамера, АдресДанныхЗамера);
		
	Возврат ДанныеЗамера;
	
КонецФункции

// Выполнить расчет таблицы значений.
// 
// Параметры:
//  КоличествоЭлементов - Число - Количество элементов
Процедура ВыполнитьРасчетТаблицыЗначений(Знач КоличествоЭлементов) Экспорт
	
	ТЗ = ГенераторТаблицыЗначений.СоздатьТаблицуЗначений(КоличествоЭлементов);
	
	Для Каждого Стр Из ТЗ Цикл
		Стр.S = Стр.Q * 20;
	КонецЦикла;
		
КонецПроцедуры

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

// Запустить тест многопоточно.
// 
// Параметры:
//  КоличествоЭлементов - Число - Количество элементов
//  КоличествоПотоков - Число - Количество потоков
//  ДанныеЗамера - См. ЗамерВремени.ИнициализироватьДанныеЗамера
Процедура ЗапуститьТестМногопоточно(Знач КоличествоЭлементов, Знач КоличествоПотоков, ДанныеЗамера) Экспорт

	ИмяФЗ = ПолучитьИмяФЗ();

	ПараметрыФЗ = Новый Массив(1);	
	ПараметрыФЗ[0] = КоличествоЭлементов / КоличествоПотоков;
			
	НаименованиеЗамера = XMLСтрока(КоличествоПотоков);
	
	Замер = ЗамерВремени.НачатьЗамер(ДанныеЗамера, НаименованиеЗамера, КоличествоЭлементов);
	
	Для Сч=1 По КоличествоПотоков Цикл
		ФоновыеЗадания.Выполнить("ТестПроцессораКластера1С.ВыполнитьРасчетТаблицыЗначений",ПараметрыФЗ,ИмяФЗ+"_"+XMLСтрока(Сч),ИмяФЗ);		
	КонецЦикла;			

	ФоновыеЗаданияСервер.ОжидатьЗавершенияФоновыхЗадач(ИмяФЗ);
	
	ЗамерВремени.ЗавершитьЗамер(Замер);
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Получить имя ФЗ.
// 
// Возвращаемое значение:
//  Строка - Имя ФЗ
Функция ПолучитьИмяФЗ()
	Возврат "СоздатьТаблицуЗначений";
КонецФункции

#КонецОбласти
