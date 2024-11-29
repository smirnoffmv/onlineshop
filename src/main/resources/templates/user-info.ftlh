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
        <h3 class="text-center">Подробная информация о продавце ${user.name}</h3>

        <p><b>Номер телефона:</b> ${user.phoneNumber}</p>

        <h4 class="mt-4">Товары продавца ${user.name}</h4>

        <div class="list-group">
            <#list products as product>
                <div class="list-group-item d-flex justify-content-between align-items-center">
                    <span><b>${product.title}</b> - ${product.price} руб.</span>
                    <a href="/product/${product.id}" class="btn btn-info btn-sm">Подробнее</a>
                </div>
            <#else>
                <div class="alert alert-warning">Товаров нет</div>
            </#list>
        </div>

        <#if errorMessage??>
            <div class="alert alert-danger mt-4">
                <h2>${errorMessage}</h2>
            </div>
        </#if>
    </div>
</body>
</html>
