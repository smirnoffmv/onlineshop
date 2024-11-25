package com.example.onlineshop.repositories;

import com.example.onlineshop.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email); // для поиска пользователя по его email
}
