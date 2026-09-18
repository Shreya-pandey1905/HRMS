package dao.Events;

import models.Events.Events;
import util.DBConfig;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class EventDao {

    public void addEvent(Events event) {

        String sql = "{CALL AddEvent(?, ?, ?, ?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            statement.setString(1, event.getTitle());

            statement.setString(
                    2,
                    event.getEventDate().toString()
            );

            statement.setInt(
                    3,
                    event.getEventTypeId()
            );

            statement.setString(
                    4,
                    event.isActive() ? "Active" : "Inactive"
            );

            statement.execute();

        } catch (Exception e) {
            throw new RuntimeException(
                    "Unable to add event",
                    e
            );
        }
    }

    public List<Events> getAllEvents() {
        return loadEvents("{CALL GetAllEvents()}");
    }

    public List<Events> getActiveEvents() {
        return loadEvents("{CALL GetActiveEvents()}");
    }

    private List<Events> loadEvents(String sql) {

        List<Events> events = new ArrayList<>();

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                events.add(map(resultSet));
            }

        } catch (Exception e) {
            throw new RuntimeException(
                    "Unable to load events",
                    e
            );
        }

        return events;
    }

    public Events getEventById(int eventId) {

        String sql = "{CALL GetEventById(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            statement.setInt(1, eventId);

            try (ResultSet resultSet = statement.executeQuery()) {

                if (resultSet.next()) {
                    return map(resultSet);
                }
            }

        } catch (Exception e) {
            throw new RuntimeException(
                    "Unable to load event",
                    e
            );
        }

        return null;
    }

    public void updateEvent(Events event) {

        String sql = "{CALL UpdateEvent(?, ?, ?, ?, ?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            statement.setInt(
                    1,
                    event.getEventId()
            );

            statement.setString(
                    2,
                    event.getTitle()
            );

            statement.setString(
                    3,
                    event.getEventDate().toString()
            );

            statement.setInt(
                    4,
                    event.getEventTypeId()
            );

            statement.setString(
                    5,
                    event.isActive() ? "Active" : "Inactive"
            );

            statement.execute();

        } catch (Exception e) {
            throw new RuntimeException(
                    "Unable to update event",
                    e
            );
        }
    }

    public void deleteEvent(int eventId) {

        String sql = "{CALL DeleteEvent(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            statement.setInt(1, eventId);

            statement.execute();

        } catch (Exception e) {
            throw new RuntimeException(
                    "Unable to delete event",
                    e
            );
        }
    }

    private Events map(ResultSet resultSet)
            throws Exception {

        Events event = new Events();

        event.setEventId(
                resultSet.getInt("Id")
        );

        event.setTitle(
                resultSet.getString("Title")
        );

        String date =
                resultSet.getString("Date");

        if (date != null && !date.isBlank()) {
            event.setEventDate(
                    LocalDate.parse(date)
            );
        }

        event.setEventTypeId(
                resultSet.getInt("EventTypeId")
        );

        event.setEventTypeName(
                resultSet.getString("EventTypeName")
        );

        event.setColor(
                resultSet.getString("Color")
        );

        String status =
                resultSet.getString("Status");

        event.setActive(
                "Active".equalsIgnoreCase(status)
        );

        return event;
    }
}