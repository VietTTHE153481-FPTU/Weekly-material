/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import entity.Blog;
import java.util.ArrayList;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author SAKURA
 */
public class BlogDAOTest {
    
    public BlogDAOTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    @Test
    public void testGetHotBlogs() {
        System.out.println("getHotBlogs");
        BlogDAO instance = new BlogDAO();
        ArrayList<Blog> expResult = new ArrayList<>();
        expResult.add(new Blog(1, "ngoc12", "Review", "Good", "i3sok606d.jpg"));
        expResult.add(new Blog(2, "minh123", "Review", "Good", "i7tsh545i.jpg"));
        expResult.add(new Blog(3, "author_1", "Review", "Good", "i9tsh553i.jpg")); 
        ArrayList<Blog> result = instance.getHotBlogs();
        assertEquals(expResult, result);
        
    }

    @Test
    public void testGetAllBlogs() {
        System.out.println("getAllBlogs");
        BlogDAO instance = new BlogDAO();
        ArrayList<Blog> expResult = new ArrayList<>();
        expResult.add(new Blog(1, "ngoc12", "Review", "Good", "i3sok606d.jpg"));
        expResult.add(new Blog(2, "minh123", "Review", "Good", "i7tsh545i.jpg"));
        expResult.add(new Blog(3, "author_1", "Review", "Good", "i9tsh553i.jpg")); 
        expResult.add(new Blog(4, "author_2", "Review", "Good", "waffleone-shoe.jfif")); 
        ArrayList<Blog> result = instance.getAllBlogs();
        assertEquals(expResult, result);
    }

    @Test
    public void testGetBlogByID3() {
        System.out.println("getBlogByID");
        int id = 3;
        BlogDAO instance = new BlogDAO();
        Blog expResult = new Blog(3, "author_1", "Review", "Good", "i9tsh553i.jpg");
        Blog result = instance.getBlogByID(id);
        assertEquals(expResult, result);
    }
    @Test
    public void testGetBlogByID5() {
        System.out.println("getBlogByID");
        int id = 5;
        BlogDAO instance = new BlogDAO();
        Blog expResult = null;
        Blog result = instance.getBlogByID(id);
        assertEquals(expResult, result);
    }
    @Test
    public void testAddNull() {
        System.out.println("add");
        String author = "";
        String title = "";
        String content = "";
        String imageLink = "";
        BlogDAO instance = new BlogDAO();
        instance.add(author, title, content, imageLink);
    }
    @Test
    public void testAdd() {
        System.out.println("add");
        String author = "TEST";
        String title = "TEST";
        String content = "TEST";
        String imageLink = "TEST.png";
        BlogDAO instance = new BlogDAO();
        instance.add(author, title, content, imageLink);
    }

    @Test
    public void testUpdate3() {
        System.out.println("update");
        String author = "TEST";
        String title = "TEST";
        String content = "TEST";
        String imageLink = "TEST.PNG";
        int id = 1;
        BlogDAO instance = new BlogDAO();
        instance.update(author, title, content, imageLink, id);
    }
    
    @Test
    public void testUpdate5() {
        System.out.println("update");
        String author = "TEST";
        String title = "TEST";
        String content = "TEST";
        String imageLink = "TEST.PNG";
        int id = 5;
        BlogDAO instance = new BlogDAO();
        instance.update(author, title, content, imageLink, id);
    }
    @Test
    public void testDelete3() {
        System.out.println("delete");
        int id = 3;
        BlogDAO instance = new BlogDAO();
        instance.delete(id);
    }
    @Test
    public void testDelete5() {
        System.out.println("delete");
        int id = 5;
        BlogDAO instance = new BlogDAO();
        instance.delete(id);
    }
}
