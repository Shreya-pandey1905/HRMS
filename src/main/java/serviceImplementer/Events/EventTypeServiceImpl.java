package serviceImplementer.Events;

import dao.Events.EventTypeDao;
import models.Events.EventTypes;
import service.Events.EventTypeService;

import java.util.List;

public class EventTypeServiceImpl implements EventTypeService {

    private final EventTypeDao eventTypeDao = new EventTypeDao();

    @Override
    public void addEventType(EventTypes eventType) {
        if (eventType == null || eventType.getEventTypeName() == null || eventType.getEventTypeName().trim().isEmpty()) {
            throw new RuntimeException("Event type name is required");
        }
        if (eventType.getColor() == null || !eventType.getColor().matches("^#[0-9A-Fa-f]{6}$")) {
            throw new RuntimeException("Please choose a valid color");
        }
        eventType.setEventTypeName(eventType.getEventTypeName().trim());
        eventTypeDao.addEventType(eventType);
    }

    @Override
    public List<EventTypes> getAllEventTypes() {
        return eventTypeDao.getAllEventTypes();
    }

    @Override
    public boolean deleteEventType(int eventTypeId) {
        return eventTypeDao.deleteEventType(eventTypeId);
    }
}
