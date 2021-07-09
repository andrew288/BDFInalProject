import java.sql.*;

public class ConeccionMYSQL {
	private String dbUrl = "jdbc:mysql://localhost:3306/CooperativasAhorros";
	private String dbUser = "root";
	private String dbPassword = "";
	private String jdbcName = "com.mysql.cj.jdbc.Driver";
	
	public Connection getConn() {
		Connection conn = null;
		try {
			Class.forName(jdbcName);
		} catch (Exception e ) {
			System.out.println("¡Error al cargar el controlador!");
		}
		try {
			conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
		} catch (SQLException ex) {
			System.out.println("¡Error al conectarse a la base de datos!");
		}
		return conn;
	}
	
	public static void main(String[] args) {
		//eliminarPersona();
		//actualizarAsistencia();
		//seleccionarPersona();
		//insertarUsuario();
	}
	
	//Eliminar un registro
	public static void eliminarPersona() {
		ConeccionMYSQL mysql = new ConeccionMYSQL();
		PreparedStatement st;
		int rs;
		try {
			st= mysql.getConn().prepareStatement("delete from Persona where PerCod=?");
			st.setInt(1,4);
			int retorno = st.executeUpdate();
			//cerramos la conexion
			mysql.getConn().close();
		} catch (Exception e){
			System.out.println("Error: "+e);
		}
	}
	
	//Actualizar un registro
	public static void actualizarAsistencia() {
		ConeccionMYSQL mysql = new ConeccionMYSQL();
		PreparedStatement st;
		int rs;
		try {
			st= mysql.getConn().prepareStatement("update Asistencia set AsiDes=? where AsiCod=?");
			st.setString(1,"Tardanza");
			st.setString(2,"3");
			int retorno = st.executeUpdate();
			//cerramos la conexion
			mysql.getConn().close();
		} catch (Exception e){
			System.out.println("Error: "+e);
		}
	}
	
	//Seleccionar un resgistro
	public static void seleccionarPersona() {
		ConeccionMYSQL mysql = new ConeccionMYSQL();
		Statement st;
		ResultSet rs;
		try {
			System.out.println("Ya se conecto");
			st = mysql.getConn().createStatement();
			rs = st.executeQuery("select PerApePat, PerApeMat, PerNom, PerCor from Persona");
			System.out.println("#\tNombre\tPaterno\tMaterno\tCorreo");
			int c=0;
			while(rs.next()) {
				System.out.println((c+1)+"\t"+rs.getString("PerNom")+"\t"+rs.getString("PerApePat")+"\t"+rs.getString("PerApeMat")+"\t"+rs.getString("PerCor"));
				c++;
			}
			c=0;
			mysql.getConn().close();
		} catch (Exception e){
			System.out.println("Error: "+e);
		}
	}
	//Insertar un registro
	public static void insertarUsuario() {
		ConeccionMYSQL mysql = new ConeccionMYSQL();
		Statement st;
		int rs;
		try {
			st= mysql.getConn().createStatement();
			// insertamos registros
			rs= st.executeUpdate("insert into Usuario(UsuEmp, UsuIde, UsuUsu, UsuPas, UsuFecInsUsuDia, UsuFecInsUsuMes, UsuFecInsUsuAño, UsuFun, UsuEstReg) values(1,'jose2020','jose128','1234',14,5,2010,2,1)");
			rs= st.executeUpdate("insert into Usuario(UsuEmp, UsuIde, UsuUsu, UsuPas, UsuFecInsUsuDia, UsuFecInsUsuMes, UsuFecInsUsuAño, UsuFun, UsuEstReg) values(1,'mari1212','maria123','4324',15,5,2009,1,1)");
			rs= st.executeUpdate("insert into Usuario(UsuEmp, UsuIde, UsuUsu, UsuPas, UsuFecInsUsuDia, UsuFecInsUsuMes, UsuFecInsUsuAño, UsuFun, UsuEstReg) values(1,'kare1313','karen321','11331',9,2,2005,2,1)");
			//cerramos la conexion
			mysql.getConn().close();
		} catch (Exception e){
			System.out.println("Error: "+e);
		}
	}
}
