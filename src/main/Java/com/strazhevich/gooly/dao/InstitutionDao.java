package com.strazhevich.gooly.dao;

import com.strazhevich.gooly.model.Institution;

import java.util.List;

public interface InstitutionDao {
    //public List<Institution> listOfInstitutions();
    public List<Institution> listOfInstitutions(String kind);
    public List<Institution> getByName(String name);
}
