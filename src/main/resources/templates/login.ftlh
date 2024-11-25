<!DOCTYPE html>
<html>
<head>
    <title>ONLINESHOP</title>
</head>
<body>
<h1>ONLINESHOP</h1>
<h4>Аутентификация</h4>
<form action="/login" method="post">
    Электронная почта: <input type="email" name="username"><br><br>
    Пароль: <input type="password" name="password"><br><br>
    <input type="hidden" name="_csrf" value="${_csrf.token}">
    <input type="submit" value="Вход"/>
</form>
<a href="/registration">Зарегистрироваться</a>
</body>
</html>