package FunctionLayer;

/**
 *
 * @author Casper
 */
public class Main {
    
    public static void main(String[] args) {
        House house = LogicFacade.buildHouse(new Odetail(13, 9, 4, false, false));
        System.out.println("Big: " + house.getBigBricks());
        System.out.println("Medium: " + house.getMediumBricks());
        System.out.println("Small: " + house.getSmallBricks());
        
        System.out.println(7/2);
    }
}
