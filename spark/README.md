# Spark Shell

Локальная среда для разработки и тестирования приложений с Apache Spark.

## Быстрый старт

### Автоматический запуск
```bash
chmod +x start.sh
./start.sh
```

Скрипт автоматически:
- Запускает контейнер Spark
- Дожидается готовности контейнера
- Запускает интерактивный Spark Shell с поддержкой Kafka
- Загружает пользовательские функции из `shell-functions.scala`
- Останавливает контейнер после завершения работы

### Ручное управление
```bash
# Запуск контейнера в фоне
docker compose up -d

# Вход в контейнер
docker exec -it spark-shell bash

# Запуск Spark Shell
docker exec -it spark-shell /opt/spark/bin/spark-shell

# Остановка
docker compose down
```

## Использование

После запуска доступна интерактивная среда Spark Shell:

```scala
// Пример работы с данными
val df = spark.read.json("example.json") // чтение example.json из директории /data
df.show()

// Работа с Kafka
val kafkaDF = spark
  .readStream
  .format("kafka")
  .option("kafka.bootstrap.servers", "localhost:9092")
  .option("subscribe", "topic1")
  .load()
```

## Остановка

При использовании скрипта `spark.sh` остановка происходит автоматически. Для ручного управления используйте `docker-compose down`.

## Примечания

- Файлы в директории `data` доступны внутри контейнера по пути `/opt/spark/data` (является рабочей директорией при запуске Spark)
- Кэш зависимостей сохраняется в `cache/` для ускорения последующих запусков
