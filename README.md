# Forum

Our first forum application built with Ruby on Rails.

## Table of Contents ⚙️

1. [API Documentation](#api-documentation)
2. [Local Development](#local-development-💻)
3. [Diagram](#diagram)
4. [Scripts](#scripts)

## API Documentation

| HTTP-метод                    | Шлях               | Дія                                                          |
|-------------------------------|--------------------|--------------------------------------------------------------|
| GET, POST                     | /admin/login       | Вхід адміністратора.                                         |
| DELETE, GET                   | /admin/logout      | Вихід адміністратора.                                        |
| GET                           | /admin/dashboard   | Відображення панелі керування для адміністратора.            |
| GET, POST, PATCH, PUT, DELETE | /topics            | Створення, відображення, редагування, видалення тем          |
| GET, POST, PATCH, PUT, DELETE | /posts             | Створення, відображення, редагування, видалення постів       |
| GET, POST, PATCH, PUT, DELETE | /admin/users       | Створення, відображення, редагування, видалення користувачів |
| GET                           | /profile           | Відображення профілю активного користувача.                  |
| GET                           | /home              | Відображення домашньої сторінки.                             |
| GET                           | /search_post       | Пошук поста.                                                 |


## Local Development 💻

Here's how you can set up forum in your local dev environment:

**Requirements**

<!-- LIST OF REQUIREMENTS -->

- Ruby >= 3.3.1
<!-- - Docker (for running Postgres, Redis, etc.) 🐳 -->

Ruby is managed using Ruby Version Manager

<!-- <a href="https://github.com/nvm-sh/logos"><img alt="nvm project logo" src="https://raw.githubusercontent.com/nvm-sh/logos/HEAD/nvm-logo-color.svg" height="50" /></a> -->

```bash
# Update ruby version
rvm use <version>
```

**Installation**

<!-- INSTALLATION INSTRUCTIONS -->

Install the required gems by running the following command:

```bash
bundle install
```

To migrate the database, run the following command:

```bash
rails db:migrate
```

To start the server, run the following command:

```bash
rails server
rails s
```

To run the rails console, run the following command:

```bash
rails console
rails c
```

<!-- _Please refer to the package.json for additional details and scripts._ -->

## Diagram

[![diagram.png](https://i.postimg.cc/0QbYBX59/diagram.png)](https://postimg.cc/S2bYXrzP)

## Scripts

| Команда                               | Опис                                                                                           |
|---------------------------------------|------------------------------------------------------------------------------------------------|
| rake db:setup                         | Створює всі бази даних, завантажує всі схеми та ініціалізує їх насіння                        |
| rake importmap:install                | Налаштовує Importmap для додатку                                                                |
| rake stats                            | Звітує про статистику коду (рядки, тощо) з додатку або двигуна                                  |
| rake stimulus:install                 | Встановлює Stimulus у додаток                                                                    |
| rake test                             | Запускає всі тести у папці test, крім системних тестів                                           |
| rake time:zones[country_or_offset]    | Показує всі часові зони, перелічені за дволітерним кодом країни або за UTC зсувом              |
| rake tmp:clear                        | Очищає файли кешу, сокети та скріншоти з tmp/                                                   |
| rake turbo:install                    | Встановлює Turbo у додаток                                                                      |
| rake yarn:install                     | Встановлює всі JavaScript залежності, вказані через Yarn                                        |
| rake db:migrate                       | Мігрує базу даних                                                                               |
| rake db:rollback                      | Повертає схему бази даних до попередньої версії                                                |



