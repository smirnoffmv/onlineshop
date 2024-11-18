package com.example.onlineshop.services;

import com.example.onlineshop.models.Product;
import com.example.onlineshop.repositories.ProductRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j // для логирования
@RequiredArgsConstructor
public class ProductService { //сервис для работы с товарами
    private final ProductRepository productRepository;

    //метод для получения листа товаров
    public List<Product> listProducts(String title) {
        if (title != null)
        {
            return productRepository.findByTitle(title); // если не равно null, вернем товары по названию
        }
        else {
            return productRepository.findAll(); // иначе список всех товаров
        }
    }

    //в список добавляем товар
    public void saveProduct(Product product){
        log.info("Сохранен новый {}", product); // выводим сообщение о том, что новый товар сохранен
        productRepository.save(product);
    }

    //удаление товара по id
    public void deleteProduct(Long id)  {
        productRepository.deleteById(id);
    }

    //поиск товара по id
    public Product getProductById(Long id) {
        return productRepository.findById(id).orElse(null); // если товар с соответствующим ID не найден, то вернем null, иначе вернем товар
    }
}
