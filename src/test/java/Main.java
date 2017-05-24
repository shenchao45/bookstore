import com.shenchao.entity.Book;

import java.sql.Date;

/**
 * Created by shenchao on 17/5/15.
 */
public class Main {

    public static void main(final String[] args) throws Exception {
        Book book = new Book();
        book.setAuthor("沈超");
        book.setDate(new Date(System.currentTimeMillis()));
        book.setIsbn("234r35r143");
        book.setName("java从入门到放弃");
        book.setImageUrl("http://www.baidu.com");
    }
}