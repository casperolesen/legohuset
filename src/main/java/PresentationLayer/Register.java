package PresentationLayer;

import FunctionLayer.LogicFacade;
import FunctionLayer.LegohusetException;
import FunctionLayer.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Casper
 */
public class Register extends Command {

    @Override
    String execute( HttpServletRequest request, HttpServletResponse response ) throws LegohusetException {
        
        String email = request.getParameter( "email" );
        String password1 = request.getParameter( "password-1" );
        String password2 = request.getParameter( "password-2" );
        
        if (password1.equals( password2 )) {
            User user = LogicFacade.addUser(email, password1);
            HttpSession session = request.getSession();
            session.setAttribute( "user", user );
            session.setAttribute( "role", user.getRole() );
            return user.getRole() + "page";
        } else {
            throw new LegohusetException(" the two passwords did not match ");
        }
        
    }
    
}
