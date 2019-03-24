package FunctionLayer;

/**
 *
 * @author Casper
 */
public class House {
    int bigBricks;
    int mediumBricks;
    int smallBricks;
    boolean door;
    boolean window;

    // Full
    public House(int bigBricks, int mediumBricks, int smallBricks, boolean door, boolean window) {
        this.bigBricks = bigBricks;
        this.mediumBricks = mediumBricks;
        this.smallBricks = smallBricks;
        this.door = door;
        this.window = window;
    }

    public House(int bigBricks, int mediumBricks, int smallBricks) {
        this.bigBricks = bigBricks;
        this.mediumBricks = mediumBricks;
        this.smallBricks = smallBricks;
    }

    public int getBigBricks() {
        return bigBricks;
    }

    public int getMediumBricks() {
        return mediumBricks;
    }

    public int getSmallBricks() {
        return smallBricks;
    }

    public boolean isDoor() {
        return door;
    }

    public boolean isWindow() {
        return window;
    }
    
    
}
