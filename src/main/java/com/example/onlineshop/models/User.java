package com.example.onlineshop.models;

import com.example.onlineshop.models.enums.Role;
import jakarta.persistence.*;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.time.LocalDateTime;
import java.util.*;

@Entity
@Table(name = "users")
@Data
// Класс User - для Spring Security
public class User implements UserDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;
    @Column(name = "email", unique = true)
    private String email; // будет username для входа в программу
    @Column(name = "phone_number")
    private String phoneNumber;
    @Column(name = "name")
    private String name;
    @Column(name = "active")
    private boolean isActive; // true - пользователь активный (то есть подтвердил почту)
    @OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "image_id")
    private Image avatar;
    @Column(name = "password", length = 1000)
    private String password;
    @ElementCollection(targetClass = Role.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id")) // первичный ключ = user_id, значение - user_role
    @Enumerated(EnumType.STRING)
    private Set<Role> roles = new HashSet<>();
    @OneToMany(cascade = CascadeType.ALL, fetch= FetchType.EAGER, mappedBy = "user")
    private List<Product> products = new ArrayList<>();
    private LocalDateTime dateOfCreated;

    @PrePersist
    private void init() {
        dateOfCreated = LocalDateTime.now();
    }

    public boolean isAdmin() {return roles.contains(Role.ROLE_ADMIN);}
    // Конфигурирование Spring Security
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return roles;
    }

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return isActive;
    }
}
