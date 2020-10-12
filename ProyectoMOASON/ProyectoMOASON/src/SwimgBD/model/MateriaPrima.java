package SwimgBD.model;

public class MateriaPrima {

    private String ID;
    private String nombre;
    private int cantidad;
    private String marca;
    private double precio;

    public MateriaPrima() {
    }

    public MateriaPrima(String ID, String nombre, int cantidad, String marca, double precio) {
        this.ID = ID;
        this.nombre = nombre;
        this.cantidad = cantidad;
        this.marca = marca;
        this.precio = precio;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    @Override
    public String toString() {
        return "MateriaPrima{" + "ID=" + ID + ", nombre=" + nombre + ", cantidad=" + cantidad + ", marca=" + marca + ", precio=" + precio + '}';
    }
    
}
