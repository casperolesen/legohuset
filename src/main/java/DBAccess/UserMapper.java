package DBAccess;

import FunctionLayer.LegohusetException;
import FunctionLayer.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Casper
 */
public class UserMapper {
    
    public static void addUser( User user ) throws LegohusetException {
        try {
            Connection con = Connector.connection();
            String sql = "INSERT INTO users (email, password, role) VALUES (?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement( sql, Statement.RETURN_GENERATED_KEYS );
            stmt.setString( 1, user.getEmail() );
            stmt.setString( 2, user.getPassword() );
            stmt.setString( 3, user.getRole() );
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            
            if ( rs.next() ) {
                int id = rs.getInt( 1 );
                user.setId( id );
            }
            
        } catch ( ClassNotFoundException | SQLException ex ) {
            throw new LegohusetException( ex.getMessage() );
        }
    }
    
    public static User login( String email, String password ) throws LegohusetException {
        try {
            Connection con = Connector.connection();
            String sql = "SELECT id, role FROM users WHERE email = ? AND password = ?";
            PreparedStatement stmt = con.prepareStatement( sql );
            stmt.setString( 1, email );
            stmt.setString( 2, password );
            ResultSet rs = stmt.executeQuery();
            
            if ( rs.next() ) {
                int id = rs.getInt( "id" );
                String role = rs.getString( "role" );
                return new User( id, email, password, role );
            } else {
                throw new LegohusetException( "Could not validate user" );
            }
        } catch ( ClassNotFoundException | SQLException ex ) {
            throw new LegohusetException( ex.getMessage() );
        }
    }
}
