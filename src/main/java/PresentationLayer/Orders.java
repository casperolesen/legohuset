package PresentationLayer;

import FunctionLayer.LegohusetException;
import FunctionLayer.LogicFacade;
import FunctionLayer.Order;
import FunctionLayer.User;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Casper
 */
public class Orders extends Command {

    @Override
    String execute(HttpServletRequest request, HttpServletResponse response) throws LegohusetException {
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        List<Order> orders;
        
        if (user.getRole().equals("employee")) {
            orders = LogicFacade.getOrders();
        } else {
            orders = LogicFacade.getOrders();
        }
        
        request.setAttribute("orders", orders);
        return "orderspage";
        
    }
    
}

