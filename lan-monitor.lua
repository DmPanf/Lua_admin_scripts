--  создаем список серверов для мониторинга и запускает бесконечный цикл, в котором каждые 10 секунд 
-- происходит проверка соединения с каждым сервером и выводится статус мониторинга. 
-- Функция check_server проверяет соединение с заданным сервером, 
-- а функция print_status выводит красивый статус мониторинга на экра

local socket = require("socket")

-- Список серверов для мониторинга
local servers = {
    {name="Server 1", ip="192.168.0.1", port=80},
    {name="Server 2", ip="192.168.0.2", port=80},
    {name="Server 3", ip="192.168.0.3", port=80}
}

-- Функция для проверки соединения с сервером
function check_server(server)
    local client = socket.tcp()
    client:settimeout(5)
    local success, error_message = client:connect(server.ip, server.port)
    client:close()
    return success
end

-- Функция для вывода статуса мониторинга
function print_status(statuses)
    print("-------------------------------")
    for _, server in ipairs(servers) do
        if statuses[server.name] then
            print(server.name .. " - OK")
        else
            print(server.name .. " - ERROR")
        end
    end
    print("-------------------------------")
end

-- Бесконечный цикл мониторинга
while true do
    local statuses = {}
    for _, server in ipairs(servers) do
        statuses[server.name] = check_server(server)
    end
    print_status(statuses)
    socket.sleep(10) -- Задержка в 10 секунд перед следующей проверкой
end
