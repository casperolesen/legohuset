package PresentationLayer;

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
    String execute(HttpServletRequest request, HttpServletResponse response) throws LegohusetException {
        
        String length = request.getParameter("length");
        String width = request.getParameter("width");
        String height = request.getParameter("height");
        
        if (length == null || length.isEmpty()) throw new LegohusetException("Udfyld længde");
        if (width == null || width.isEmpty()) throw new LegohusetException("Udfyld bredde");
        if (height == null || height.isEmpty()) throw new LegohusetException("Udfyld højde");
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Odetail odetail = new Odetail(Integer.parseInt(length), Integer.parseInt(width), Integer.parseInt(height));
        Order order = LogicFacade.addOrder(user.getId(), odetail);
        request.setAttribute("order", order);
        
        return "confirmationpage";
    }
       
}
