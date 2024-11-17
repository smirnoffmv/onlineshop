package com.example.onlineshop.controllers;

import com.example.onlineshop.models.Product;
import com.example.onlineshop.services.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

// Контроллер ProductController отвечает за отображение главной страницы магазина
@Controller
@RequiredArgsConstructor //те аргументы конструктора которые обязательны они будут прописаны
public class ProductController {
    private final ProductService productService;
    @GetMapping("/") // переход в корень сайта

    public String products(Model model) //для передачи параметров в шаблонизатор
    {
        //передаем список всех товаров
        model.addAttribute("products", productService.listProducts());
        return "products";
    }
    @GetMapping("/product/{id}")
    // метод о просмотре каждого товара
    public String productInfo(@PathVariable Long id, Model model) //принимаем ид товара который хотим просмотреть с помощью аннотации из {id} model для передачи данных текущего товара
    {
        //передаем товар по ид для отображения в продукт инфо
        model.addAttribute("product", productService.getProductById(id));
        return "product-info";
    }
    @PostMapping("/product/create")
    public String createProduct(Product product){
        productService.saveProduct(product);//вызываем метод для добавления товара
        return "redirect:/"; //обновляем страницу
    }

    @PostMapping("/product/delete/{id}")
    public String deleteProduct(@PathVariable Long id) //принимаем ид товара который хотим удалить с помощью аннотации из {id}
    {
        productService.deleteProduct(id);
        return "redirect:/"; //обновляем страницу на гл стр
    }
}
