# Архитектура сетей.
<br /><br />
разворачиваем сетевую лабораторию <br />
<br />
\# otus-linux<br />
Vagrantfile - для стенда урока 9 - Network <br />
<br />
\# Дано<br />
https://github.com/erlong15/otus-linux/tree/network<br />
(ветка network)<br />
<br />
Vagrantfile с начальным построением сети<br />
- inetRouter<br />
- centralRouter<br />
- centralServer<br />
<br />
тестировалось на virtualbox<br />
<br />
\# Планируемая архитектура<br />
построить следующую архитектуру<br />
<br />
Сеть office1<br />
- 192.168.2.0/26 - dev<br />
- 192.168.2.64/26 - test servers<br />
- 192.168.2.128/26 - managers<br />
- 192.168.2.192/26 - office hardware<br />
<br />
Сеть office2<br />
- 192.168.1.0/25 - dev<br />
- 192.168.1.128/26 - test servers<br />
- 192.168.1.192/26 - office hardware<br />
<br />
<br />
Сеть central<br />
- 192.168.0.0/28 - directors<br />
- 192.168.0.32/28 - office hardware<br />
- 192.168.0.64/26 - wifi<br />
<br />
```<br />
Office1 ---\<br />
-----> Central --IRouter --> internet<br />
Office2----/<br />
```<br />
Итого должны получится следующие сервера<br />
- inetRouter<br />
- centralRouter<br />
- office1Router<br />
- office2Router<br />
- centralServer<br />
- office1Server<br />
- office2Server<br />
<br />
\# Теоретическая часть<br />
- Найти свободные подсети<br />
- Посчитать сколько узлов в каждой подсети, включая свободные<br />
- Указать broadcast адрес для каждой подсети<br />
- проверить нет ли ошибок при разбиении<br />
<br />
\# Практическая часть<br />
- Соединить офисы в сеть согласно схеме и настроить роутинг<br />
- Все сервера и роутеры должны ходить в инет черз inetRouter<br />
- Все сервера должны видеть друг друга<br />
- у всех новых серверов отключить дефолт на нат (eth0), который вагрант поднимает для связи<br />
- при нехватке сетевых интервейсов добавить по несколько адресов на интерфейс<br />
