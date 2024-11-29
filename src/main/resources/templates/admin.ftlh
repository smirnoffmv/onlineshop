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
        <h4 class="text-center">Панель администратора</h4>
        <!-- Таблица с классами Bootstrap -->
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>Email</th>
                    <th>Номер телефона</th>
                    <th>Активность</th>
                    <th>Роли</th>
                    <th>Бан</th>
                    <th>Удалить пользователя</th>
                    <th>Редактирование</th>
                    <th>Подробная информация</th>
                </tr>
            </thead>
            <tbody>
                <#list users as user>
                    <tr>
                        <td>${user.email}</td>
                        <td>${user.phoneNumber}</td>
                        <td><#if user.active>true<#else>false</#if></td>
                        <td><#list user.roles as role>${role} </#list></td>
                        <td>
                            <form action="/admin/user/ban/${user.id}" method="post">
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <button type="submit" class="btn btn-danger btn-sm">Бан</button>
                            </form>
                        </td>
                        <td>
                            <form action="/admin/user/delete/${user.id}" method="post">
                                <input type="hidden" name="_csrf" value="${_csrf.token}">
                                <div class="d-flex justify-content-center">
                                    <button type="submit" class="btn btn-warning btn-sm">Удалить</button>
                                </div>
                            </form>
                        </td>
                        <td><a href="/admin/user/edit/${user.id}" class="btn btn-primary btn-sm">Редактирование</a></td>
                        <td><a href="/user/${user.id}" class="btn btn-info btn-sm">Подробная информация</a></td>
                    </tr>
                <#else>
                    <tr>
                        <td colspan="8" class="text-center">Пользователей нет</td>
                    </tr>
                </#list>
            </tbody>
        </table>
    </div>
</body>
</html>
