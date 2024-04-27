USE UNIVER;

---task1---
DECLARE @c char = 'k',
		@v varchar(5) = 'Oleg',
		@d datetime,
		@t time,
		@i int,
		@s smallint,
		@ti tinyint,
		@n numeric(12,5);

SET @d= GETDATE();
SET @t='23:35:10.20';

SELECT @i = 768, @s = 235, @ti = 2, @n = 1234.1234

PRINT 'CHAR: ' + @c
PRINT 'VARCHAR: ' + @v
PRINT 'INT: ' + CAST(@i AS CHAR)
PRINT 'SMALLINT: ' + CAST(@s AS CHAR)

SELECT @d[datetime], @t[time], @ti[tinyint], @n[numeric];

---task2---
DECLARE @capacity1 INT,
		@capacity2 INT,
		@capcity3 INT,
		@capcity4 INT;	

SELECT @capacity1= (SELECT SUM(AUDITORIUM_CAPACITY) FROM AUDITORIUM)

IF @capacity1 > 200
BEGIN
SELECT @capacity2 = (SELECT COUNT(*) AS [COUNT OF AUDITORIES] FROM AUDITORIUM),
	   @capcity3 = (SELECT AVG(AUDITORIUM_CAPACITY) AS [AUDIENCE CAPACITY] FROM AUDITORIUM)
SET @capcity4 = (SELECT COUNT(*) AS [COUNT OF AUDITORIES] FROM AUDITORIUM WHERE AUDITORIUM_CAPACITY < @capcity3)

SELECT @capacity2 'Кол-во_аудиторий', 
	   @capcity3 'Средн_вместимость', 
	   @capcity4 'Вмест_меньше_средн',
	   100*(CAST(@capcity4 AS FLOAT) / CAST(@capacity2 AS FLOAT)) '% Процент_аудиторий'
END 
ELSE PRINT 'S' + CAST(@capacity1 as varchar(10))

---task3---
SELECT @@ROWCOUNT 'число обработанных строк',
	   @@VERSION 'версия SQL Server',
	   @@SPID 'возвращает системный идентификатор процесса, назначенный сервером те-кущему подключению',
	   @@ERROR 'код последней ошибки',
	   @@SERVERNAME 'имя сервера',
	   @@TRANCOUNT 'возвращает уровень вложенности транзакции',
	   @@FETCH_STATUS 'проверка результата считывания строк результирующего набора',
	   @@NESTLEVEL 'уровень вложенности текущей процедуры'

---task4---
DECLARE @tt int = 6, @x float = 5.6, @z float;

IF(@tt > @x) 
SET @z = POWER(SIN(@tt),2);
IF(@tt < @x) 
SET @z = 4 * (@tt + @x);
IF(@tt = @x)
SET @z = 1 - EXP(@x -2);

PRINT 'Z= ' + CAST (@z AS VARCHAR(10));

USE UNIVER
DECLARE @fio VARCHAR(100) = (SELECT TOP(1) STUDENT.NAME FROM STUDENT)
PRINT 'ФИО:' + @fio
DECLARE @shortFIO VARCHAR(100) = SUBSTRING(@fio, 0, CHARINDEX(' ', @fio) + 1) 
+ SUBSTRING(@fio, CHARINDEX(' ', @fio) + 1, 1) + '. '
+ SUBSTRING(@fio, CHARINDEX(' ', @fio, CHARINDEX(' ', @fio) + 1) + 1, 1) + '.'
PRINT 'СОКРАЩЕННОЕ:' + @shortFIO

USE UNIVER
SELECT NAME, BDAY, 2024-YEAR(BDAY) [YEAR]	
FROM STUDENT 
WHERE MONTH(BDAY)=MONTH(GETDATE())+1

SELECT *
FROM (SELECT *,
(CASE
	WHEN datepart(WEEKDAY, PDATE) = 1 then 'Понедельник'
	WHEN datepart(WEEKDAY, PDATE) = 2 then 'Вторник'
	WHEN datepart(WEEKDAY, PDATE) = 3 then 'Среда'
	WHEN datepart(WEEKDAY, PDATE) = 4 then 'Четверг'
	WHEN datepart(WEEKDAY, PDATE) = 5 then 'Пятница'
	WHEN datepart(WEEKDAY, PDATE) = 6 then 'Суббота'
	WHEN datepart(WEEKDAY, PDATE) = 7 then 'Воскресенье'
end) День_недели
FROM PROGRESS
WHERE SUBJECT LIKE '%СУБД%') as tr;

---task5---
DECLARE @group INT = 4, @avg NUMERIC(5,2)
DECLARE @count INT = (SELECT COUNT(*) FROM STUDENT WHERE IDGROUP = @group)
IF (@count > 5)
BEGIN
SET @avg = (SELECT AVG (CAST (PROGRESS.NOTE AS REAL))
FROM STUDENT JOIN PROGRESS ON STUDENT.IDSTUDENT = PROGRESS.IDSTUDENT)
PRINT 'больше 5: '+CAST(@avg AS VARCHAR)
END
ELSE PRINT 'меньше 5: '+CAST(@count AS VARCHAR)

---task6---
SELECT STUDENT.NAME [Студент], STUDENT.IDGROUP [Группа],
CASE 
	 WHEN PROGRESS.NOTE BETWEEN 0 AND 3 THEN 'плохо'
	 WHEN PROGRESS.NOTE BETWEEN 4 AND 6 THEN 'хорошо'
	 WHEN PROGRESS.NOTE BETWEEN 7 AND 8 THEN 'отлично'
	 ELSE 'no'
	 END [отметка], COUNT(*)[количество]
FROM STUDENT, PROGRESS WHERE STUDENT.IDGROUP=4
GROUP BY STUDENT.NAME, STUDENT.IDGROUP,
CASE 
     WHEN PROGRESS.NOTE BETWEEN 0 AND 3 THEN 'плохо'
	 WHEN PROGRESS.NOTE BETWEEN 4 AND 6 THEN 'хорошо'
	 WHEN PROGRESS.NOTE BETWEEN 7 AND 8 THEN 'отлично'
	 ELSE 'no'
	 END

---task7---
CREATE TABLE #NEW(age INT,NAME VARCHAR(50), id INT)
DECLARE @ii INT = 0;
WHILE @ii < 10
BEGIN
INSERT #NEW(age, name, id) VALUES (FLOOR(24*RAND()), REPLICATE('something',2), FLOOR(26*RAND()));
SET @ii = @ii + 1;
END
SELECT * FROM #NEW
DROP TABLE #NEW

---task8---
DECLARE @A INT = 3
WHILE @A < 10
BEGIN
PRINT @A
SET @A=@A+2
IF (@A > 9) 
RETURN
END

---task9---
BEGIN TRY
  DECLARE @Err INT;
  SELECT @Err = 1 / 0;
END TRY
BEGIN CATCH
  PRINT ERROR_NUMBER()
  PRINT ERROR_MESSAGE()
  PRINT ERROR_LINE()
  PRINT ERROR_PROCEDURE()
  PRINT ERROR_SEVERITY()
  PRINT ERROR_STATE()
END CATCH