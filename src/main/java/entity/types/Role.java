package entity.types;

public enum Role {
    USER("user"),
    ADMIN("admin"),
    MAINADMIN("mainAdmin");
    private String value;

    Role(String value) {
        this.value = value;
    }

    public String getValue() {
        return value;
    }
}
