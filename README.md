# README

## Task Tracker

Состояния заданий

* new - новый, статус при создании
* queue - в очереди
* assigned - назначен
* performing - разрабатывается, выполняется
* checking - проверяется
* ready - выполнено, готово
* closed - закрыто, отколено

Недостатки

1. Покрытие тестами 0%
2. При переходе между состояниями происходит redirect. Лучше это реализовать
при помощи ajax
3. Назанчение пользователей (в проектах) тоже лучше через ajax
