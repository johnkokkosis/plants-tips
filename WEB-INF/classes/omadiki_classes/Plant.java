package omadiki_classes;

public class Plant {
    private String plantId;
    private String plantName;
    private String plantSmallDescription;
    private String plantFullDescription;
    private String plantPrice;
    private String plantAvailability;

    public Plant(String plantId, String plantName, String plantSmallDescription, String plantFullDescription, String plantPrice, String plantAvailability) {
        this.plantId = plantId;
        this.plantName = plantName;
        this.plantSmallDescription = plantSmallDescription;
        this.plantFullDescription = plantFullDescription;
        this.plantPrice = plantPrice;
        this.plantAvailability = plantAvailability;
    }

    public String getPlantId() {
        return plantId;
    }

    public String getPlantName() {
        return plantName;
    }

    public String getPlantSmallDescription() {
        return plantSmallDescription;
    }

    public String getPlantFullDescription() {
        return plantFullDescription;
    }

    public String getPlantPrice() {
        return plantPrice;
    }

    public String getPlantAvailability() {
        return plantAvailability;
    }

    public void setPlantId(String plantId) {
        this.plantId = plantId;
    }

    public void setPlantName(String plantName) {
        this.plantName = plantName;
    }

    public void setPlantSmallDescription(String plantSmallDescription) {
        this.plantSmallDescription = plantSmallDescription;
    }

    public void setPlantFullDescription(String plantFullDescription) {
        this.plantFullDescription = plantFullDescription;
    }

    public void setPlantPrice(String plantPrice) {
        this.plantPrice = plantPrice;
    }

    public void setPlantAvailability(String plantAvailability) {
        this.plantAvailability = plantAvailability;
    }
}
