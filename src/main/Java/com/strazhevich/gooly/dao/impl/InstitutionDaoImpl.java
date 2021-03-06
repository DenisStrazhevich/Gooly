package com.strazhevich.gooly.dao.impl;

import com.strazhevich.gooly.dao.InstitutionDao;
import com.strazhevich.gooly.model.Institution;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import java.io.UnsupportedEncodingException;
import java.util.List;
@Repository
public class InstitutionDaoImpl implements InstitutionDao {

    private SessionFactory sessionFactory;
    @Autowired
    public InstitutionDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session currentSession(){
        return sessionFactory.getCurrentSession();
    }



    @Override
    @SuppressWarnings("unchecked")
    public List<Institution> listOfInstitutions(String kind) {

        Query query = currentSession().createQuery("from Institution where kind LIKE :kind");
        query.setParameter("kind",kind);

        List<Institution> list = query.list();
        return list;
    }

    @Override
    public Institution getInstitutionByName(String name) {
        Query query = currentSession().createQuery("from Institution where name =:name");
        query.setParameter("name",name);
        Institution institution = (Institution) query.uniqueResult();
        return institution;
    }


    @Override
    @SuppressWarnings("unchecked")
    public List<Institution> getByName(String name) {

        Query query = currentSession().createQuery("from Institution where name LIKE :name or kind like :name or address like :name");
        query.setParameter("name",name);
        List<Institution> list = query.list();

        return list;
    }

}

