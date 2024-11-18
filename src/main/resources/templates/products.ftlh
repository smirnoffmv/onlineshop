<!DOCTYPE html>
<html>
<head>
    <title>Onlineshop</title>
</head>
<body>
<h1>Onlineshop</h1><hr>
<h4>Товары со всей России</h4>
<form action="/" method="get">
    Поиск по названию объявления: <input type="text" name="title"><br>
    <input type="submit" value="Поиск"/>
</form>
<#-- цикл -->
<#list products as product>
    <div>
        <#-- кнопочка подробнее для перехода используем уникальное поле id-->
        <p><b>${product.title}</b> ${product.price} руб. | <a href="/product/${product.id}">Подробнее</a></p>
    </div>
    <#else>
    <h3>Товаров нет</h3>
</#list>
<hr>
<h3>Создать новый товар</h3>
<form action="/product/create" method="post">
    Название товара: <input type="text" name="title"><br><br>
    Описание товара: <input type="text" name="description"><br><br>
    Цена товара: <input type="number" name="price" min="0"><br><br>
    Город: <input type="text" name="city"><br><br>
    Продавец: <input type="text" name="author"><br><br>
    <input type="submit" value="Добавить товар">
</body>
</html>