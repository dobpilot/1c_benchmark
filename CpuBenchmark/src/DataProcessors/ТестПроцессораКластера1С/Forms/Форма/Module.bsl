
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Объект.РазмерТаблицыИсходныхДанныхДляРасчета = 24000000;
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура Запустить(Команда)
	ЗапуститьНаСервере();
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура ЗапуститьНаСервере()
	
	Диаграмма.Точки.Очистить();
	Диаграмма.Серии.Очистить();
	
	Серия = Диаграмма.Серии.Добавить("ВремяВыполнения");

	Т1 = ТекущаяУниверсальнаяДатаВМиллисекундах();

	ТЗ = ГенераторТаблицыЗначений.СоздатьТаблицуЗначений(Объект.РазмерТаблицыИсходныхДанныхДляРасчета);

	Т2 = ТекущаяУниверсальнаяДатаВМиллисекундах() - Т1;
	Сообщить("Итоговое количество элементов: "+XMLСтрока(ТЗ.Количество()));			

	Сообщить(Т2);
	
	Точка = Диаграмма.Точки.Добавить("Один поток");
	
	Диаграмма.УстановитьЗначение(Точка,Серия, Т2 , "", "" );		
			
	ИмяФЗ = "СоздатьТаблицуЗначений";		
						
	Т1 = ТекущаяУниверсальнаяДатаВМиллисекундах();
			
	ПараметрыФЗ = Новый Массив(1);

	ПараметрыФЗ[0] = Объект.РазмерТаблицыИсходныхДанныхДляРасчета / 2;		

	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_1",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_2",ИмяФЗ);

	ФоновыеЗаданияСервер.ОжидатьЗавершенияФоновыхЗадач(ИмяФЗ);

	Т2 = ТекущаяУниверсальнаяДатаВМиллисекундах() - Т1;
	Сообщить(Т2);
	Точка = Диаграмма.Точки.Добавить("Два потока");
	Диаграмма.УстановитьЗначение(Точка,Серия, Т2 , "", "" );		
	

	Т1 = ТекущаяУниверсальнаяДатаВМиллисекундах();		
	ПараметрыФЗ[0] = Объект.РазмерТаблицыИсходныхДанныхДляРасчета / 4;		
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_1",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_2",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_3",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_4",ИмяФЗ);

	ФоновыеЗаданияСервер.ОжидатьЗавершенияФоновыхЗадач(ИмяФЗ);

	Т2 = ТекущаяУниверсальнаяДатаВМиллисекундах() - Т1;

	Сообщить(Т2);
	Точка = Диаграмма.Точки.Добавить("Четыре потока");
	Диаграмма.УстановитьЗначение(Точка,Серия, Т2 , "", "" );		

	Т1 = ТекущаяУниверсальнаяДатаВМиллисекундах();
			
	ПараметрыФЗ[0] = Объект.РазмерТаблицыИсходныхДанныхДляРасчета / 8;		
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_1",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_2",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_3",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_4",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_5",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_6",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_7",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_8",ИмяФЗ);

	ФоновыеЗаданияСервер.ОжидатьЗавершенияФоновыхЗадач(ИмяФЗ);

	Т2 = ТекущаяУниверсальнаяДатаВМиллисекундах() - Т1;
	Сообщить(Т2);
	Точка = Диаграмма.Точки.Добавить("Восемь потоков");
	
	Диаграмма.УстановитьЗначение(Точка,Серия, Т2 , "", "" );		
		

	Т1 = ТекущаяУниверсальнаяДатаВМиллисекундах();
			
	ПараметрыФЗ[0] = Объект.РазмерТаблицыИсходныхДанныхДляРасчета / 16;		
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_1",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_2",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_3",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_4",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_5",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_6",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_7",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_8",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_9",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_10",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_11",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_12",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_13",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_14",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_15",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_16",ИмяФЗ);

	ФоновыеЗаданияСервер.ОжидатьЗавершенияФоновыхЗадач(ИмяФЗ);

	Т2 = ТекущаяУниверсальнаяДатаВМиллисекундах() - Т1;
	Сообщить(Т2);
	Точка = Диаграмма.Точки.Добавить("Шестьнадцать потоков");
	
	Диаграмма.УстановитьЗначение(Точка,Серия, Т2 , "", "" );		
				

	Т1 = ТекущаяУниверсальнаяДатаВМиллисекундах();
			
	ПараметрыФЗ[0] = Объект.РазмерТаблицыИсходныхДанныхДляРасчета / 32;		
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_1",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_2",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_3",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_4",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_5",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_6",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_7",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_8",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_9",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_10",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_11",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_12",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_13",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_14",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_15",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_16",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_17",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_18",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_19",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_20",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_21",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_22",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_23",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_24",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_25",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_26",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_27",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_28",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_29",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_30",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_31",ИмяФЗ);
	ФоновыеЗадания.Выполнить("ГенераторТаблицыЗначений.СоздатьТаблицуЗначений",ПараметрыФЗ,ИмяФЗ+"_32",ИмяФЗ);

	ФоновыеЗаданияСервер.ОжидатьЗавершенияФоновыхЗадач(ИмяФЗ);

	Т2 = ТекущаяУниверсальнаяДатаВМиллисекундах() - Т1;
	Сообщить(Т2);
	Точка = Диаграмма.Точки.Добавить("Тридцать два потока");
	
	Диаграмма.УстановитьЗначение(Точка,Серия, Т2 , "", "" );		
	
КонецПроцедуры

#КонецОбласти
