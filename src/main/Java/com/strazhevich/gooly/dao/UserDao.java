package com.strazhevich.gooly.dao;

import com.strazhevich.gooly.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDao extends JpaRepository<User,Integer> {
    User findByUsername(String username);
}
