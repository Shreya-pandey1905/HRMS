package serviceImplementer.Events;

import dao.Events.EventDao;
import models.Events.Events;
import service.Events.EventService;

import java.util.List;

public class EventServiceImpl implements EventService {

    private final EventDao eventDao = new EventDao();

    @Override
    public void addEvent(Events event) {
        validate(event);
        eventDao.addEvent(event);
    }

    @Override
    public List<Events> getAllEvents() {
        return eventDao.getAllEvents();
    }

    @Override
    public List<Events> getActiveEvents() {
        return eventDao.getActiveEvents();
    }

    @Override
    public Events getEventById(int eventId) {
        return eventDao.getEventById(eventId);
    }

    @Override
    public void updateEvent(Events event) {
        validate(event);
        eventDao.updateEvent(event);
    }

    @Override
    public void deleteEvent(int eventId) {
        eventDao.deleteEvent(eventId);
    }

    private void validate(Events event) {
        if (event == null || event.getTitle() == null || event.getTitle().trim().isEmpty()) {
            throw new RuntimeException("Event title is required");
        }
        if (event.getEventDate() == null) {
            throw new RuntimeException("Event date is required");
        }
        if (event.getEventTypeId() <= 0) {
            throw new RuntimeException("Event type is required");
        }
        event.setTitle(event.getTitle().trim());
    }
}
