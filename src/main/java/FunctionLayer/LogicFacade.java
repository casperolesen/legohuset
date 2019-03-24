package FunctionLayer;

import DBAccess.OrderMapper;
import DBAccess.UserMapper;
import java.util.List;

/**
 *
 * @author Casper
 */
public class LogicFacade {

    public static User login(String email, String password) throws LegohusetException {
        return UserMapper.login(email, password);
    }

    public static User addUser(String email, String password) throws LegohusetException {
        User user = new User(email, password, "customer");
        UserMapper.addUser(user);
        return user;
    }

    public static Order addOrder(int userId, Odetail odetail) throws LegohusetException {
        Order order = new Order(userId);
        order.setOdetail(odetail);
        OrderMapper.addOrder(order);
        return order;
    }

    public static List<Order> getOrders() throws LegohusetException {
        return OrderMapper.getOrders();
    }

    public static List<Order> getOrders(int userID) throws LegohusetException {
        return OrderMapper.getOrders(userID);
    }

    public static void shipOrder(int orderId) throws LegohusetException {
        OrderMapper.shipOrder(orderId);
    }

    // bliver pt ikke brugt til noget. styklisterne udregnes i app.js og customerpage.jsp
    // Regnestykket er dog det samme.
    public static House buildHouse(Odetail odetail) {
        int big = 0, medium = 0, small = 0;
        int len, wid;

        for (int i = 1; i <= odetail.getHeight(); i++) {

            if (i % 2 > 0) {
                len = odetail.getLength();
                wid = odetail.getWidth() - 4;

            } else {
                len = odetail.getLength() - 4;
                wid = odetail.getWidth();
            }

            big += ((len / 4) + (wid / 4)) * 2;
            medium += (((len % 4) / 2) + ((wid % 4) / 2)) * 2;
            small += ((len % 4) + (wid % 4)) * 2;

        }
        
        if (odetail.hasDoor()) big -= 3;
        if (odetail.hasWindow()) big -=2;
        
        return new House(big, medium, small);
    }

}
