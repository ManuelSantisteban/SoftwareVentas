package SwimgBD.dao;

import SwimgBD.model.Producto;
import SwimgBD.util.BaseDatosUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAO implements DAO<Producto> {

    public ProductoDAO() {
        
    }

    @Override
    public List<Producto> listarTodos() {
        Connection con = BaseDatosUtil.creaConexion();
        String sql = "select idProducto, prod_nombre, prod_stock, prod_marca, prod_precio"
                + " FROM Producto";
        List<Producto> lista = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Producto m = new Producto(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getDouble(5));
                lista.add(m);
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public List<Producto> listarCodigo(String codigo) {
        Connection con = BaseDatosUtil.creaConexion();
        String sql = "select idProducto, prod_nombre, prod_stock, prod_marca, prod_precio"
                + " FROM Producto WHERE codigo like ?";
        List<Producto> lista = new ArrayList<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + codigo + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Producto m = new Producto(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getDouble(5));
                lista.add(m);
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lista;
    }

    public Producto listaruno(String codigo) {
        Connection con = BaseDatosUtil.creaConexion();
        Producto me = new Producto();
        String sql = "select idProducto, prod_nombre, prod_stock, prod_marca, prod_precio"
                + " FROM producto WHERE codigo like ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + codigo + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Producto m = new Producto(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getDouble(5));
                me = m;
            }
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return me;
    }

    @Override
    public void insertar(Producto producto) {
        Connection con = BaseDatosUtil.creaConexion();
        String sql = "insert into producto"
                + "(idProducto, prod_nombre, prod_stock, prod_marca, prod_precio)"
                + "VALUES(?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, producto.getID());
            ps.setString(2, producto.getNombre());
            ps.setInt(3, producto.getStock());
            ps.setString(4, producto.getMarca());
            ps.setDouble(5, producto.getPrecio());
            ps.execute();
            ps.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    @Override
    public void modificar(Producto producto) {
        Connection con = BaseDatosUtil.creaConexion();
        String sql = "update Producto "
                + "set idProducto = ?, prod_nombre= ?, prod_stock = ?, prod_marca = ?, prod_precio = ?"
                + " WHERE idProducto = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, producto.getID());
            ps.setString(2, producto.getNombre());
            ps.setInt(3, producto.getStock());
            ps.setString(4, producto.getMarca());
            ps.setDouble(5, producto.getPrecio());
            ps.execute();
            ps.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }

    @Override
    public void borrar(Producto producto) {
        Connection con = BaseDatosUtil.creaConexion();
        String sql = "delete from Producto"
                + " WHERE idProducto = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, producto.getID());
            ps.execute();
            ps.close();
            con.close();
        } catch (Exception e) {
            System.out.println("Error: " + e);
        }
    }
}
