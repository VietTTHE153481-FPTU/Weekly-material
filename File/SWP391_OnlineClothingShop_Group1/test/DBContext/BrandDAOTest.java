/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import entity.Brand;
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
public class BrandDAOTest {
    
    public BrandDAOTest() {
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
    public void testGetAllBrand() {
        System.out.println("getAllBrand");
        BrandDAO instance = new BrandDAO();
        ArrayList<Brand> expResult = new ArrayList<>();
        expResult.add(new Brand(1, "Borsalino"));
        expResult.add(new Brand(2, "Bailey"));
        expResult.add(new Brand(3, "Mayser"));
        expResult.add(new Brand(4, "Tokyo Life"));
        expResult.add(new Brand(5, "Zombie"));
        ArrayList<Brand> result = instance.getAllBrand();
        assertEquals(expResult,result);
    }
    
}
