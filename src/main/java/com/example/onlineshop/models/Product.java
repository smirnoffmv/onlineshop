package com.example.onlineshop.models;

import lombok.AllArgsConstructor;
import lombok.Data;


@AllArgsConstructor
@Data //для автоматического создания геторов сеторов
public class Product {
    //поля для товаров задаем
    private Long id;
    private String title;
    private String description;
    private int price;
    private String city;
    private String author;

}
