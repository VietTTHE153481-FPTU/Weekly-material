/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBContext;

import entity.Blog;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Ottelia
 */
public class BlogDAO {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    private String query;

    public ArrayList<Blog> getHotBlogs() {
        //Product with most amount
        ArrayList<Blog> hotBlogList = new ArrayList<>();
        query = "select top 3 * from Blog\n"
                + "order by id desc";
        try {
            conn = new DBcontext().open();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                hotBlogList.add(new Blog(rs.getInt("ID"), rs.getString("Author"), rs.getString("Title"), rs.getString("Content"), rs.getString("imageLink")));
            }
        } catch (Exception e) {
        }
        return hotBlogList;
    }

    public ArrayList<Blog> getAllBlogs() {
        ArrayList<Blog> blogList = new ArrayList<>();
        try {

            query = "select * from Blog  ";
            conn = new DBcontext().open();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                blogList.add(new Blog(rs.getInt("ID"), rs.getString("Author"), rs.getString("Title"), rs.getString("Content"), rs.getString("imageLink")));
            }
        } catch (SQLException e) {
        }
        DBcontext.close(conn, ps, rs);
        return blogList;
    }

    public Blog getBlogByID(int id) {
        query = "SELECT * FROM Blog WHERE ID = ?";
        try {
            conn = new DBcontext().open();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Blog(rs.getInt("ID"), rs.getString("Author"), rs.getString("Title"), rs.getString("Content"), rs.getString("imageLink"));
            }
        } catch (SQLException e) {
        }
        DBcontext.close(conn, ps, rs);
        return null;
    }

    public void add(String author, String title, String content, String imageLink) {
        query = "INSERT INTO Blog VALUES (?,?,?,?)";
        try { conn = new DBcontext().open();
            ps = conn.prepareStatement(query);
            ps.setString(1, author);
            ps.setString(2, title);
            ps.setString(3, content);
            ps.setString(4, imageLink);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
        DBcontext.close(conn, ps, rs);
    }

    public void update(String author, String title, String content, String imageLink, int id) {
          query = "update Blog set Author= ? , Title =?, Content= ?, imageLink= ?  where ID =?";
        try { conn = new DBcontext().open();
            ps = conn.prepareStatement(query);
            ps.setString(1, author);
            ps.setString(2, title);
            ps.setString(3, content);
            ps.setString(4, imageLink);
            ps.setInt(5, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void delete(int id) {
        query = "Delete FROM Blog WHERE ID = ?";

        try { conn = new DBcontext().open();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
        }
        DBcontext.close(conn, ps, rs);
    }
}
