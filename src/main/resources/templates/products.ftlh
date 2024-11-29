<!DOCTYPE html>
<html>
<head>
    <title>ONLINESHOP</title>
</head>
<body>
<h1>ONLINESHOP</h1><hr>
<#if user.email??>
    <h3>Имя пользователя: <i>${user.name}</i></h3>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Выйти из аккаунта">
    </form>
    <#if user.isAdmin()>
        <a href=/admin>Панель администратора</a>
    </#if>
    <#else>
     <a href="/login">Войти</a></h1>
</#if>

<hr>

<h4>Товары со всей России</h4>
<form action="/" method="get">
    Поиск по названию объявления: <input type="text" name="title"><br>
    <input type="submit" value="Поиск"/>
</form>
<#list products as product>
<div>
    <!-- кнопочка подробнее для перехода используем уникальное поле id -->
    <p><b>${product.title}</b> ${product.price} руб. | <a href="/product/${product.id}">Подробнее</a></p>
</div>
<#else>
<h3>Товаров нет</h3>
</#list>
<#if user.email??>
<hr>
<h3>Создать новый товар</h3>
<form action="/product/create" method="post" enctype="multipart/form-data">
    Название товара: <input type="text" name="title"/><br><br>
    Описание товара: <input type="text" name="description"/><br><br>
    Цена товара: <input type="number" name="price" min="0"/><br><br>
    Город: <input type="text" name="city"/><br><br>
    1 фотография: <input type="file" name="file1"/><br><br>
    2 фотография: <input type="file" name="file2"/><br><br>
    3 фотография: <input type="file" name="file3"/><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Добавить товар">
</form>
</#if>
</body>
</html>
