<!DOCTYPE html>
<html>
<head>
    <title>ONLINESHOP</title>
</head>
<body>
<h1>ONLINESHOP</h1>
<h3>Подробная информация о продавце ${user.name}</h3>
<b>Номер телефона: </b> ${user.phoneNumber}<br>
<h4>Товары продавца ${user.name}</h4>
<#list products as product>
    <div>
        <!-- кнопочка подробнее для перехода используем уникальное поле id -->
        <p><b>${product.title}</b> ${product.price} руб. | <a href="/product/${product.id}">Подробнее</a></p>
    </div>
    <#else>
    <h3>Товаров нет</h3>
</#list>
<#if errorMessage??>
    <h2 style="color: red">${errorMessage}</h2>
</#if>
</body>
</html>