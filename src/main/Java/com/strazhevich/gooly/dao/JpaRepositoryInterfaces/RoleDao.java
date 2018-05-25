package com.strazhevich.gooly.dao.JpaRepositoryInterfaces;

import com.strazhevich.gooly.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RoleDao extends JpaRepository<Role,Integer>{
    List<Role> findAll();
}
