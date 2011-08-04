Utel::Balance
============

Установка
------------

    $ gem install utel

Для корректной работы, в порт USB должен быть вставлен модем ОГО!Мобильный. Скрипт обращается к /dev/ttyUSB2, так что я думаю, что будет поддерживаться не только модемы Huawei, но и остальные


Проверка баланса
----------------

    Utel::Balance.summary
    => "Vash balans:zagal'nyi 46,06; paketnyi 0,00; dodatkovyi 0,00 hrn.Perevirka dodatkovykh poslug *121#"

    Utel::Balance.vas
    => "Internet:3G 1572602.0Kb,Universalnyi 144140.0Kb,Nat.rouming 0.0Kb;0.0SMS po Ukraini;0v mezhah Ukrainy;0na inshi mobilni Ukrainy"

Текущий оператор
----------------

    Utel::Operator.name
    => "UTEL3G�"

Отправить SMS
-------------

    Utel::SMS.send('0917776655', 'Hello, world!')


Узнать баланс и текущего оператора кастомным скриптом
---------------------------

    $ ruby balance.rb
    Vash balans:zagal'nyi 46,06; paketnyi 0,00; dodatkovyi 0,00 hrn.Perevirka dodatkovykh poslug *121#
    Internet:3G 1572602.0Kb,Universalnyi 144140.0Kb,Nat.rouming 0.0Kb;0.0SMS po Ukraini;0v mezhah Ukrainy;0na inshi mobilni Ukrainy
    UTEL3G�

TODO
----

Сделать так, чтобы была разбивка по типам баланса. Regexp наше все

    Utel::Balance.detailed
    => {
      :primary => 46.06,
      :pocket => 0.00,
      :additional => 0.00,
      :internet => {
        :3g => 1572602.0,
        :universal => 144140.0
      },
      :vas => {
        :sms => 0,
        :ukraine => 0,
        :other => 0
      }
    }

FIXME
-----

Данные можно получить только после установления соединения с интернетом и получения каких-либо пакетных данных.
