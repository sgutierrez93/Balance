package nucleo;

/**
 *
 * @author Sergio Gutierrez
 */
public class Elemento{
    public Elemento(int elementoId, String nombre){
        this.elementoId = elementoId;
        this.nombre = nombre;
    }
    
    public int getElementoId(){
        return elementoId;
    }
    
    public String getNombre(){
        return nombre;
    }
    
    @Override public String toString(){
        return getNombre();
    }
    
    private final int elementoId;
    private final String nombre;
}