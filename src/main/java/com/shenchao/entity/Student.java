package com.shenchao.entity;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.io.Serializable;
import java.sql.Date;
import java.util.Arrays;

/**
 * Created by shenchao on 17/5/15.
 */
@Entity
public class Student implements Serializable {
    @Id
    @GeneratedValue(generator = "a")
    @GenericGenerator(name = "a",strategy = "assigned")
    private String readerId;
    private String name;
    private String spec;
    private Byte sex;
    private Date born;
    private Integer num;
    private byte[] photo;


    public String getReaderId() {
        return readerId;
    }

    public void setReaderId(String readerId) {
        this.readerId = readerId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSpec() {
        return spec;
    }

    public void setSpec(String spec) {
        this.spec = spec;
    }

    public Byte getSex() {
        return sex;
    }

    public void setSex(Byte sex) {
        this.sex = sex;
    }

    public Date getBorn() {
        return born;
    }

    public void setBorn(Date born) {
        this.born = born;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }

    @Override
    public String toString() {
        return "Student{" +
                "readerId='" + readerId + '\'' +
                ", name='" + name + '\'' +
                ", spec='" + spec + '\'' +
                ", sex=" + sex +
                ", born=" + born +
                ", num=" + num +
                ", photo=" + Arrays.toString(photo) +
                '}';
    }
}
