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
        <h4 class="text-center">Подробная информация о товаре</h4>

        <!-- Изображения товара -->
        <div class="row mb-4">
            <#list images as img>
                <div class="col-2">
                    <img src="/images/${img.id}" class="img-fluid" alt="product-image">
                </div>
            </#list>
        </div>

        <!-- Информация о товаре -->
        <div class="product-info">
            <p><strong>Название товара:</strong> ${product.title}</p>
            <p><strong>Описание товара:</strong> ${product.description}</p>
            <p><strong>Цена:</strong> ${product.price} ₽</p>
            <p><strong>Город:</strong> ${product.city}</p>
            <p><strong>Продавец:</strong> <a href="/user/${product.user.id}">${product.user.name}</a></p>
        </div>
        <hr>
    </div>
</body>
</html>
