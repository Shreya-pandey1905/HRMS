package service.Tickets;

import models.Employees.User;
import models.Tickets.Ticket;
import models.Tickets.TicketAttachment;
import models.Tickets.TicketComment;
import models.Tickets.TicketDashboardCounts;
import models.Tickets.TicketResolution;

import java.util.List;

public interface TicketService {
    Ticket createTicket(String subject, String description, String priority, int raisedBy);
    List<Ticket> getTicketsForUser(int userId, String roleName);
    Ticket getTicketById(int ticketId);
    List<TicketComment> getComments(int ticketId);
    TicketResolution getResolution(int ticketId);
    List<TicketAttachment> getAttachments(int ticketId);
    TicketAttachment getAttachmentById(int attachmentId);
    TicketDashboardCounts getDashboardCounts(int userId, String roleName);
    List<User> getAssignableEmployees(int excludedUserId);
    void assignTicket(int ticketId, int assignedBy, int assignedTo, String assignmentComment);
    void startWork(int ticketId, int userId);
    void addComment(int ticketId, int userId, String commentText);
    void resolveTicket(int ticketId, int userId, String solution, String resolutionNotes);
    void closeTicket(int ticketId, int userId);
    void reopenTicket(int ticketId, int userId, String reason);
    void addAttachment(TicketAttachment attachment);
}
