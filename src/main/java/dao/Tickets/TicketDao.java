package dao.Tickets;

import models.Employees.User;
import models.Tickets.*;
import util.DBConfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TicketDao {

    public Ticket createTicket(String subject, String description, String priority, int raisedBy) {
        String sql = "{CALL CreateTicket(?, ?, ?, ?, ?, ?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            statement.setString(1, subject);
            statement.setString(2, description);
            statement.setString(3, priority);
            statement.setInt(4, raisedBy);
            statement.registerOutParameter(5, Types.INTEGER);
            statement.registerOutParameter(6, Types.VARCHAR);
            statement.execute();

            Ticket ticket = new Ticket();
            ticket.setTicketId(statement.getInt(5));
            ticket.setTicketNo(statement.getString(6));
            return ticket;

        } catch (Exception e) {
            throw new RuntimeException("Unable to create ticket", e);
        }
    }

    public List<Ticket> getTicketsForUser(int userId, String roleName) {
        List<Ticket> tickets = new ArrayList<>();
        String sql = "{CALL GetTicketsForUser(?, ?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            statement.setInt(1, userId);
            statement.setString(2, roleName);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    tickets.add(mapTicket(resultSet));
                }
            }
        } catch (Exception e) {
            throw new RuntimeException("Unable to fetch tickets", e);
        }

        return tickets;
    }

    public Ticket getTicketById(int ticketId) {
        String sql = "{CALL GetTicketById(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            statement.setInt(1, ticketId);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return mapTicket(resultSet);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException("Unable to fetch ticket", e);
        }

        return null;
    }

    public List<TicketComment> getComments(int ticketId) {
        List<TicketComment> comments = new ArrayList<>();
        String sql = "{CALL GetTicketComments(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            statement.setInt(1, ticketId);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    TicketComment comment = new TicketComment();
                    comment.setCommentId(resultSet.getInt("CommentId"));
                    comment.setTicketId(resultSet.getInt("TicketId"));
                    comment.setCommentBy(resultSet.getInt("CommentBy"));
                    comment.setCommentByName(resultSet.getString("CommentByName"));
                    comment.setCommentText(resultSet.getString("CommentText"));
                    comment.setCommentDate(toLocalDateTime(resultSet.getTimestamp("CommentDate")));
                    comments.add(comment);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException("Unable to fetch ticket comments", e);
        }

        return comments;
    }

    public TicketResolution getResolution(int ticketId) {
        String sql = "{CALL GetTicketResolution(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            statement.setInt(1, ticketId);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    TicketResolution resolution = new TicketResolution();
                    resolution.setResolutionId(resultSet.getInt("ResolutionId"));
                    resolution.setTicketId(resultSet.getInt("TicketId"));
                    resolution.setResolvedBy(resultSet.getInt("ResolvedBy"));
                    resolution.setResolvedByName(resultSet.getString("ResolvedByName"));
                    resolution.setSolution(resultSet.getString("Solution"));
                    resolution.setResolutionNotes(resultSet.getString("ResolutionNotes"));
                    resolution.setResolvedDate(toLocalDateTime(resultSet.getTimestamp("ResolvedDate")));
                    return resolution;
                }
            }
        } catch (Exception e) {
            throw new RuntimeException("Unable to fetch ticket resolution", e);
        }

        return null;
    }

    public List<TicketAttachment> getAttachments(int ticketId) {
        List<TicketAttachment> attachments = new ArrayList<>();
        String sql = "{CALL GetTicketAttachments(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            statement.setInt(1, ticketId);

            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    attachments.add(mapAttachment(resultSet));
                }
            }
        } catch (Exception e) {
            throw new RuntimeException("Unable to fetch ticket attachments", e);
        }

        return attachments;
    }

    public TicketAttachment getAttachmentById(int attachmentId) {
        String sql = "{CALL GetTicketAttachmentById(?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            statement.setInt(1, attachmentId);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return mapAttachment(resultSet);
                }
            }
        } catch (Exception e) {
            throw new RuntimeException("Unable to fetch attachment", e);
        }

        return null;
    }

    public TicketDashboardCounts getDashboardCounts(int userId, String roleName) {
        String sql = "{CALL GetTicketDashboardCounts(?, ?)}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {

            statement.setInt(1, userId);
            statement.setString(2, roleName);

            try (ResultSet resultSet = statement.executeQuery()) {
                TicketDashboardCounts counts = new TicketDashboardCounts();
                if (resultSet.next()) {
                    counts.setOpenCount(resultSet.getInt("OpenCount"));
                    counts.setActiveCount(resultSet.getInt("ActiveCount"));
                    counts.setResolvedCount(resultSet.getInt("ResolvedCount"));
                    counts.setClosedCount(resultSet.getInt("ClosedCount"));
                }
                return counts;
            }
        } catch (Exception e) {
            throw new RuntimeException("Unable to fetch ticket dashboard counts", e);
        }
    }

    public List<User> getAssignableEmployees() {
        List<User> users = new ArrayList<>();
        String sql = "{CALL GetTicketAssignableEmployees()}";

        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                User user = new User();
                user.setUserId(resultSet.getInt("UserId"));
                user.setFirstName(resultSet.getString("FirstName"));
                user.setLastName(resultSet.getString("LastName"));
                users.add(user);
            }
        } catch (Exception e) {
            throw new RuntimeException("Unable to fetch assignable employees", e);
        }

        return users;
    }

    public void assignTicket(int ticketId, int assignedBy, int assignedTo, String assignmentComment) {
        executeUpdate("{CALL AssignTicket(?, ?, ?, ?)}", statement -> {
            statement.setInt(1, ticketId);
            statement.setInt(2, assignedBy);
            statement.setInt(3, assignedTo);
            statement.setString(4, assignmentComment);
        }, "Unable to assign ticket");
    }

    public void startWork(int ticketId, int userId) {
        executeUpdate("{CALL StartTicketWork(?, ?)}", statement -> {
            statement.setInt(1, ticketId);
            statement.setInt(2, userId);
        }, "Unable to start ticket work");
    }

    public void addComment(int ticketId, int userId, String commentText) {
        executeUpdate("{CALL AddTicketComment(?, ?, ?)}", statement -> {
            statement.setInt(1, ticketId);
            statement.setInt(2, userId);
            statement.setString(3, commentText);
        }, "Unable to add ticket comment");
    }

    public void resolveTicket(int ticketId, int userId, String solution, String resolutionNotes) {
        executeUpdate("{CALL ResolveTicket(?, ?, ?, ?)}", statement -> {
            statement.setInt(1, ticketId);
            statement.setInt(2, userId);
            statement.setString(3, solution);
            statement.setString(4, resolutionNotes);
        }, "Unable to resolve ticket");
    }

    public void closeTicket(int ticketId, int userId) {
        executeUpdate("{CALL CloseTicket(?, ?)}", statement -> {
            statement.setInt(1, ticketId);
            statement.setInt(2, userId);
        }, "Unable to close ticket");
    }

    public void reopenTicket(int ticketId, int userId, String reason) {
        executeUpdate("{CALL ReopenTicket(?, ?, ?)}", statement -> {
            statement.setInt(1, ticketId);
            statement.setInt(2, userId);
            statement.setString(3, reason);
        }, "Unable to reopen ticket");
    }

    public void addAttachment(TicketAttachment attachment) {
        executeUpdate("{CALL AddTicketAttachment(?, ?, ?, ?, ?, ?, ?, ?)}", statement -> {
            statement.setInt(1, attachment.getTicketId());
            statement.setString(2, attachment.getFileName());
            statement.setString(3, attachment.getStoredName());
            statement.setString(4, attachment.getFilePath());
            statement.setString(5, attachment.getContentType());
            statement.setString(6, attachment.getAttachmentType());
            statement.setInt(7, attachment.getUploadedBy());
            statement.setTimestamp(8, Timestamp.valueOf(attachment.getUploadedDate()));
        }, "Unable to save ticket attachment");
    }

    private void executeUpdate(String sql, StatementBinder binder, String errorMessage) {
        try (Connection connection = DBConfig.getConnection();
             CallableStatement statement = connection.prepareCall(sql)) {
            binder.bind(statement);
            statement.execute();
        } catch (Exception e) {
            throw new RuntimeException(errorMessage, e);
        }
    }

    private Ticket mapTicket(ResultSet resultSet) throws Exception {
        Ticket ticket = new Ticket();
        ticket.setTicketId(resultSet.getInt("TicketId"));
        ticket.setTicketNo(resultSet.getString("TicketNo"));
        ticket.setSubject(resultSet.getString("Subject"));
        ticket.setDescription(resultSet.getString("Description"));
        ticket.setPriority(resultSet.getString("Priority"));
        ticket.setRaisedBy(resultSet.getInt("RaisedBy"));
        ticket.setAssignedTo((Integer) resultSet.getObject("AssignedTo"));
        ticket.setAssignedBy((Integer) resultSet.getObject("AssignedBy"));
        ticket.setStatus(resultSet.getString("Status"));
        ticket.setCreatedDate(toLocalDateTime(resultSet.getTimestamp("CreatedDate")));
        ticket.setAssignedDate(toLocalDateTime(resultSet.getTimestamp("AssignedDate")));
        ticket.setStartedDate(toLocalDateTime(resultSet.getTimestamp("StartedDate")));
        ticket.setResolvedDate(toLocalDateTime(resultSet.getTimestamp("ResolvedDate")));
        ticket.setClosedDate(toLocalDateTime(resultSet.getTimestamp("ClosedDate")));
        ticket.setRaisedByName(resultSet.getString("RaisedByName"));
        ticket.setAssignedToName(resultSet.getString("AssignedToName"));
        ticket.setAssignedByName(resultSet.getString("AssignedByName"));
        return ticket;
    }

    private TicketAttachment mapAttachment(ResultSet resultSet) throws Exception {
        TicketAttachment attachment = new TicketAttachment();
        attachment.setAttachmentId(resultSet.getInt("AttachmentId"));
        attachment.setTicketId(resultSet.getInt("TicketId"));
        attachment.setFileName(resultSet.getString("FileName"));
        attachment.setStoredName(resultSet.getString("StoredName"));
        attachment.setFilePath(resultSet.getString("FilePath"));
        attachment.setContentType(resultSet.getString("ContentType"));
        attachment.setAttachmentType(resultSet.getString("AttachmentType"));
        attachment.setUploadedBy(resultSet.getInt("UploadedBy"));
        attachment.setUploadedByName(resultSet.getString("UploadedByName"));
        attachment.setUploadedDate(toLocalDateTime(resultSet.getTimestamp("UploadedDate")));
        return attachment;
    }

    private java.time.LocalDateTime toLocalDateTime(Timestamp timestamp) {
        return timestamp == null ? null : timestamp.toLocalDateTime();
    }

    @FunctionalInterface
    private interface StatementBinder {
        void bind(CallableStatement statement) throws Exception;
    }
}
