package com.shenchao.controller;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.shenchao.entity.Lend;
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
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.function.Consumer;
import java.util.function.Function;

/**
 * Created by shenchao on 17/5/23.
 */
@Controller
@Scope("prototype")
public class LendController extends ActionSupport implements ModelDriven<Lend> {
    @Autowired
    private BaseService baseService;
    private Lend lend = new Lend();

    public Lend getLend() {
        return lend;
    }

    public void setLend(Lend lend) {
        this.lend = lend;
    }

    @Override
    public Lend getModel() {
        return lend;
    }

    public String list(){
        Login login = (Login) ActionContext.getContext().getSession().get("user");
        List<Lend> result = baseService.service(session -> {
            Query<Lend> query = session.createQuery("from Lend as l where l.student.readerId='" + login.getId() + "'", Lend.class);
            return query.getResultList();
        });
        ActionContext.getContext().put("lends",result);
        return SUCCESS;
    }

    public String add() throws IOException {
        Login login = (Login) ActionContext.getContext().getSession().get("user");
        Student student = baseService.service((Function<Session, Student>) session -> session.find(Student.class, login.getId()+""));
        lend.setStudent(student);
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Date());
        calendar.add(Calendar.MONTH, 1);
        lend.setBorrowDate(new java.sql.Date(calendar.getTime().getTime()));
        calendar.add(Calendar.MONTH,1);
        lend.setEndDate(new java.sql.Date(calendar.getTime().getTime()));
        baseService.service((Consumer<Session>) session -> session.save(lend));
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain; charset=UTF-8");
        response.getWriter().write("success");
        return null;
    }

    public String delete() throws IOException {
        baseService.service((Consumer<Session>) session -> session.delete(session.find(Lend.class,lend.getId())));
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain; charset=UTF-8");
        response.getWriter().write("success");
        return null;
    }

    public String delay() throws IOException {
        Lend lend = baseService.service((Function<Session, Lend>) session -> session.find(Lend.class, this.lend.getId()));
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(lend.getEndDate());
        calendar.add(Calendar.MONTH,1);
        lend.setEndDate(new java.sql.Date(calendar.getTime().getTime()));
        baseService.service((Consumer<Session>) session -> session.update(lend));
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/plain; charset=UTF-8");
        response.getWriter().write("success");
        return null;
    }

}
