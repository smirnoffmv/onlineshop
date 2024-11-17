<!DOCTYPE html>
<html>
<head>
    <title>Onlineshop</title>
</head>
<body>
<h1>Onlineshop</h1><hr>
<h4>Подробная информация о товаре</h4>
<b>Название товара: </b> ${product.title}<br>
<b>Описание товара:</b> ${product.description}<br>
<b>Цена:</b> ${product.price} ₽<br>
<b>Город:</b> ${product.city}<br>
<b>Продавец:</b> ${product.author}<br>
<hr>
<form action="/product/delete/${product.id}" method="post">
    <input type="submit" value="Удалить товар">
</body>
</html>