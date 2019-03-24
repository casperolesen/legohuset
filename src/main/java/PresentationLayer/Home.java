package PresentationLayer;

import FunctionLayer.LegohusetException;
import FunctionLayer.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Casper
 */
public class Home extends Command {

    @Override
    String execute(HttpServletRequest request, HttpServletResponse response) throws LegohusetException {
        
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        return user.getRole() + "page";
        
    }
    
}
