package com.shenchao.util;

import com.shenchao.entity.Book;
import com.shenchao.entity.Lend;
import com.shenchao.entity.Login;
import com.shenchao.entity.Student;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.Arrays;


/**
 * Created by shenchao on 17/5/15.
 */
public class SessionFactoryUtil {
    private SessionFactoryUtil(){}
    static {
        final Configuration configuration = new Configuration();
        configuration.configure();
        Arrays.asList(Student.class,Book.class,Login.class,Lend.class).stream().forEach(i->configuration.addAnnotatedClass(i));
        sessionFactory = configuration.buildSessionFactory();
    }
    private static final SessionFactory sessionFactory;


    public static Session getSession(){
        return sessionFactory.openSession();
    }
}
