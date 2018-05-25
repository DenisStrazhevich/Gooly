package com.strazhevich.gooly.service;

import com.strazhevich.gooly.model.Institution;

import java.util.List;

public interface InstitutionService {
    //public List<Institution> listOfInstitutions();
    public List<Institution> listOfInstitutions(String kind);
    public Institution getInstitutionByName(String name);
    public List<Institution> getByName(String name);
}
