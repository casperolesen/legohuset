package FunctionLayer;

import DBAccess.OrderMapper;
import DBAccess.UserMapper;
import java.util.List;

/**
 *
 * @author Casper
 */
public class LogicFacade {
    
    public static User login( String email, String password ) throws LegohusetException {
        return UserMapper.login( email, password );
    }
    
    public static User addUser( String email, String password ) throws LegohusetException {
        User user = new User(email, password, "customer");
        UserMapper.addUser(user);
        return user;
    }
    
    public static Order addOrder( int userId, Odetail odetail) throws LegohusetException {
        Order order = new Order(userId);
        order.setOdetail(odetail);
        OrderMapper.addOrder(order);
        return order;
    }
    
    public static List<Order> getOrders() throws LegohusetException {
        return OrderMapper.getOrders();
    }
    
}
