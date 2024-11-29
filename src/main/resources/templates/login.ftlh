<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ONLINESHOP</title>
    <!-- Подключение Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">
            <a href="/" class="text-dark text-decoration-none">ONLINESHOP</a>
        </h1>
        <h4 class="text-center">Аутентификация</h4>

        <!-- Форма для логина -->
        <form action="/login" method="post" class="w-50 mx-auto">
            <div class="mb-3">
                <label for="username" class="form-label">Электронная почта:</label>
                <input type="email" name="username" id="username" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Пароль:</label>
                <input type="password" name="password" id="password" class="form-control" required>
            </div>

            <input type="hidden" name="_csrf" value="${_csrf.token}">

            <button type="submit" class="btn btn-primary w-100">Вход</button>
        </form>

        <div class="text-center mt-3">
            <a href="/registration" class="btn btn-link">Зарегистрироваться</a>
        </div>
    </div>
</body>
</html>
