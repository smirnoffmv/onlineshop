package com.example.onlineshop.controllers;

import com.example.onlineshop.models.Image;
import com.example.onlineshop.repositories.ImageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import java.io.ByteArrayInputStream;

@RestController // для обработки REST-запросов
@RequiredArgsConstructor // для авто создания конструктора
public class ImageController {
    private final ImageRepository imageRepository; // репозиторий для работы с сущностью Image

    @GetMapping("/images/{id}")
    private ResponseEntity<?> getImageById(@PathVariable Long id) {
        Image image = imageRepository.findById(id).orElse(null); // извлекаем изображение из БД

        // Формирование HTTP-ответа
        return ResponseEntity.ok() // Статус 200 (ОК)
                .header("fileName", image.getOriginalFileName()) // возвращаем заголовок - оригинальное имя файла
                .contentType(MediaType.valueOf(image.getContentType())) // возвращаем тип изображения
                .contentLength(image.getSize()) // возвращаем размер изображения
                .body(new InputStreamResource(new ByteArrayInputStream(image.getBytes()))); // возвращаем тело - массив байтов изображения
    }
}
