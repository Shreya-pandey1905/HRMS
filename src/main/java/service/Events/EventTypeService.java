package service.Events;

import models.Events.EventTypes;

import java.util.List;

public interface EventTypeService {
    void addEventType(EventTypes eventType);
    List<EventTypes> getAllEventTypes();
    boolean deleteEventType(int eventTypeId);
}
