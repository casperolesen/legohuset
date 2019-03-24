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
        
        String length = request.getParameter("length");
        String width = request.getParameter("width");
        String height = request.getParameter("height");
        
        boolean door = Boolean.parseBoolean(request.getParameter("door"));
        boolean window = Boolean.parseBoolean(request.getParameter("window"));
        
        if (length == null || length.isEmpty()) throw new LegohusetBuyException("Udfyld længde");
        if (width == null || width.isEmpty()) throw new LegohusetBuyException("Udfyld bredde");
        if (height == null || height.isEmpty()) throw new LegohusetBuyException("Udfyld højde");
        
        if ((Integer.parseInt(length) < 12 ||Integer.parseInt(width) < 12 || Integer.parseInt(height) < 8) && (door || window)) throw new LegohusetBuyException("Du skal bruge et større hus..");
        
        try {
            odetail = new Odetail(Integer.parseInt(length), Integer.parseInt(width), Integer.parseInt(height), door, window);
        } catch (NumberFormatException ex) {
            throw new LegohusetBuyException("Virker kun med tal..");
        }
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        Order order = LogicFacade.addOrder(user.getId(), odetail);
        request.setAttribute("order", order);
        
        return "confirmationpage";
    }
       
}
