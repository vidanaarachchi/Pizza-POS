
import java.awt.HeadlessException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;



public class MainFrame extends javax.swing.JFrame {

    /**
     * Creates new form MainFrame
     */
    
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    
    public MainFrame() {
        super("Login");
        initComponents();
        conn = DatabaseConnection.connection();
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        UserName = new javax.swing.JLabel();
        Password = new javax.swing.JLabel();
        UserNameTextBox = new javax.swing.JTextField();
        PasswordTextBox = new javax.swing.JPasswordField();
        LoginButton = new javax.swing.JButton();
        CancelButton = new javax.swing.JButton();
        jLabel4 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setResizable(false);

        jPanel1.setBackground(new java.awt.Color(255, 255, 255));
        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Supreme Delight Pizza Makers", javax.swing.border.TitledBorder.DEFAULT_JUSTIFICATION, javax.swing.border.TitledBorder.BELOW_TOP, new java.awt.Font("Tahoma", 1, 24))); // NOI18N
        jPanel1.setToolTipText("");
        jPanel1.setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        UserName.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        UserName.setForeground(new java.awt.Color(204, 0, 0));
        UserName.setText("User Name");
        jPanel1.add(UserName, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 150, -1, -1));

        Password.setFont(new java.awt.Font("Tahoma", 1, 14)); // NOI18N
        Password.setForeground(new java.awt.Color(204, 0, 0));
        Password.setText("Password");
        jPanel1.add(Password, new org.netbeans.lib.awtextra.AbsoluteConstraints(30, 220, -1, -1));

        UserNameTextBox.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                UserNameTextBoxActionPerformed(evt);
            }
        });
        jPanel1.add(UserNameTextBox, new org.netbeans.lib.awtextra.AbsoluteConstraints(120, 150, 195, -1));
        jPanel1.add(PasswordTextBox, new org.netbeans.lib.awtextra.AbsoluteConstraints(120, 220, 195, -1));

        LoginButton.setBackground(new java.awt.Color(255, 51, 51));
        LoginButton.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        LoginButton.setText("Login");
        LoginButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                LoginButtonActionPerformed(evt);
            }
        });
        jPanel1.add(LoginButton, new org.netbeans.lib.awtextra.AbsoluteConstraints(100, 280, -1, -1));

        CancelButton.setBackground(new java.awt.Color(255, 51, 51));
        CancelButton.setFont(new java.awt.Font("Tahoma", 1, 11)); // NOI18N
        CancelButton.setText("Cancel");
        CancelButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                CancelButtonActionPerformed(evt);
            }
        });
        jPanel1.add(CancelButton, new org.netbeans.lib.awtextra.AbsoluteConstraints(220, 280, -1, -1));

        jLabel4.setIcon(new javax.swing.ImageIcon(getClass().getResource("/log.png"))); // NOI18N
        jPanel1.add(jLabel4, new org.netbeans.lib.awtextra.AbsoluteConstraints(130, 20, 120, 140));

        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/background final.png"))); // NOI18N
        jPanel1.add(jLabel2, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 30, 390, 300));

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addComponent(jPanel1, javax.swing.GroupLayout.PREFERRED_SIZE, 404, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(0, 0, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jPanel1, javax.swing.GroupLayout.Alignment.TRAILING, javax.swing.GroupLayout.PREFERRED_SIZE, 338, javax.swing.GroupLayout.PREFERRED_SIZE)
        );

        jPanel1.getAccessibleContext().setAccessibleName("");

        setSize(new java.awt.Dimension(420, 377));
        setLocationRelativeTo(null);
    }// </editor-fold>//GEN-END:initComponents

    private void CancelButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_CancelButtonActionPerformed
        // TODO add your handling code here:
        System.exit(0);
    }//GEN-LAST:event_CancelButtonActionPerformed

    private void LoginButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_LoginButtonActionPerformed
        // TODO add your handling code here:
        try{

            stmt = conn.createStatement();
            String userName = UserNameTextBox.getText();
            String userPass = PasswordTextBox.getText();

            String sql = "SELECT * FROM admin WHERE User_Name = '"+userName+"' && Pass_Word = '"+userPass+"'";

            rs = stmt.executeQuery(sql);
            if( rs.next()) {
                setVisible(false);
                MenuFrame object = new MenuFrame();
                object.setVisible(true);

            } else {
                JOptionPane.showMessageDialog(null, "Password or User Name Invalid");

            }

        }catch(HeadlessException | SQLException | NullPointerException  e) { JOptionPane.showMessageDialog(null, e);}
    }//GEN-LAST:event_LoginButtonActionPerformed

    private void UserNameTextBoxActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_UserNameTextBoxActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_UserNameTextBoxActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(MainFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(MainFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(MainFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(MainFrame.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new MainFrame().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton CancelButton;
    private javax.swing.JButton LoginButton;
    private javax.swing.JLabel Password;
    private javax.swing.JPasswordField PasswordTextBox;
    private javax.swing.JLabel UserName;
    private javax.swing.JTextField UserNameTextBox;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JPanel jPanel1;
    // End of variables declaration//GEN-END:variables
}
