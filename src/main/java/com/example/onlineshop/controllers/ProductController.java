package com.example.onlineshop.controllers;

import com.example.onlineshop.models.Product;
import com.example.onlineshop.services.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

// Контроллер ProductController отвечает за отображение главной страницы магазина
@Controller
@RequiredArgsConstructor //те аргументы конструктора которые обязательны они будут прописаны
public class ProductController {
    private final ProductService productService;

    @GetMapping("/") // переход в корень сайта
    // @RequestParam - если title нет, то вернем весь список, иначе вернем отсортированные товары по названию.
    public String products(@RequestParam(name = "title", required = false) String title, Model model) // Для передачи параметров в шаблонизатор
    {
        //передаем список всех товаров
        model.addAttribute("products", productService.listProducts(title));
        return "products";
    }
    @GetMapping("/product/{id}")
    // метод о просмотре каждого товара
    public String productInfo(@PathVariable Long id, Model model) //принимаем ид товара который хотим просмотреть с помощью аннотации из {id} model для передачи данных текущего товара
    {
        Product product = productService.getProductById(id);
        //передаем товар по ид для отображения в продукт инфо
        model.addAttribute("product", product);
        model.addAttribute("images", product.getImages());
        return "product-info";
    }
    @PostMapping("/product/create")
    public String createProduct(@RequestParam("file1") MultipartFile file1, @RequestParam("file2") MultipartFile file2, @RequestParam("file3") MultipartFile file3, Product product) throws IOException {
        productService.saveProduct(product, file1, file2, file3);//вызываем метод для добавления товара
        return "redirect:/"; //обновляем страницу
    }

    @PostMapping("/product/delete/{id}")
    public String deleteProduct(@PathVariable Long id) //принимаем ид товара который хотим удалить с помощью аннотации из {id}
    {
        productService.deleteProduct(id);
        return "redirect:/"; //обновляем страницу на гл стр
    }
}
