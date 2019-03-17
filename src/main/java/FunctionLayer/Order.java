package FunctionLayer;

/**
 *
 * @author Casper
 */
public class Order {
    private int id;
    private int userId;
    private Odetail odetail;

    // Full
    public Order(int id, int userId) {
        this.id = id;
        this.userId = userId;
    }

    public Order(int userId) {
        this.userId = userId;
    }

    public int getId() {
        return id;
    }

    public int getUserId() {
        return userId;
    }

    public Odetail getOdetail() {
        return odetail;
    }

    public void setOdetail(Odetail odetail) {
        this.odetail = odetail;
    }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", userId=" + userId + ", odetail=" + odetail + '}';
    }
    
    
}
