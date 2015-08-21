package main;

import database.*;
import java.awt.EventQueue;
import java.sql.SQLException;
import java.util.Calendar;
import javax.swing.JOptionPane;
import javax.swing.UIManager;
import javax.swing.UIManager.LookAndFeelInfo;
import javax.swing.UnsupportedLookAndFeelException;
 
/**
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
            for(LookAndFeelInfo info : UIManager.getInstalledLookAndFeels())
                if ("Nimbus".equals(info.getName())){
                    UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
        }catch(ClassNotFoundException | InstantiationException | IllegalAccessException | UnsupportedLookAndFeelException ex){
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
        
        try{
            Database db = new Database(DBMS.MySQL, "balance", "190.99.18.171", "balance", "balance");
            
            EventQueue.invokeLater(() -> {
                new UI(db).setVisible(true);
            });
        }catch(SQLException ex){
            JOptionPane.showMessageDialog(null, ex.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
}