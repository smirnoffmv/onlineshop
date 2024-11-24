package com.example.onlineshop.services;

import com.example.onlineshop.models.Image;
import com.example.onlineshop.models.Product;
import com.example.onlineshop.repositories.ProductRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
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

    //в список добавляем товар, MultipartFile - для добавления формы загрузки изображений
    public void saveProduct(Product product, MultipartFile file1, MultipartFile file2, MultipartFile file3) throws IOException {
        Image image1;
        Image image2;
        Image image3;
        if (file1.getSize() != 0){
            image1 = toImageEntity(file1);
            image1.setPreviewImage(true);
            product.addImageToProduct(image1);
        }
        if (file2.getSize() != 0){
            image2 = toImageEntity(file2);
            product.addImageToProduct(image2);
        }
        if (file3.getSize() != 0){
            image3 = toImageEntity(file3);
            product.addImageToProduct(image3);
        }

        log.info("Сохранен новый товар, Название: {}; Автор: {}", product.getTitle(), product.getAuthor()); // выводим сообщение о том, что новый товар сохранен
        Product productFromDb = productRepository.save(product);
        productFromDb.setPreviewImageId(productFromDb.getImages().get(0).getId())
        productRepository.save(product);
    }

    private Image toImageEntity(MultipartFile file) throws IOException {
        Image image = new Image();
        image.setName(file.getName());
        image.setOriginalFilename(file.getOriginalFilename());
        image.setContentType(file.getContentType());
        image.setSize(file.getSize());
        image.setBytes(file.getBytes());
        return image;
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
