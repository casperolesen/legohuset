package DBAccess;

import FunctionLayer.LegohusetException;
import FunctionLayer.Odetail;
import FunctionLayer.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Casper
 */
public class OrderMapper {

    public static Order addOrder( Order order ) throws LegohusetException {
        try {
            Connection con = Connector.connection();
            String sql = "INSERT INTO orders (user_id) VALUES (?)";
            PreparedStatement stmt = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, order.getUserId());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            
            if ( rs.next() ) {
                int orderId = rs.getInt(1);
                order.getOdetail().setOrderId(orderId);
                addOdetail(order.getOdetail());
                return order;
                
            } else {
                throw new LegohusetException("Kunne ikke oprette ordre");
            }
        } catch (ClassNotFoundException | SQLException ex) {
            throw new LegohusetException(ex.getMessage());
        }

    }

    public static void addOdetail( Odetail odetail ) throws LegohusetException {
        try {
            Connection con = Connector.connection();
            String sql = "INSERT INTO odetails (order_id, length, width, height) VALUES (?,?,?,?)";
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setInt(1, odetail.getOrderId());
            stmt.setInt(2, odetail.getLength());
            stmt.setInt(3, odetail.getWidth());
            stmt.setInt(4, odetail.getHeight());
            stmt.executeUpdate();
            
        } catch ( ClassNotFoundException | SQLException ex ) {
            throw new LegohusetException( ex.getMessage() );
        }
    }
    
    public static List<Order> getOrders() throws LegohusetException {
        List<Order> orders = null;
        try {
            Connection con = Connector.connection();
            String sql = "SELECT * FROM orders";
            ResultSet rs = con.prepareStatement(sql).executeQuery();
            orders = new ArrayList();
            
            while ( rs.next() ) {
                orders.add(new Order (
                        rs.getInt("id"),
                        rs.getInt("user_id")
                ));
            }
            
        } catch ( ClassNotFoundException | SQLException ex ) {
            throw new LegohusetException( ex.getMessage() );
        }
        
        return orders;
    }

}
