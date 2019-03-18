package PresentationLayer;

import FunctionLayer.LegohusetException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Casper
 */
public class UnknownCommand extends Command {

    @Override
    String execute( HttpServletRequest request, HttpServletResponse response ) throws LegohusetException {
        String msg = "Unknown command. Contact IT";
        throw new LegohusetException(msg);
    }

}
