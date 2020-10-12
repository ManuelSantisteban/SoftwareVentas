package SwimgBD.dao;

import SwimgBD.model.Usuario;
import SwimgBD.util.BaseDatosUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class UsuarioDao implements DAO<Usuario>{
    @Override
    public List<Usuario> listarTodos() {
        Connection con = BaseDatosUtil.creaConexion();
        String sql = "select usuario_usuario, usuario_contra, usuario_privilegio"
                + " FROM Usuario";
        List<Usuario> lista = new ArrayList<>();
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Usuario u = new Usuario(rs.getString(1), rs.getString(2), rs.getString(3));
                System.out.println(rs.getString(1) + " " + rs.getString(2) + " " + rs.getString(3));
                lista.add(u);
            }
            rs.close();
            ps.close();
            con.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return lista;
    }
    
    @Override
    public void insertar(Usuario usuario){
        Connection con = BaseDatosUtil.creaConexion();
        String sql = "insert into Usuario" + 
                "(usuario_usuario, usuario_contra, usuario_privilegio)"
                + "VALUES(?,?,?)";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, usuario.getUser());
            ps.setString(2, usuario.getContra());
            ps.setString(3, usuario.getPrivilegio());
            ps.execute();
            ps.close();
            con.close();
        }catch(Exception e){
            System.out.println("Error: " + e);
        }
    }
    @Override
    public void modificar(Usuario usuario){
        Connection con = BaseDatosUtil.creaConexion();
        String sql = "update Usuario " + 
                "set usuario_usuario = ?, usuario_contra= ?, usuario_privilegio= ?"
                + " WHERE usuario_ID = ?";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, usuario.getUser());
            ps.setString(2, usuario.getContra());
            ps.setString(3, usuario.getPrivilegio());
            ps.execute();
            ps.close();
            con.close();
        }catch(Exception e){
            System.out.println("Error: " + e);
        }
    }
    
    @Override
    public void borrar(Usuario usuario){
        Connection con = BaseDatosUtil.creaConexion();
        String sql = "delete from Usuario"
                + " WHERE usuario_ID = ?";
        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, usuario.getUser());
            ps.execute();
            ps.close();
            con.close();
        }catch(Exception e){
            System.out.println("Error: " + e);
        }
    }
}
