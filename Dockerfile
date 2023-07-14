# Используйте образ Ruby в качестве базового образа
FROM ruby:3.0.2

# Установка зависимостей для приложения
RUN apt-get update -qq && apt-get install -y build-essential nodejs

# Создание пользователя "app" в контейнере
RUN useradd -ms /bin/bash app

WORKDIR /app

# Копирование Gemfile и Gemfile.lock в контейнер
COPY Gemfile Gemfile.lock ./

RUN bundle install

# Копирование всего приложения в контейнер
COPY . .

# Назначение владельца приложения на пользователя "app"
RUN chown -R app:app /app

# Установка правильных прав на директорию приложения
RUN chmod -R 755 /app

USER app

CMD rails server -b 0.0.0.0

