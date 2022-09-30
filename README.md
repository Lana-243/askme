# AskMe
Это сайт для вопросов и ответов, аналог 'AskFm'.

## Как работает

Вы можете задавать вопросы другим пользователям и отвечать на вопросы других участников, заданных вам.

Для анонимных вопросов регистрация не требуется

Регистрация позволит:

* Получать вопросы от других пользователей
* Отвечать от своего лица, а не анонимно

## Пример

https://askme-app-243.herokuapp.com/

## Что требуется сделать, чтобы запустить приложение:

### Склонировать репозиторий

В терминале пройти в папку, куда хотите сохранить приложение и внесите код:

```
git clone https://github.com/Lana-243/askme.git
```

```
cd askme
```

### Внести ключи reCAPTCHA

Далее необходимо внести ключи для приложения.

Так как в AskMe используется reCAPTCHA2, вам потребуется зарегистрироваться в сервисе и получить secret и public ключи.

Ссылка на доки: https://cloud.google.com/recaptcha-enterprise/docs/create-key

Полученные данные вносим в файл credentials (nano можете заменить на любой редактор, например, vim) и сохраняем.

```
EDITOR=nano rails credentials:edit
```
Добавляем в файл строки:
```
recaptcha_askme_public_key: "ваш ключ"
recaptcha_askme_private_key: "ваш ключ"
```

### Подгрузить библиотеки

```
bundle install
```

### Прогнать миграции

```
bundle exec rails db:migrate
```

### Объединить стили

```
yarn install
```
```
yarn build
```
```
yarn build:css
```

### Запустить приложение!

```
rails s
```
