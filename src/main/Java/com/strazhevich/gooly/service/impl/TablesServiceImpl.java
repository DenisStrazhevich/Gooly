package com.strazhevich.gooly.service.impl;

import com.strazhevich.gooly.dao.TablesDao;
import com.strazhevich.gooly.model.Tables;
import com.strazhevich.gooly.service.TablesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class TablesServiceImpl implements TablesService {
    @Autowired
    private TablesDao tablesDao;
    
    @Override
    @Transactional
    public Tables getTableByNumber(Integer numberOfTable) {
        return tablesDao.getTableByNumber(numberOfTable);
    }

    @Override
    @Transactional
    public List<Tables> listTablesByInstitutionName(String name) {
        return tablesDao.listTablesByInstitutionName(name);
    }

    @Override
    @Transactional
    public void changeTableStatusByTableNumber(Integer tableNumber) {
        tablesDao.changeTableStatusByTableNumber(tableNumber);
    }

    @Override
    @Transactional
    public void clearTableStatusByTableNumber(Integer tableNumber) {
        tablesDao.clearTableStatusByTableNumber(tableNumber);
    }


}
