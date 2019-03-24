package FunctionLayer;

/**
 *
 * @author Casper
 */
public class Odetail {
    
    private int id;
    private int orderId;
    private int length;
    private int width;
    private int height;
    private boolean door;
    private boolean window;

    
    // Full
    public Odetail(int id, int orderId, int length, int width, int height, boolean door, boolean window) {
        this.id = id;
        this.orderId = orderId;
        this.length = length;
        this.width = width;
        this.height = height;
        this.door = door;
        this.window = window;
    }

    public Odetail(int length, int width, int height, boolean door, boolean window) {
        this.length = length;
        this.width = width;
        this.height = height;
        this.door = door;
        this.window = window;
    }

    public int getId() {
        return id;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getLength() {
        return length;
    }

    public int getWidth() {
        return width;
    }

    public int getHeight() {
        return height;
    }

    public boolean hasDoor() {
        return door;
    }

    public boolean hasWindow() {
        return window;
    }
    

    @Override
    public String toString() {
        return "Odetail{" + "id=" + id + ", orderId=" + orderId + ", length=" + length + ", width=" + width + ", height=" + height + '}';
    }
    

}
