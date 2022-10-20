/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import entity.Cart;
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
public class CartDAOTest {
    
    public CartDAOTest() {
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
    public void testGetCart5() {
        System.out.println("getCart");
        int id = 5;
        CartDAO instance = new CartDAO();
        ArrayList<Cart> expResult = new ArrayList<>();
        expResult.add(new Cart(1,"Borsalino Bogart Fur Felt Fedora", 1,7400000, "Borsalino-Bogart.jpg"));
        expResult.add(new Cart(2,"Borsalino Seta Bicolore Fedora", 1,5700000, "390310-Brosalino-Hats-Brown.jpg"));
        ArrayList<Cart> result = instance.getCart(id);
        assertEquals(expResult, result);
    }
    @Test
    public void testGetCart101() {
        System.out.println("getCart");
        int id = 101;
        CartDAO instance = new CartDAO();
        ArrayList<Cart> expResult = new ArrayList<>();
        ArrayList<Cart> result = instance.getCart(id);
        assertEquals(expResult, result);
        //fail("The test case is a prototype.");
    }
    @Test
    public void atestGetCartAmount5() {
        System.out.println("getCartAmount");
        int id = 5;
        CartDAO instance = new CartDAO();
        int expResult = 2;
        int result = instance.getCartAmount(id);
        assertEquals(expResult, result);
    }
    @Test
    public void testGetCartAmount101() {
        System.out.println("getCartAmount");
        int id = 101;
        CartDAO instance = new CartDAO();
        int expResult = 0;
        int result = instance.getCartAmount(id);
        assertEquals(expResult, result);
    }
    @Test
    public void testValidCart() {
        System.out.println("validCart");
        CartDAO instance = new CartDAO();
        instance.validCart();
    }
    @Test
    public void testPlusCart() {
        System.out.println("plusCart");
        int id = 5;
        int productId = 1;
        CartDAO instance = new CartDAO();
        instance.plusCart(id, productId);
        //minus 
        instance.minusCart(id, productId);
    }

    @Test
    public void testMinusCart() {
        System.out.println("minusCart");
        int id = 5;
        int productId = 1;
        CartDAO instance = new CartDAO();
        instance.minusCart(id, productId);
        //add
        instance.plusCart(id, productId);
    }

    @Test
    public void testDeleteCart() {
        System.out.println("deleteCart");
        int id = 5;
        int productId = 1;
        CartDAO instance = new CartDAO();
        instance.deleteCart(id, productId);
    }

    @Test
    public void testRemoveCart() {
        System.out.println("removeCart");
        int id = 5;
        CartDAO instance = new CartDAO();
        instance.removeCart(id);
    }

    
    
}
