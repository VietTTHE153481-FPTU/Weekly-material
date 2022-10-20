/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import entity.Category;
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
public class CategoryDAOTest {
    
    public CategoryDAOTest() {
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
    public void testGetAllCategory() {
        System.out.println("getAllCategory");
        CategoryDAO instance = new CategoryDAO();
        ArrayList<Category> expResult = new ArrayList<>();
        expResult.add(new Category(1, "Hat"));
        expResult.add(new Category(2, "Shirt"));
        expResult.add(new Category(3, "Legwear"));
        expResult.add(new Category(4, "Footwear"));
        expResult.add(new Category(5, "Accessories"));
        ArrayList<Category> result = instance.getAllCategory();
        assertEquals(expResult, result);
    }
    
}
