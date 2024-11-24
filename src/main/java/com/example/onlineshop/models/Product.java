package com.example.onlineshop.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

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

    // cascade - при действии с сущностью Product удаляем все фотографии;
    // fetch - для того, чтобы загружать не все фото, а только её preview;
    // mappedBy - для создания связи по foreign key product
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "product")
    private List<Image> images = new ArrayList<>();
    private Long previewImageId;
    private LocalDateTime dateOfCreated;

    @PrePersist // для инициализации переменной dateOfCreated и перед сохранением записи в БД
    private void init() {
        dateOfCreated = LocalDateTime.now();
    }

    public void addImageToProduct(Image image) {
        image.setProduct(this);
        images.add(image);
    }
}
