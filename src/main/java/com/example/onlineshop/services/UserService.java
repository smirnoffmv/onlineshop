package com.example.onlineshop.services;

import com.example.onlineshop.models.User;
import com.example.onlineshop.models.enums.Role;
import com.example.onlineshop.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;

    // Создание пользователя
    public boolean createUser (User user) {
        String email = user.getEmail();
        if (userRepository.findByEmail(user.getEmail()) != null) return false;
        user.setActive(true);
        user.getRoles().add(Role.ROLE_USER);
        log.info("Новый пользователь создан с email: {}", email);
        return true;
    }
}
