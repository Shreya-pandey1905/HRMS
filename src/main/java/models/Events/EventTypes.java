package models.Events;

public class EventTypes {

    private int eventTypeId;
    private String eventTypeName;
    private String color;

    public EventTypes() {
    }

    public EventTypes(int eventTypeId, String eventTypeName, String color) {
        this.eventTypeId = eventTypeId;
        this.eventTypeName = eventTypeName;
        this.color = color;
    }

    public int getEventTypeId() {
        return eventTypeId;
    }

    public void setEventTypeId(int eventTypeId) {
        this.eventTypeId = eventTypeId;
    }

    public String getEventTypeName() {
        return eventTypeName;
    }

    public void setEventTypeName(String eventTypeName) {
        this.eventTypeName = eventTypeName;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
}
