# otus_shop_database

Схема базы данных:

![no schema file :(](./db_course_hw1/shop_db_schema.jpg?raw=true)

Докумментация:

База данных содержит таблицы для интернет-магазина

Описание таблиц для бд интернет-магазина:
- category - содержит категории продуктов
- producer - содержит информацию о производителе товара
- provider - содержит информацию о продавце товара
- contacts - содержит информцию о контактах покупателя
- customer - содержит информацию о покупателе
- products - содержит данные о продуктах (описание, идентификатор производителя, категорию товара)
- price    - содержит информацию о цене на товар (цена на товар от одного производителя у разных продавцов может различаться)
- purchase - содержит информацию о покупке (содержит информцию)

Примеры бизнес-задач, которые решает база данных:

- Добавление информации о покупке товара у соответствующего поставщика/продавца
- Создание базы данных поставщиков
- Создание базы данных производителей
- Создание базы данных клиентов и контактов клиентов
- Хранение данных о ценах продуктов у различных поставщиков
- Создание номенклатуры товаров
