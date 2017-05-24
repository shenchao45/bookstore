package com.shenchao.entity;

import javax.persistence.*;
import java.sql.Date;

/**
 * Created by shenchao on 17/5/15.
 */
@Entity
public class Lend {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;
    @ManyToOne
    @JoinColumn(name = "studentId")
    private Student student;
    @ManyToOne
    @JoinColumn(name = "bookId")
    private Book book;
    private Date borrowDate;
    private Date endDate;


    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public Date getBorrowDate() {
        return borrowDate;
    }

    public void setBorrowDate(Date borrowDate) {
        this.borrowDate = borrowDate;
    }

    @Override
    public String toString() {
        return "Lend{" +
                "id=" + id +
                ", student=" + student +
                ", book=" + book +
                ", borrowDate=" + borrowDate +
                '}';
    }
}
