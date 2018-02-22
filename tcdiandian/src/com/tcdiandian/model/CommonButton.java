package com.tcdiandian.model;

public class CommonButton extends Button{
    private String name;
    private String type;
    private String key;
    private Button[] sb_button;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public Button[] getSb_Common_button() {
        return sb_button;
    }

    public void setSb_Common_button(Button[] sb_button) {
        this.sb_button = sb_button;
    }
}
