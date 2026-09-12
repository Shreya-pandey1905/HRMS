package serviceImplementer.Tickets;

import dao.Tickets.TicketDao;
import models.Employees.User;
import models.Tickets.Ticket;
import models.Tickets.TicketAttachment;
import models.Tickets.TicketComment;
import models.Tickets.TicketDashboardCounts;
import models.Tickets.TicketResolution;
import service.Tickets.TicketService;

import java.util.List;

public class TicketServiceImpl implements TicketService {
    private final TicketDao ticketDao;

    public TicketServiceImpl() {
        this.ticketDao = new TicketDao();
    }

    @Override
    public Ticket createTicket(String subject, String description, String priority, int raisedBy) {
        return ticketDao.createTicket(subject, description, priority, raisedBy);
    }

    @Override
    public List<Ticket> getTicketsForUser(int userId, String roleName) {
        return ticketDao.getTicketsForUser(userId, roleName);
    }

    @Override
    public Ticket getTicketById(int ticketId) {
        return ticketDao.getTicketById(ticketId);
    }

    @Override
    public List<TicketComment> getComments(int ticketId) {
        return ticketDao.getComments(ticketId);
    }

    @Override
    public TicketResolution getResolution(int ticketId) {
        return ticketDao.getResolution(ticketId);
    }

    @Override
    public List<TicketAttachment> getAttachments(int ticketId) {
        return ticketDao.getAttachments(ticketId);
    }

    @Override
    public TicketAttachment getAttachmentById(int attachmentId) {
        return ticketDao.getAttachmentById(attachmentId);
    }

    @Override
    public TicketDashboardCounts getDashboardCounts(int userId, String roleName) {
        return ticketDao.getDashboardCounts(userId, roleName);
    }

    @Override
    public List<User> getAssignableEmployees() {
        return ticketDao.getAssignableEmployees();
    }

    @Override
    public void assignTicket(int ticketId, int assignedBy, int assignedTo, String assignmentComment) {
        ticketDao.assignTicket(ticketId, assignedBy, assignedTo, assignmentComment);
    }

    @Override
    public void startWork(int ticketId, int userId) {
        ticketDao.startWork(ticketId, userId);
    }

    @Override
    public void addComment(int ticketId, int userId, String commentText) {
        ticketDao.addComment(ticketId, userId, commentText);
    }

    @Override
    public void resolveTicket(int ticketId, int userId, String solution, String resolutionNotes) {
        ticketDao.resolveTicket(ticketId, userId, solution, resolutionNotes);
    }

    @Override
    public void closeTicket(int ticketId, int userId) {
        ticketDao.closeTicket(ticketId, userId);
    }

    @Override
    public void reopenTicket(int ticketId, int userId, String reason) {
        ticketDao.reopenTicket(ticketId, userId, reason);
    }

    @Override
    public void addAttachment(TicketAttachment attachment) {
        ticketDao.addAttachment(attachment);
    }
}
