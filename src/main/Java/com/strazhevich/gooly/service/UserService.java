package com.strazhevich.gooly.service;

import com.strazhevich.gooly.model.Role;
import com.strazhevich.gooly.model.User;

import java.util.List;

public interface UserService {
    void save(User user);
    List<Role> findAll();
    User findByUsername(String username);
}
