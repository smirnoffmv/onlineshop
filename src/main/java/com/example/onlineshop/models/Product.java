package com.example.onlineshop.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity // для эмуляции таблицы из БД
@Table(name = "products") // указываем название таблицы из БД
@AllArgsConstructor // для автоматической генерации конструкторов
@NoArgsConstructor // для генерации конструктора по умолчанию
@Data //для автоматического создания геторов сетеров
public class Product {
    //поля для товаров задаем
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO) // для инкрементации полей

    @Column(name= "id")
    private Long id;

    @Column(name= "title")
    private String title;

    @Column(name= "description", columnDefinition = "text")
    private String description;

    @Column(name= "price")
    private int price;

    @Column(name= "city")
    private String city;

    @Column(name= "author")
    private String author;

}
