package com.example.onlineshop.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

// Контроллер ProductController отвечает за отображение главной страницы магазина
@Controller
public class ProductController {
    @GetMapping("/") // переход в корень сайта
    public String products() {
        return "products";
    }
}
