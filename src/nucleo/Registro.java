package nucleo;

import java.sql.Date;

/**
 *
 * @author Sergio Gutierrez
 */
public class Registro{
    public Registro(int registroId, Cuenta cuenta, Clasificacion clasificacion, Elemento elemento, Date fecha, boolean corriente, String descripcion, double cantidad, int registro){
        this.registroId = registroId;
        this.cuenta = cuenta;
        this.clasificacion = clasificacion;
        this.elemento = elemento;
        this.fecha = fecha;
        this.corriente = corriente;
        this.cantidad = cantidad;
        this.descripcion = descripcion;
        
        this.registro = registro;
    }
    
    public double getCantidad(){
        return cantidad;
    }
    
    public Clasificacion getClasificacion(){
        return clasificacion;
    }
    
    public boolean getCorriente(){
        return corriente;
    }
    
    public Cuenta getCuenta(){
        return cuenta;
    }
    
    public String getDescripcion(){
        return descripcion;
    }
    
    public Elemento getElemento(){
        return elemento;
    }
    
    public int getint(){
        return registro;
    }
    
    public int getRegistroId(){
        return registroId;
    }
    
    @Override public String toString(){
        return getDescripcion();
    }
    
    private final double cantidad;
    private final Clasificacion clasificacion;
    private final boolean corriente;
    private final Cuenta cuenta;
    private final String descripcion;
    private final Elemento elemento;
    private final Date fecha;
    private final int registro;
    private final int registroId;
}