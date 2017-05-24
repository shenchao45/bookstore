package com.shenchao.service;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.function.Consumer;
import java.util.function.Function;

/**
 * Created by shenchao on 17/5/15.
 */
@Service
@Transactional
public class BaseService {
    @Autowired
    private SessionFactory sessionFactory;

    public  <R> R service(Function<Session,R> f){
        Session session = sessionFactory.getCurrentSession();
        R result = f.apply(session);
        return result;
    }
    public void service(Consumer<Session> f){
        Session session = sessionFactory.getCurrentSession();
        f.accept(session);
    }
}
