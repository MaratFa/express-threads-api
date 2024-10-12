# Используем образ линукс Alpine с версией node 20
FROM node:20.9.0-alpine

# Указываем нашу рабочую директорию
WORKDIR /app

# Скопировать package.json и package-lock.json внутрь контейнеров
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем оставшееся приложение в контейнер
COPY . .

# Установить Prisma
RUN npm install -g prisma

# Генерируем Prisma client
RUN prisma generate

# Копируем Prisma shema
COPY prisma/schema.prisma ./prisma/

# Открыть порт в нашем контейнере
EXPOSE 3000

# Запускаем наш сервер