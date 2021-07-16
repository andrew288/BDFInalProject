import java.awt.BorderLayout;
import java.awt.Font;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.table.DefaultTableModel;

public class Funcion {
	//propiedades
	private JButton acciones[] = new JButton[8];
	private DefaultTableModel modelo = new DefaultTableModel();
	int CarFlaAct=0;
	int CarFlaAdi=0;
	int CarFlaMod=0;
	int CarFlaEli=0;
	int CarFlaCan=0;
	int CarFlaIna=0;
	int CarFlaRea=0;
	int CarFlaSal=0;
	
	//conexion a la base de datos
	public void setDataReferencial() {
		//Añadimos las columnas
		modelo.addColumn("Codigo");
		modelo.addColumn("Descripción");
		modelo.addColumn("Estado Registro");
		//realizamos la coneccion
		ConeccionMYSQL mysql = new ConeccionMYSQL();
		Statement st;
		ResultSet rs;
		try {
			st = mysql.getConn().createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
			rs = st.executeQuery("select * from Funcion");
			while(rs.next()) {
				Object[] aux= {rs.getInt("FunCod"),rs.getString("FunDes"),rs.getString("FunEstReg")};
				modelo.addRow(aux);
			}
			mysql.getConn().close();
		} catch (Exception e){
			System.out.println("Error: "+e);
		}
	}
	
