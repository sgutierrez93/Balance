package nucleo;

/**
 *
 * @author Sergio Gutierrez
 */
public class Clasificacion{
    public Clasificacion(int clasificacionId, Elemento elemento, String nombre){
        this.clasificacionId = clasificacionId;
        this.elemento = elemento;
        this.nombre = nombre;
    }
    
    public int getClasificacionId(){
        return clasificacionId;
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
    
    private final int clasificacionId;
    private final Elemento elemento;
    private final String nombre;
}