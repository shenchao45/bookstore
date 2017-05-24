package com.shenchao.controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shenchao.entity.Login;
import com.shenchao.entity.Student;
import com.shenchao.service.BaseService;
import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.Serializable;
import java.util.List;
import java.util.function.Function;

/**
 * Created by shenchao on 17/5/15.
 */
@Controller
@Scope("prototype")
public class LoginController extends ActionSupport implements ModelDriven<Login> {
    @Autowired
    private BaseService baseService;
    private Login login = new Login();
    private String message;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public Login getModel() {
        return login;
    }

    public Login getLogin() {
        return login;
    }

    public void setLogin(Login login) {
        this.login = login;
    }

    public String login() throws IOException {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain; charset=UTF-8");
        Login service = baseService.service(session -> {
            Query<Login> query = session.createQuery("from Login where username = :username and password = :password", Login.class);
            query.setParameter("username", login.getUsername());
            query.setParameter("password", login.getPassword());
            List<Login> resultList = query.getResultList();
            if (resultList == null || resultList.size() == 0) {
                return null;
            }
            return resultList.get(0);
        });
        if (service != null) {
            ActionContext.getContext().getSession().put("user", service);
            response.getWriter().write("success");
        }else{
            response.getWriter().write("fail");
        }
        return null;
    }

    public String register() throws IOException {
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain; charset=UTF-8");
        baseService.service((Function<Session, Serializable>) session -> session.save(login));
        Student student = new Student();
        student.setReaderId(login.getId()+"");
        student.setName(login.getUsername());
        baseService.service((Function<Session, Serializable>) session -> session.save(student));
        response.getWriter().write("success");
        return null;
    }

    public String logout(){
        ActionContext.getContext().getSession().remove("user");
        return SUCCESS;
    }
}
