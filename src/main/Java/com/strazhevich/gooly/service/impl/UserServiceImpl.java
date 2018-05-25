package com.strazhevich.gooly.service.impl;

import com.strazhevich.gooly.dao.JpaRepositoryInterfaces.RoleDao;
import com.strazhevich.gooly.dao.JpaRepositoryInterfaces.UserDao;
import com.strazhevich.gooly.model.Role;
import com.strazhevich.gooly.model.User;
import com.strazhevich.gooly.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private RoleDao roleDao;
    @Autowired
    private UserDao userDao;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        Set<Role> roles = new HashSet<>();
        roles.add(roleDao.getOne(1));
        user.setRoles(roles);
        userDao.save(user);
    }

    @Override
    public List<Role> findAll() {
        return roleDao.findAll();
    }

    @Override
    public User findByUsername(String username) {
        return userDao.findByUsername(username);
    }
}
