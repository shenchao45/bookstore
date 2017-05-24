package com.shenchao.controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shenchao.entity.Book;
import com.shenchao.service.BaseService;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.function.Consumer;
import java.util.function.Function;

/**
 * Created by shenchao on 17/5/15.
 */
@Controller
@Scope("prototype")
public class BookController extends ActionSupport implements ModelDriven<Book> {
    @Autowired
    private BaseService baseService;
    private Book book = new Book();

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    @Override
    public Book getModel() {
        return book;
    }

    public String add() throws IOException {
        baseService.service((Consumer<Session>) session -> session.save(book));
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain; charset=UTF-8");
        response.getWriter().write("success");
        return null;
    }

    public String list(){
        List<Book> service = baseService.service((Function<Session, List<Book>>) session -> session.createQuery("from Book", Book.class).getResultList());
        ActionContext.getContext().put("books", service);
        return "list";
    }

    public String update() throws IOException {
        baseService.service(session -> {
            Book result = session.find(Book.class, this.book.getIsbn());
            result.setName(book.getName());
            result.setDate(book.getDate());
            result.setAuthor(book.getAuthor());
            session.update(result);
        });
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain; charset=UTF-8");
        response.getWriter().write("success");
        return null;
    }

    public String delete(){
        baseService.service((Consumer<Session>)session->{
            Book book = session.find(Book.class, this.book.getIsbn());
            session.delete(book);
            System.out.println("ok");
        });
        return "toList";
    }

    public String toQuery(){
        List<Book> service = baseService.service((Function<Session, List<Book>>) session -> {
            Query<Book> query1 = session.createQuery("from Book where author like :author or name like :name or isbn like:isbn", Book.class);
            query1.setParameter("author", "%" + getQuery().trim() + "%");
            query1.setParameter("name", "%" + getQuery().trim() + "%");
            query1.setParameter("isbn", "%" + getQuery().trim() + "%");
            return query1.getResultList();
        });
        ActionContext.getContext().put("books", service);
        return "list";
    }
    private String query;

    public String getQuery() {
        if (query == null) {
            query = "";
        }
        return query;
    }

    public void setQuery(String query) {
        this.query = query;
    }
}
