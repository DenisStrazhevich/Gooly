package com.strazhevich.gooly.service.impl;

import com.strazhevich.gooly.dao.InstitutionDao;
import com.strazhevich.gooly.model.Institution;
import com.strazhevich.gooly.service.InstitutionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
public class InstitutionServiceImpl implements InstitutionService {

    @Autowired
    private InstitutionDao institutionDao;

    @Override
    @Transactional
    public List<Institution> listOfInstitutions(String kind) {
        return institutionDao.listOfInstitutions(kind);
    }

    @Override
    @Transactional
    public Institution getInstitutionByName(String name) {
        return institutionDao.getInstitutionByName(name);
    }

    @Override
    @Transactional
    public List<Institution> getByName(String name) {
        return institutionDao.getByName(name);
    }
}
