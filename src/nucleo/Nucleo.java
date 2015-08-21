package nucleo;

import database.Database;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.JOptionPane;

/**
 *
 * @author Sergio Gutierrez
 */
public class Nucleo{
    public Nucleo(Database db){
        this.db = db;
        elemento = new ArrayList<>();
        clasificacion = new ArrayList<>();
        cuenta = new ArrayList<>();
        registro = new ArrayList<>();
        
        loadElemento();
        loadClasificacion();
        loadCuenta();
        loadRegistro();
    }
    
    public Clasificacion[] getClasificaciones(Elemento elemento){
        ArrayList<Clasificacion> temp = new ArrayList<>();
        
        temp.add(null);
        
        clasificacion.stream().forEach((c) -> {
            if(c != null && c.getElemento().getElementoId() == elemento.getElementoId())
                    temp.add(c);
        });
        
        return temp.toArray(new Clasificacion[0]);
    }
    
    public Cuenta[] getCuenta(Clasificacion clasificacion){
        ArrayList<Cuenta> temp = new ArrayList<>();
        
        temp.add(null);
        
        cuenta.stream().forEach((c) -> {
            if(c != null && c.getClasificacion().getClasificacionId() == clasificacion.getClasificacionId() && c.getClasificacion().getElemento().getElementoId() == clasificacion.getElemento().getElementoId())
                temp.add(c);
        });
        
        return temp.toArray(new Cuenta[0]);
    }
    
    public Elemento[] getElementos(){
        return elemento.toArray(new Elemento[0]);
    }
    
    public Registro[] getRegistros(){
        return registro.toArray(new Registro[0]);
    }
    
    private void loadClasificacion(){
        clasificacion.add(null);
        
        try{
            ResultSet sql = db.executeReader("CALL sp_get_clasificacion()");
            
            while(sql.next()){
                Elemento _elemento = null;
            
                for(Elemento temp : elemento)
                    if(temp != null && sql.getInt("elementoId") == temp.getElementoId()){
                        _elemento = temp;
                        break;
                    }
                
                clasificacion.add(new Clasificacion(sql.getInt("clasificacionId"), _elemento, sql.getString("nombre")));
            }
        }catch(SQLException e){
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }finally{
            db.closeQuery();
        }
    }
    
    @SuppressWarnings("null")
    private void loadCuenta(){
        cuenta.add(null);
        
        try{
            ResultSet sql = db.executeReader("CALL sp_get_cuenta()");
            
            while(sql.next()){
                Clasificacion _clasificacion = null;
                
                for(Clasificacion temp : clasificacion)
                    if(temp != null)
                        if(sql.getInt("clasificacionId") == temp.getClasificacionId() &
                           sql.getInt("elementoId") == temp.getElemento().getElementoId()){
                            _clasificacion = temp;
                            break;
                        }
                
                cuenta.add(new Cuenta(sql.getInt("cuentaId"), _clasificacion, _clasificacion.getElemento(), sql.getString("nombre")));
            }
        }catch(SQLException e){
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }finally{
            db.closeQuery();
        }
    }
    
    private void loadElemento(){
        elemento.add(null);
        
        try{
            ResultSet sql = db.executeReader("CALL sp_get_elemento()");
            
            while(sql.next())
                elemento.add(new Elemento(sql.getInt("elementoId"), sql.getString("nombre")));
        }catch(SQLException e){
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }finally{
            db.closeQuery();
        }
    }
    
    @SuppressWarnings("null")
    private void loadRegistro(){
        registro.add(null);
        
        try{
            ResultSet sql = db.executeReader("CALL sp_get_registro_groupby_descripcion()");
            
            while(sql.next()){
                Cuenta _cuenta = null;
                
                for(Cuenta temp : cuenta)
                    if(temp != null)
                        if(sql.getInt("cuentaId") == temp.getCuentaId() &
                           sql.getInt("clasificacionId") == temp.getClasificacion().getClasificacionId() &
                           sql.getInt("elementoId") == temp.getElemento().getElementoId()){
                            _cuenta = temp;
                        }
                
                registro.add(new Registro(sql.getInt("registroId"), _cuenta, _cuenta.getClasificacion(), _cuenta.getElemento(), sql.getDate("fecha"), sql.getBoolean("corriente"), sql.getString("descripcion"), sql.getDouble("cantidad"), sql.getInt("registro")));
            }
        }catch(SQLException e){
            JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }finally{
            db.closeQuery();
        }
    }
    
    private final ArrayList<Clasificacion> clasificacion;
    private final ArrayList<Cuenta> cuenta;
    private final Database db;
    private final ArrayList<Elemento> elemento;
    private final ArrayList<Registro> registro;
}