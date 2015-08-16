package main;

import database.*;
import java.awt.EventQueue;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import javax.swing.UIManager;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.view.JasperViewer;

/**
 *
 * @author Sergio Gutierrez
 */
public class Main{
    /**
     * @param args the command line arguments
     */
    @SuppressWarnings("ResultOfObjectAllocationIgnored")
    public static void main(String[] args){
        UIManager.put("swing.boldMetal", Boolean.FALSE);
        
        try{
            Database db = new Database(DBMS.MySQL, "balance", "190.99.18.171", "balance", "balance");
            new nucleo.Nucleo(db);
            
            try{
                JasperPrint informe = JasperFillManager.fillReport("Balance.jasper", null, db.getConexion());
                JasperViewer visor = new JasperViewer(informe, false);
                
                visor.setExtendedState(JasperViewer.MAXIMIZED_BOTH);
                visor.setTitle("Balance General");
                visor.setVisible(true);
            }catch(JRException e){
                JOptionPane.showMessageDialog(null, e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
            }
            EventQueue.invokeLater(() -> {
                //Aqui va el JFrame Menu -> new Menu(db);
            });
        }catch (SQLException ex){
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
}