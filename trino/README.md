# Trino Cluster

Тестовый стенд для распределенного кластера Trino с объектным хранилищем MinIO.

## Компоненты

- **MinIO** - S3-совместимое хранилище
  - Порт: 9000 (API), 9001 (Web UI)
  - Учетные данные: `minioadmin/minioadmin`

- **Trino Cluster** - распределенный SQL-движок
  - Coordinator: 1 нода (порт 8080)
  - Workers: 3 ноды
  - Web UI: http://localhost:8080

## Быстрый старт

### Автоматический запуск
```bash
chmod +x start.sh
./start.sh
```

Скрипт автоматически:
- Запускает все сервисы
- Дожидается готовности Trino
- Запускает CLI Trino
- Останавливает и очищает окружение после завершения работы

### Ручное управление
```bash
# Запуск
docker-compose up -d

# Остановка
docker-compose down

# Очистка данных
docker-compose down -v
```

## Доступ к сервисам

- **MinIO Web UI**: http://localhost:9001
- **Trino Web UI**: http://localhost:8080  
- **Trino CLI**: автоматически запускается в скрипте start.sh

## Конфигурация

Конфигурационные файлы Trino находятся в директории `./etc/`:
- `config.properties.coordinator` - настройки координатора
- `config.properties.worker` - настройки воркеров  
- `catalog/` - коннекторы к данным
- `node.properties` и `jvm.config` - общие настройки

## Использование

После запуска можно подключаться к Trino и выполнять SQL-запросы к данным в MinIO:

```sql
-- Пример запроса
SELECT * FROM minio.default.table_name;
```

## Остановка и очистка

При использовании скрипта `start.sh` очистка происходит автоматически. Для ручного управления используйте `docker-compose down -v`.
