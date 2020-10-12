package SwimgBD.model;

public class Usuario {
    private String user;
    private String contra;
    private String privilegio;

    public Usuario() {
    }

    public Usuario(String user, String contra, String privilegio) {
        this.user = user;
        this.contra = contra;
        this.privilegio = privilegio;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getContra() {
        return contra;
    }

    public void setContra(String contra) {
        this.contra = contra;
    }

    public String getPrivilegio() {
        return privilegio;
    }

    public void setPrivilegio(String privilegio) {
        this.privilegio = privilegio;
    }

    @Override
    public String toString() {
        return "Usuario{" + "user=" + user + ", contrase\u00f1a=" + contra + ", privilegio=" + privilegio + '}';
    }
}