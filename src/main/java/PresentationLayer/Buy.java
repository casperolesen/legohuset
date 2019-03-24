package PresentationLayer;

import FunctionLayer.LegohusetBuyException;
import FunctionLayer.LegohusetException;
import FunctionLayer.LogicFacade;
import FunctionLayer.Odetail;
import FunctionLayer.Order;
import FunctionLayer.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Casper
 */
public class Buy extends Command {

    @Override
    String execute(HttpServletRequest request, HttpServletResponse response) throws LegohusetBuyException, LegohusetException {

        Odetail odetail;
        int length, width, height;
        
        boolean door = Boolean.parseBoolean(request.getParameter("door"));
        boolean window = Boolean.parseBoolean(request.getParameter("window"));
        
        if (request.getParameter("length") == null || request.getParameter("length").isEmpty()) {
            throw new LegohusetBuyException("Udfyld længde");
        }
        if (request.getParameter("width") == null || request.getParameter("width").isEmpty()) {
            throw new LegohusetBuyException("Udfyld bredde");
        }
        if (request.getParameter("height") == null || request.getParameter("height").isEmpty()) {
            throw new LegohusetBuyException("Udfyld højde");
        }
        
        try {
            length = Integer.parseInt(request.getParameter("length"));
            width = Integer.parseInt(request.getParameter("width"));
            height = Integer.parseInt(request.getParameter("height"));

            
        } catch (NumberFormatException ex) {
            throw new LegohusetBuyException("Virker kun med tal..");
        }

        if ((length < 12 || width < 12 || height < 8) && (door || window)) {
            throw new LegohusetBuyException("Du skal bruge et større hus..");
        }

        odetail = new Odetail(length, width, height, door, window);

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        Order order = LogicFacade.addOrder(user.getId(), odetail);
        request.setAttribute("order", order);

        return "confirmationpage";
    }

}
