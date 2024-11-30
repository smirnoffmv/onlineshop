<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ONLINESHOP</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Выравнивание контейнера с чекбоксами по центру */
        .checkbox-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
    </style>
</head>
<body>
    <div class="container mt-4">
        <h1 class="text-center">
            <a href="/" class="text-dark text-decoration-none">ONLINESHOP</a>
        </h1>
        <h3 class="text-center">Редактирование пользователя ${user.name}</h3>

        <!-- Форма редактирования пользователя -->
        <form action="/admin/user/edit" method="post" class="d-flex flex-column align-items-center">
            <div class="form-group">
                <label for="roles" class="form-label text-center">Роли пользователя:</label>
                <div class="checkbox-container">
                    <#list roles as role>
                        <div class="form-check">
                            <input
                                class="form-check-input role-checkbox"
                                type="checkbox"
                                name="${role}"
                                id="role-${role}"
                                ${user.roles?seq_contains(role)?string("checked", "")}>
                            <label class="form-check-label" for="role-${role}">
                                ${role}
                            </label>
                        </div>
                    </#list>
                </div>
            </div>

            <input type="hidden" value="${user.id}" name="userId">
            <input type="hidden" value="${_csrf.token}" name="_csrf">

            <button type="submit" class="btn btn-primary mt-3">Сохранить</button>
        </form>
    </div>

    <script>
        // Получаем все чекбоксы с классом role-checkbox
        const checkboxes = document.querySelectorAll('.role-checkbox');

        checkboxes.forEach(checkbox => {
            checkbox.addEventListener('click', () => {
                // При выборе чекбокса снимаем выбор с остальных
                checkboxes.forEach(box => {
                    if (box !== checkbox) {
                        box.checked = false;
                    }
                });
            });
        });
    </script>
</body>
</html>
