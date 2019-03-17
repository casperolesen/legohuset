package PresentationLayer;

import FunctionLayer.LegohusetException;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Casper
 */
abstract class Command {
    
    private static HashMap<String, Command> commands;
    
    private static void initCommands() {
        commands = new HashMap();
        commands.put( "login", new Login() );
        commands.put( "register", new Register() );
        commands.put( "buy", new Buy() );
        commands.put( "orders", new Orders() );
    }
    
    static Command from ( HttpServletRequest request ) {
        String commandName = request.getParameter( "command" );
        if ( commands == null ) {
            initCommands();
        }
        return commands.getOrDefault( commandName, new UnknownCommand() );
    }
    
    abstract String execute( HttpServletRequest request, HttpServletResponse response ) 
            throws LegohusetException;
    
}
