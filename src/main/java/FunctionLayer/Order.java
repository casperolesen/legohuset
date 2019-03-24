package FunctionLayer;

/**
 *
 * @author Casper
 */
public class Order {
    private int id;
    private int userId;
    private Odetail odetail;
    private boolean sent;

    // Full
    public Order(int id, int userId, Odetail odetail, boolean sent) {
        this.id = id;
        this.userId = userId;
        this.odetail = odetail;
        this.sent = sent;
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

    public boolean isSent() {
        return sent;
    }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", userId=" + userId + ", odetail=" + odetail + ", sent=" + sent + '}';
    }
    
}
