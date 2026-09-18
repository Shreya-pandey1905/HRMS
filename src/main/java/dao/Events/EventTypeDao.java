package dao.Events;

import models.Events.EventTypes;
import util.DBConfig;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class EventTypeDao {

    public void addEventType(EventTypes eventType) {
        String sql = "{CALL AddEventType(?, ?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            statement.setString(1, eventType.getEventTypeName());
            statement.setString(2, eventType.getColor());

            statement.execute();

        } catch (Exception e) {
            throw new RuntimeException("Unable to add event type", e);
        }
    }

    public List<EventTypes> getAllEventTypes() {

        List<EventTypes> eventTypes = new ArrayList<>();

        String sql = "{CALL GetAllEventTypes()}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {

                EventTypes eventType = new EventTypes();

                eventType.setEventTypeId(
                        resultSet.getInt("Id")
                );

                eventType.setEventTypeName(
                        resultSet.getString("Name")
                );

                eventType.setColor(
                        resultSet.getString("Color")
                );

                eventTypes.add(eventType);
            }

        } catch (Exception e) {
            throw new RuntimeException(
                    "Unable to load event types",
                    e
            );
        }

        return eventTypes;
    }

    public boolean deleteEventType(int eventTypeId) {

        String sql = "{CALL DeleteEventType(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            statement.setInt(1, eventTypeId);

            try (ResultSet resultSet = statement.executeQuery()) {
                return resultSet.next() && resultSet.getInt("Deleted") == 1;
            }

        } catch (Exception e) {
            throw new RuntimeException(
                    "Unable to delete event type",
                    e
            );
        }
    }
}