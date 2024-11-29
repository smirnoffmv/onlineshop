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
    <div class="container mt-4">
        <h1 class="text-center">
            <a href="/" class="text-dark text-decoration-none">ONLINESHOP</a>
        </h1>
        <h4 class="text-center mb-4">Регистрация</h4>

        <!-- Форма регистрации с использованием классов Bootstrap -->
        <form action="/registration" method="post" class="needs-validation" novalidate>
            <div class="mb-3">
                <label for="name" class="form-label">Имя пользователя</label>
                <input type="text" name="name" id="name" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="email" class="form-label">Электронная почта</label>
                <input type="email" name="email" id="email" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="phoneNumber" class="form-label">Номер телефона</label>
                <input type="text" name="phoneNumber" id="phoneNumber" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Пароль</label>
                <input type="password" name="password" id="password" class="form-control" required>
            </div>

            <input type="hidden" name="_csrf" value="${_csrf.token}">

            <!-- Кнопка отправки формы -->
            <div class="d-grid gap-2">
                <input type="submit" value="Зарегистрироваться" class="btn btn-primary btn-lg">
            </div>
        </form>

        <!-- Ошибка регистрации (если есть) -->
        <#if errorMessage??>
            <div class="alert alert-danger mt-4" role="alert">
                ${errorMessage}
            </div>
        </#if>
    </div>
</body>
</html>
