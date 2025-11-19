# Apache Kafka

Локальный кластер Apache Kafka для разработки и тестирования.

## Быстрый старт

### Автоматический запуск
```bash
chmod +x start.sh
./start.sh
```

Скрипт автоматически:
- Запускает весь кластер (контейнеры Zookeeper, Kafka и Kafka UI)
- Дожидается готовности Kafka-брокера
- Запускает интерактивную bash-сессию в контейнере Kafka
- Останавливает кластер после завершения работы

### Ручное управление
```bash
# Запуск кластера
docker compose up -d

# Остановка кластера
docker compose down

# Запуск сессии
docker exec -it kafka bash
```

## Доступ к сервисам

- **Kafka UI**: http://localhost:9090
- **Kafka Broker**: localhost:9092
- **Zookeeper**: localhost:2181

## Использование

### Через интерактивную сессию

После запуска скрипта доступна командная строка внутри контейнера Kafka:

```bash
# Создание топика
kafka-topics --create --topic test-topic --bootstrap-server localhost:9092 --partitions 1 --replication-factor 1

# Просмотр топиков
kafka-topics --list --bootstrap-server localhost:9092

# Отправка сообщений
kafka-console-producer --topic test-topic --bootstrap-server localhost:9092

# Чтение сообщений
kafka-console-consumer --topic test-topic --bootstrap-server localhost:9092 --from-beginning
```

### Через Kafka UI

Доступны возможности:
- Просмотр топиков и их конфигурации
- Мониторинг сообщений в реальном времени
- Управление потребителями
- Создание и удаление топиков

## Конфигурация Kafka

- **Автосоздание топиков**: включено
- **Удаление топиков**: разрешено
- **Фактор репликации**: 1 (для разработки)
- **Сетевой режим**: host для простоты доступа

## Примеры использования

### Создание топика
```bash
kafka-topics --create --topic user-events --bootstrap-server localhost:9092 --partitions 3 --replication-factor 1
```

### Отправка сообщений
```bash
echo "Hello, Kafka!" | kafka-console-producer --topic user-events --bootstrap-server localhost:9092
```

### Чтение сообщений
```bash
kafka-console-consumer --topic user-events --bootstrap-server localhost:9092 --from-beginning
```

## Остановка

При использовании скрипта `start.sh` остановка происходит автоматически после выхода из bash-сессии.  Для ручного управления используйте `docker-compose down`.
