package omadiki_classes;

public class Tip {
    private String tipContent;
    private String tipDatePosted;
    private int userPosted;
    private int forPlant;

    public Tip(String tipContent, String tipDatePosted, int userPosted, int forPlant) {
        this.tipContent = tipContent;
        this.tipDatePosted = tipDatePosted;
        this.userPosted = userPosted;
        this.forPlant = forPlant;
    }

    public String getTipContent() {
        return tipContent;
    }

    public String getTipDatePosted() {
        return tipDatePosted;
    }

    public int getUserPosted() {
        return userPosted;
    }

    public int getForPlant() {
        return forPlant;
    }

    public void setTipContent(String tipContent) {
        this.tipContent = tipContent;
    }

    public void setTipDatePosted(String tipDatePosted) {
        this.tipDatePosted = tipDatePosted;
    }

    public void setUserPosted(int userPosted) {
        this.userPosted = userPosted;
    }

    public void setForPlant(int forPlant) {
        this.forPlant = forPlant;
    }
}
