package com.example.onlineshop.services;

import com.example.onlineshop.models.Product;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ProductService { //сервис для работы с товарами
    private List<Product> products = new ArrayList<>(); // список товаров для хранения в памяти
    private long ID = 0;
    {
        products.add(new Product(
                ++ID,
                "Смартфон Samsung Galaxy S21",
                "Мощный смартфон с ярким AMOLED экраном 6.2 дюйма, 8 ГБ оперативной памяти и тройной камерой 64 МП.",
                69990,
                "Москва",
                "ООО Электроника"
        ));

        products.add(new Product(
                ++ID,
                "Ноутбук ASUS VivoBook 15",
                "Универсальный ноутбук с процессором Intel Core i5, 8 ГБ оперативной памяти и SSD 512 ГБ, экраном 15.6 дюймов.",
                55990,
                "Санкт-Петербург",
                "ТехноМаркет"
        ));

        products.add(new Product(
                ++ID,
                "Наушники Sony WH-1000XM4",
                "Беспроводные наушники с активным шумоподавлением, до 30 часов работы и поддержкой Bluetooth 5.0.",
                23990,
                "Новосибирск",
                "АудиоМир"
        ));

        products.add(new Product(
                ++ID,
                "Смарт-часы Apple Watch Series 7",
                "Функциональные смарт-часы с датчиком кислорода в крови, водонепроницаемостью и экраном Retina 1.69 дюйма.",
                39990,
                "Екатеринбург",
                "Apple Store"
        ));

        products.add(new Product(
                ++ID,
                "Электросамокат Xiaomi Mi Scooter Pro 2",
                "Электросамокат с запасом хода до 45 км, скоростью до 25 км/ч и поддержкой Bluetooth для подключения к приложению.",
                32990,
                "Казань",
                "ЭкоТранспорт"
        ));
}
    //метод для получения листа товаров
    public  List<Product> listProducts() { return products;}

    //в список добавляем товар
    public void  saveProduct(Product product){
        product.setId(++ID); //каждый раз добавляем id чтоб был уникальный
        products.add(product);
    }

    //удаление товара по id
    public void deleteProduct(Long id)  {
        products.removeIf(product -> product.getId().equals(id));
    }

    //поиск товара по id
    public Product getProductById(Long id) {
        for (Product product : products) {
            if (product.getId().equals(id)) return product;
        }
        return null;
    }
}
