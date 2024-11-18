package com.example.onlineshop.repositories;

import com.example.onlineshop.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

// Чтобы не прописывать свою логику взаимодействия с БД наследуемся от JpaRepository
public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> findByTitle(String title); // вернет список всех товаров по названию
}
