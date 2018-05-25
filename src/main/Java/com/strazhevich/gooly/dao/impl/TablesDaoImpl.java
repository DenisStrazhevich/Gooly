package com.strazhevich.gooly.dao.impl;

import com.strazhevich.gooly.dao.TablesDao;
import com.strazhevich.gooly.model.Institution;
import com.strazhevich.gooly.model.Tables;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Repository
@Transactional
public class TablesDaoImpl implements TablesDao{

    private SessionFactory sessionFactory;
    @Autowired
    public TablesDaoImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    private Session currentSession(){
        return sessionFactory.getCurrentSession();
    }

    @Override
    public Tables getTableByNumber(Integer numberOfTable) {
        Tables table = (Tables) currentSession().load(Tables.class,numberOfTable);
        return table;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Tables> listTablesByInstitutionName(String name) {
        Query query = currentSession().createQuery("select t from Tables t inner join t.institution where t.institution.name = :name");
        query.setParameter("name",name);
        List<Tables> list = query.list();

        return list;


    }

    @Override
    public void changeTableStatusByTableNumber(Integer tableNumber) {

        Query query = currentSession().createQuery("update Tables set status =:busy where numberOfTable =:tableNumber");
        query.setParameter("busy","недоступен");
        query.setParameter("tableNumber",tableNumber);
        query.executeUpdate();

    }

    @Override
    public void clearTableStatusByTableNumber(Integer tableNumber) {
        Query query = currentSession().createQuery("update Tables set status =:busy where numberOfTable =:tableNumber");
        query.setParameter("busy","свободный");
        query.setParameter("tableNumber",tableNumber);
        query.executeUpdate();
    }

}
