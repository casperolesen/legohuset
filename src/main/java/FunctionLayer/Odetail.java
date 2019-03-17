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

    
    // Full
    public Odetail(int id, int orderId, int length, int width, int height) {
        this.id = id;
        this.orderId = orderId;
        this.length = length;
        this.width = width;
        this.height = height;
    }

    public Odetail(int length, int width, int height) {
        this.length = length;
        this.width = width;
        this.height = height;
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

}
