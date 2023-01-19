from connect_db import connect_db_on, connect_db_off
from humans_friends import Animals

print('Меню:')
print('1. Добавление животного\n2. Определение класса\n3. Просмотр команд\n4. Обучение команде\n0. Выход ')

animal = Animals
print(connect_db_on())
flag = True
while flag:
    n = int(input("Введите номер меню: "))
    if n == 1:
        animal.add_animals()
    elif n == 2:
        animal.define_class()
    elif n == 3:
        animal.view_commands()
    elif n == 4:
        animal.train_command()
    elif n == 0:
        print(connect_db_off())
        flag = False
    else:
        print('Неверно введен номер меню')
