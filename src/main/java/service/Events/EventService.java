package service.Events;

import models.Events.Events;

import java.util.List;

public interface EventService {
    void addEvent(Events event);
    List<Events> getAllEvents();
    List<Events> getActiveEvents();
    Events getEventById(int eventId);
    void updateEvent(Events event);
    void deleteEvent(int eventId);
}
