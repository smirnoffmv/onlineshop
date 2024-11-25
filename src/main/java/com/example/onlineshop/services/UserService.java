package com.example.onlineshop.services;

import com.example.onlineshop.models.User;
import com.example.onlineshop.models.enums.Role;
import com.example.onlineshop.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder; // для шифрования пароля

    // Создание пользователя
    public boolean createUser (User user) {
        String email = user.getEmail();
        if (userRepository.findByEmail(user.getEmail()) != null) return false;
        user.setActive(true);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.getRoles().add(Role.ROLE_USER);
        log.info("Новый пользователь создан с email: {}", email);
        userRepository.save(user);
        return true;
    }
}
