package nucleo;

/**
 *
 * @author Sergio Gutierrez
 */
public class Cuenta{
    public Cuenta(int cuentaId, Clasificacion clasificacion, Elemento elemento, String nombre){
        this.cuentaId = cuentaId;
        this.clasificacion = clasificacion;
        this.elemento = elemento;
        this.nombre = nombre;
    }
    
    public Clasificacion getClasificacion(){
        return clasificacion;
    }
    
    public int getCuentaId(){
        return cuentaId;
    }
    
    public Elemento getElemento(){
        return elemento;
    }
    
    public String getNombre(){
        return nombre;
    }
    
    @Override public String toString(){
        return getNombre();
    }
    
    private final Clasificacion clasificacion;
    private final int cuentaId;
    private final Elemento elemento;
    private final String nombre;
}