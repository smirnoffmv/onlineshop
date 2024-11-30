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
        <hr>
        <!-- Профиль пользователя -->
        <#if user.email??>
            <h3>Имя пользователя: <i>${user.name}</i></h3>
            <form action="/logout" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit" class="btn btn-danger btn-sm">Выйти из аккаунта</button>
            </form>

            <!-- Панель администратора, если пользователь администратор -->
            <#if user.isAdmin()>
                <a href="/admin" class="btn btn-primary btn-sm mt-2">Панель администратора</a>
            </#if>
        <#else>
            <a href="/login" class="btn btn-success btn-sm">Войти</a>
        </#if>

        <hr>

        <!-- Форма поиска товаров -->
        <h4>Товары со всей России</h4>
        <form action="/" method="get" class="mb-4">
            <div class="mb-3">
                <label for="title" class="form-label">Поиск по названию объявления:</label>
                <input type="text" name="title" class="form-control" id="title">
            </div>
            <button type="submit" class="btn btn-primary">Поиск</button>
        </form>

        <!-- Список товаров -->
        <div class="list-group">
           <#list products as product>
               <div class="list-group-item">
                   <div class="d-flex align-items-center justify-content-between">
                       <p class="mb-0"><b>${product.title}</b> - ${product.price} руб.</p>
                       <div class="d-flex align-items-center gap-2">
                           <!-- Кнопка Подробнее -->
                           <a href="/product/${product.id}" class="btn btn-info btn-sm">Подробнее</a>

                           <!-- Удалить товар, если пользователь - владелец товара или администратор -->
                           <#if user.email??>
                               <#if user.isAdmin() || (user.id == product.user.id)>
                                   <form action="/product/delete/${product.id}" method="post">
                                       <input type="hidden" name="_csrf" value="${_csrf.token}">
                                       <button type="submit" class="btn btn-danger btn-sm">Удалить товар</button>
                                   </form>
                               </#if>
                           </#if>
                       </div>
                   </div>
               </div>
           <#else>
               <p class="text-center">Товаров нет</p>
           </#list>
        </div>

        <!-- Форма создания товара, если пользователь авторизован -->
        <#if user.email??>
            <hr>
            <h3>Создать новый товар</h3>
            <form action="/product/create" method="post" enctype="multipart/form-data">
                <div class="mb-3">
                    <label for="title" class="form-label">Название товара:</label>
                    <input type="text" name="title" class="form-control" id="title" required>
                </div>
                <div class="mb-3">
                    <label for="description" class="form-label">Описание товара:</label>
                    <input type="text" name="description" class="form-control" id="description" required>
                </div>
                <div class="mb-3">
                    <label for="price" class="form-label">Цена товара:</label>
                    <input type="number" name="price" class="form-control" id="price" min="0" required>
                </div>
                <div class="mb-3">
                    <label for="city" class="form-label">Город:</label>
                    <input type="text" name="city" class="form-control" id="city" required>
                </div>
                <div class="mb-3">
                    <label for="file1" class="form-label">1 фотография:</label>
                    <input type="file" name="file1" class="form-control" id="file1">
                </div>
                <div class="mb-3">
                    <label for="file2" class="form-label">2 фотография:</label>
                    <input type="file" name="file2" class="form-control" id="file2">
                </div>
                <div class="mb-3">
                    <label for="file3" class="form-label">3 фотография:</label>
                    <input type="file" name="file3" class="form-control" id="file3">
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit" class="btn btn-success">Добавить товар</button>
            </form>
        </#if>
    </div>
</body>
</html>
