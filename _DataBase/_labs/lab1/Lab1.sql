SELECT * FROM Кивлинас_ПРОДАЖИ.dbo.ЗАКАЗЫ
WHERE Дата_поставки BETWEEN '2023-03-18' AND '2023-05-30'

SELECT * FROM Кивлинас_ПРОДАЖИ.dbo.ТОВАРЫ
WHERE Цена BETWEEN '30' AND '158'

SELECT * FROM Кивлинас_ПРОДАЖИ.dbo.ЗАКАЗЫ
WHERE Нименование_товара LIKE 'огурцы'

SELECT * FROM Кивлинас_ПРОДАЖИ.dbo.ЗАКАЗЫ
WHERE Заказчик = 'Агроном'
ORDER BY Дата_поставки