	//interface de manipulacion de tabla referencial
	public void tipoServicioAdmin() {
		//VENTANA
		JFrame ventana= new JFrame();
		//propiedades de la ventana
		ventana.setSize(550, 550);
		ventana.setTitle("Función");
		ventana.setDefaultCloseOperation(ventana.DO_NOTHING_ON_CLOSE);
		ventana.setLocationRelativeTo(null);
		ventana.setLayout( new GridLayout(3,1,0,10));
		ventana.setVisible(true);
		//paneles
		JPanel panelA = new JPanel();
		JPanel panelB = new JPanel();
		JPanel panelC = new JPanel();
		
		//PANEL A
		panelA.setLayout(new BorderLayout());
		JPanel containerInput = new JPanel();
		containerInput.setLayout(null);
		JLabel subtitleA= new JLabel();
		subtitleA.setText("Registro Función");
		JPanel containerHead1= new JPanel();
		containerHead1.setLayout(new BorderLayout());
		containerHead1.add(new JLabel("  "),BorderLayout.WEST);
		containerHead1.add(subtitleA,BorderLayout.CENTER);
		containerHead1.add(new JLabel(" "),BorderLayout.NORTH);
		containerHead1.add(new JLabel(" "),BorderLayout.SOUTH);
		//subtitulos
		JLabel cod= new JLabel();
		JLabel des= new JLabel();
		JLabel est_reg= new JLabel();
		JTextField input_cod = new JTextField();
		JTextField input_des = new JTextField();
		JTextField input_est_reg = new JTextField();
		cod.setText("Codigo:");
		cod.setFont(new Font("arial",Font.PLAIN,10));
		cod.setBounds(0,10,50,20);
		input_cod.setBounds(100,10,100,20);
		containerInput.add(cod);
		containerInput.add(input_cod);
		des.setText("Descripción:");
		des.setFont(new Font("arial",Font.PLAIN,10));
		des.setBounds(0,40,120,20);
		input_des.setBounds(100,40,200,20);
		containerInput.add(des);
		containerInput.add(input_des);
		est_reg.setText("Estado registro:");
		est_reg.setFont(new Font("arial",Font.PLAIN,10));
		est_reg.setBounds(0,70,120,20);
		input_est_reg.setBounds(100,70,40,20);
		containerInput.add(est_reg);
		containerInput.add(input_est_reg);
		
		panelA.add(containerHead1, BorderLayout.NORTH);
		panelA.add(new JLabel("   "),BorderLayout.WEST);
		panelA.add(containerInput,BorderLayout.CENTER);
		panelA.add(new JLabel("   "),BorderLayout.EAST);
		
		//PANEL B
		panelB.setLayout(new BorderLayout());
		//grilla
		JTable tablaData= new JTable(this.modelo);
		JPanel contenedorTable= new JPanel();
		contenedorTable.setLayout(new BorderLayout());
		contenedorTable.add(new JLabel(" "), BorderLayout.NORTH);
		contenedorTable.add(new JScrollPane(tablaData),BorderLayout.CENTER);
		//subtitulo
		JLabel subtitleB= new JLabel();
		subtitleB.setText("Tabla_Funcion");
		JPanel containerHead2= new JPanel();
		containerHead2.setLayout(new BorderLayout());
		containerHead2.add(new JLabel("  "),BorderLayout.WEST);
		containerHead2.add(subtitleB,BorderLayout.CENTER);
		
		panelB.add(new JLabel("   "),BorderLayout.WEST);
		panelB.add(new JLabel("   "),BorderLayout.EAST);
		panelB.add(containerHead2,BorderLayout.NORTH);
		panelB.add(contenedorTable,BorderLayout.CENTER);
		
		//PANEL C
		panelC.setLayout(new BorderLayout());
		JPanel contenedorBt= new JPanel();
		contenedorBt.setLayout(new GridLayout(2,4,15,20));
		//propiedades de botones
		JButton adicionar= new JButton("Adicionar");
		adicionar.setFont(new Font("arial",Font.PLAIN,10));
		acciones[0]=adicionar;
		JButton modificar= new JButton("Modificar");
		modificar.setFont(new Font("arial",Font.PLAIN,10));
		acciones[1]=modificar;
		JButton eliminar= new JButton("Eliminar");
		eliminar.setFont(new Font("arial",Font.PLAIN,10));
		acciones[2]=eliminar;
		JButton cancelar= new JButton("Cancelar");
		cancelar.setFont(new Font("arial",Font.PLAIN,10));
		acciones[3]=cancelar;
		JButton inactivar= new JButton("Inactivar");
		inactivar.setFont(new Font("arial",Font.PLAIN,10));
		acciones[4]=inactivar;
		JButton reactivar= new JButton("Reactivar");
		reactivar.setFont(new Font("arial",Font.PLAIN,10));
		acciones[5]=reactivar;
		JButton actualizar= new JButton("Actualizar");
		actualizar.setFont(new Font("arial",Font.PLAIN,10));
		acciones[6]=actualizar;
		JButton salir= new JButton("Salir");
		salir.setFont(new Font("arial",Font.PLAIN,10));
		acciones[7]=salir;
		//agregamos los botones
		for(int i=0;i<acciones.length;i++) {
			contenedorBt.add(acciones[i]);
		}
		JLabel subtitleC= new JLabel();
		subtitleC.setText("Acciones");
		JPanel containerHead3= new JPanel();
		containerHead3.setLayout(new BorderLayout());
		containerHead3.add(new JLabel("  "),BorderLayout.WEST);
		containerHead3.add(subtitleC,BorderLayout.CENTER);
		containerHead3.add(new JLabel(" "),BorderLayout.SOUTH);
		//añadimos componentes
		panelC.add(new JLabel("      "), BorderLayout.WEST);
		panelC.add(new JLabel("      "),BorderLayout.EAST);
		panelC.add(containerHead3, BorderLayout.NORTH);
		panelC.add(new JLabel("   "), BorderLayout.SOUTH);
		panelC.add(contenedorBt,BorderLayout.CENTER);
		//agregamos los componentes principales
		ventana.getContentPane().add(panelA);
		ventana.getContentPane().add(panelB);
		ventana.getContentPane().add(panelC);
		//acciones para actualizar
		acciones[6].addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if(CarFlaAct!=0) {
					//si el boton de adicionar fue presionado
					if(CarFlaAdi==1) {
						if(input_des.getText().length()!=0 && input_cod.getText().length()!=0) {
							//preparamos la insercion
							ConeccionMYSQL mysql = new ConeccionMYSQL();
							PreparedStatement st;
							//datos de los inputs
							int cod;
							String des,est_reg;
							cod=Integer.parseInt(input_cod.getText());
							des=input_des.getText();
							est_reg=input_est_reg.getText();
							Object[] newRow= {cod,des,"A"};
							try {
								st= mysql.getConn().prepareStatement("INSERT INTO Funcion VALUES(?,?,?)");
								st.setInt(1,cod);
								st.setString(2,des);
								st.setString(3,est_reg);
								// insertamos registro
								int rs= st.executeUpdate();
								modelo.addRow(newRow);
								tablaData.setModel(modelo);
								modelo.fireTableDataChanged();
								//cerramos la conexion
								mysql.getConn().close();
							} catch (Exception e1){
								System.out.println("Error: "+e1);
							}
							//desactivamos el boton Adicionar
							CarFlaAdi=0;
							CarFlaAct=0;
						} else {
							JOptionPane.showMessageDialog(null, "Debes completar los campos");
						}
					}
					if(CarFlaMod==1) {
						//preparamos la coneccion
						ConeccionMYSQL mysql = new ConeccionMYSQL();
						PreparedStatement st;
						int fila=tablaData.getSelectedRow();
						if(fila>=0) {
							int codFila=Integer.parseInt(input_cod.getText());
							String desFila=input_des.getText();
							try {
								st= mysql.getConn().prepareStatement("UPDATE Funcion SET FunDes=? WHERE FunCod=?");
								st.setString(1,desFila);
								st.setInt(2, codFila);
								int retorno = st.executeUpdate();
								//aplicamos los cambios en el modelo
								modelo.setValueAt(desFila, fila,1);
								tablaData.setModel(modelo);
								modelo.fireTableDataChanged();
								//cerramos la conexion
								mysql.getConn().close();
							} catch (Exception el){
								System.out.println("Error: "+el);
							}
							CarFlaMod=0;
							CarFlaAct=0;
						} else {
							JOptionPane.showMessageDialog(null, "Seleccione un registro");
						}
					}
					if(CarFlaEli==1) {
						//preparamos la coneccion
						ConeccionMYSQL mysql = new ConeccionMYSQL();
						PreparedStatement st;
						int fila=tablaData.getSelectedRow();
						if(fila>=0) {
							int codFila=Integer.parseInt(input_cod.getText());
							try {
								st= mysql.getConn().prepareStatement("UPDATE Funcion SET FunEstReg=? WHERE FunCod=?");
								st.setString(1,"*");
								st.setInt(2, codFila);
								int retorno = st.executeUpdate();
								//aplicamos los cambios en el modelo
								modelo.setValueAt("*", fila,2);
								tablaData.setModel(modelo);
								modelo.fireTableDataChanged();
								//cerramos la conexion
								mysql.getConn().close();
							} catch (Exception el){
								System.out.println("Error: "+el);
							}
							CarFlaEli=0;
							CarFlaAct=0;
						} else {
							JOptionPane.showMessageDialog(null, "Seleccione un registro");
						}
					}
					if(CarFlaIna==1) {
						//preparamos la coneccion
						ConeccionMYSQL mysql = new ConeccionMYSQL();
						PreparedStatement st;
						int fila=tablaData.getSelectedRow();
						if(fila>=0) {
							int codFila=Integer.parseInt(input_cod.getText());
							try {
								st= mysql.getConn().prepareStatement("UPDATE Funcion SET FunEstReg=? WHERE FunCod=?");
								st.setString(1,"I");
								st.setInt(2, codFila);
								int retorno = st.executeUpdate();
								//aplicamos los cambios en el modelo
								modelo.setValueAt("I", fila,2);
								tablaData.setModel(modelo);
								modelo.fireTableDataChanged();
								//cerramos la conexion
								mysql.getConn().close();
							} catch (Exception el){
								System.out.println("Error: "+el);
							}
							CarFlaIna=0;
							CarFlaAct=0;
						} else {
							JOptionPane.showMessageDialog(null, "Seleccione un registro");
						}
					}
					if(CarFlaRea==1) {
						//preparamos la coneccion
						ConeccionMYSQL mysql = new ConeccionMYSQL();
						PreparedStatement st;
						int fila=tablaData.getSelectedRow();
						if(fila>=0) {
							int codFila=Integer.parseInt(input_cod.getText());
							try {
								st= mysql.getConn().prepareStatement("UPDATE Funcion SET FunEstReg=? WHERE FunCod=?");
								st.setString(1,"A");
								st.setInt(2, codFila);
								int retorno = st.executeUpdate();
								//aplicamos los cambios en el modelo
								modelo.setValueAt("A", fila,2);
								tablaData.setModel(modelo);
								modelo.fireTableDataChanged();
								//cerramos la conexion
								mysql.getConn().close();
							} catch (Exception el){
								System.out.println("Error: "+el);
							}
							CarFlaRea=0;
							CarFlaAct=0;
						} else {
							JOptionPane.showMessageDialog(null, "Seleccione un registro");
						}
					}
					//limpiamos los caudros
					input_cod.setText("");
					input_cod.setEditable(true);
					input_des.setText("");
					input_des.setEditable(true);
					input_est_reg.setText("");
					input_est_reg.setEditable(true);
				}
				else {
					JOptionPane.showMessageDialog(null, "Seleccione una acción");
				}
			}
		});
		//accion para adicionar
		acciones[0].addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent e) {
				System.out.println("Añadir");
				//vaciamos los inputs
				input_cod.setText(null);
				input_des.setText(null);
				input_est_reg.setText("A");
				input_cod.setEditable(true);
				input_des.setEditable(true);
				input_est_reg.setEditable(false);
				CarFlaAct=1;
				CarFlaAdi=1;
			}
		});
		//accion para modificar
		acciones[1].addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				System.out.println("Modificar");
				int nFila = tablaData.getSelectedRow();
				if(nFila>=0) {
					input_cod.setText(String.valueOf(tablaData.getValueAt(nFila, 0)));
					input_des.setText(String.valueOf(tablaData.getValueAt(nFila, 1)));
					input_est_reg.setText(String.valueOf(tablaData.getValueAt(nFila, 2)));
					input_cod.setEditable(false);
					input_des.setEditable(true);
					input_est_reg.setEditable(false);
					CarFlaMod=1;
					CarFlaAct=1;
				}
				else {
					JOptionPane.showMessageDialog(null, "Seleccione un registro");
				}
			}
		});
		//accion para eliminar
		acciones[2].addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				System.out.println("Eliminar");
				int nFila = tablaData.getSelectedRow();
				if(nFila>=0) {
					input_cod.setText(String.valueOf(tablaData.getValueAt(nFila, 0)));
					input_des.setText(String.valueOf(tablaData.getValueAt(nFila, 1)));
					input_est_reg.setText("*");
					input_cod.setEditable(false);
					input_des.setEditable(false);
					input_est_reg.setEditable(false);
					CarFlaEli=1;
					CarFlaAct=1;
				}
				else {
					JOptionPane.showMessageDialog(null, "Seleccione un registro");
				}
			}
		});
		acciones[3].addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				System.out.println("Cancelar");
				//limpiamos los caudros
				input_cod.setText("");
				input_cod.setEditable(true);
				input_des.setText("");
				input_des.setEditable(true);
				input_est_reg.setText("");
				input_est_reg.setEditable(true);
				//limpiamos las banderas
				CarFlaAct=0;
				CarFlaAdi=0;
				CarFlaMod=0;
				CarFlaEli=0;
				CarFlaCan=0;
				CarFlaIna=0;
				CarFlaRea=0;
				CarFlaSal=0;
			}
		});
		acciones[4].addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				System.out.println("Inactivar");
				int nFila = tablaData.getSelectedRow();
				if(nFila>=0) {
					input_cod.setText(String.valueOf(tablaData.getValueAt(nFila, 0)));
					input_des.setText(String.valueOf(tablaData.getValueAt(nFila, 1)));
					input_est_reg.setText("I");
					input_cod.setEditable(false);
					input_des.setEditable(false);
					input_est_reg.setEditable(false);
					CarFlaIna=1;
					CarFlaAct=1;
				}
				else {
					JOptionPane.showMessageDialog(null, "Seleccione un registro");
				}
			}
		});
		acciones[5].addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				System.out.println("Reactivar");
				int nFila = tablaData.getSelectedRow();
				if(nFila>=0) {
					input_cod.setText(String.valueOf(tablaData.getValueAt(nFila, 0)));
					input_des.setText(String.valueOf(tablaData.getValueAt(nFila, 1)));
					input_est_reg.setText("A");
					input_cod.setEditable(false);
					input_des.setEditable(false);
					input_est_reg.setEditable(false);
					CarFlaRea=1;
					CarFlaAct=1;
				}
				else {
					JOptionPane.showMessageDialog(null, "Seleccione un registro");
				}
				
			}
		});
		acciones[7].addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				System.out.println("Salir");
				input_cod.setText("");
				input_des.setText("");
				input_est_reg.setText("");
				input_cod.setEditable(false);
				input_des.setEditable(false);
				input_est_reg.setEditable(false);
				CarFlaAct=0;
				CarFlaAdi=0;
				CarFlaMod=0;
				CarFlaEli=0;
				CarFlaCan=0;
				CarFlaIna=0;
				CarFlaRea=0;
				CarFlaSal=0;
				System.exit(0);
			}
		});
	}
	
	public void menuIngreso() {
		JFrame ventanaMenu= new JFrame();
		JButton ingreso= new JButton("Ingresar");
		JLabel usuario= new JLabel();
		JLabel contra= new JLabel();
		JTextField agregartexto= new JTextField();
		JPasswordField agregartexto2= new JPasswordField();
		//propiedades de la ventana
		ventanaMenu.setSize(450, 300);
		ventanaMenu.setTitle("Menu de acceso");
		ventanaMenu.setLayout(null);
		ventanaMenu.setDefaultCloseOperation(ventanaMenu.EXIT_ON_CLOSE);
		ventanaMenu.setLocationRelativeTo(null);
		ventanaMenu.setVisible(true);
		//propiedades del titulo
		usuario.setText("Usuario");
		usuario.setBounds(30, 30, 120, 50);
		usuario.setFont(new Font("arial",Font.BOLD,15));
		ventanaMenu.add(usuario);
		contra.setText("Contraseña");
		contra.setBounds(30, 90, 120, 50);
		contra.setFont(new Font("arial",Font.BOLD,15));
		ventanaMenu.add(contra);
		//propiedades de los botones
		ingreso.setBounds(160, 160, 120, 30);
		ventanaMenu.add(ingreso);
		//propiedades del JTextField
		agregartexto.setBounds(160, 40, 200, 30);
		ventanaMenu.add(agregartexto);
		agregartexto2.setBounds(160, 100, 200, 30);
		ventanaMenu.add(agregartexto2);
		ingreso.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				if(agregartexto.getText().length()!=0 && agregartexto2.getText().length()!=0) {
					ConeccionMYSQL mysql = new ConeccionMYSQL();
					PreparedStatement st;
					try {
						st = mysql.getConn().prepareStatement("SELECT * FROM Usuario WHERE UsuUsu=? AND UsuPas=?");
						st.setString(1, agregartexto.getText());
						st.setString(2, agregartexto2.getText());
						ResultSet rs = st.executeQuery();
						int c=0;
						while(rs.next()) {
							c++;
						}
						System.out.println(c);
						if(c==1) {
							setDataReferencial();
							tipoServicioAdmin();
							ventanaMenu.setVisible(false);
						}
						else {
							JOptionPane.showMessageDialog(null, "Usuario no registrado");
							agregartexto.setText("");
							agregartexto2.setText("");
						}
						//cerramos la coneccion
						mysql.getConn().close();
					} catch (Exception el){
						System.out.println("Error: "+el);
					}
				}
				else {
					JOptionPane.showMessageDialog(null, "Asegurese de ingresar sus datos");
					agregartexto.setText("");
					agregartexto2.setText("");
				}
			}
		});
	}
	public Funcion() {
		//menuIngreso();
		setDataReferencial();
		tipoServicioAdmin();
	}
	public static void main(String[] args) {
		new Funcion();
	}
	
}
