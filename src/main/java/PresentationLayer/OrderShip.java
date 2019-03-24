package PresentationLayer;

import DBAccess.OrderMapper;
import FunctionLayer.LegohusetBuyException;
import FunctionLayer.LegohusetException;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Casper
 */
public class OrderShip extends Command {

    @Override
    String execute(HttpServletRequest request, HttpServletResponse response) throws LegohusetException, LegohusetBuyException {

        String orderID = request.getParameter("id");
        OrderMapper.shipOrder(Integer.parseInt(orderID));

        return "orderspage";
    }

}
