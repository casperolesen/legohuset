package PresentationLayer;

import FunctionLayer.LegohusetBuyException;
import FunctionLayer.LegohusetException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Casper
 */
public class Logout extends Command {

    @Override
    String execute(HttpServletRequest request, HttpServletResponse response) throws LegohusetException, LegohusetBuyException {
        
        HttpSession session = request.getSession();
        session.setAttribute("user", null);
        
        return "logoutpage";
    }
    
}
