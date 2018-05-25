package com.strazhevich.gooly.service;

import com.strazhevich.gooly.model.Tables;

import java.util.List;

public interface TablesService {
    public Tables getTableByNumber(Integer numberOfTable);
    public List<Tables> listTablesByInstitutionName(String name);
    public void changeTableStatusByTableNumber(Integer tableNumber);
    public void clearTableStatusByTableNumber(Integer tableNumber);
}
