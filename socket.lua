local socket = require("socket")

-- IP адрес и порт для проверки соединения
local ip = "192.168.0.1"
local port = 80

-- Создаем сокет
local client = socket.tcp()

-- Устанавливаем таймаут в 5 секунд
client:settimeout(5)

-- Пытаемся установить соединение
local success, error_message = client:connect(ip, port)

-- Проверяем результат
if success then
    print("Сетевой интерфейс работает корректно")
else
    print("Ошибка: " .. error_message)
end

-- Закрываем сокет
client:close()
