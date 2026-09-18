package models.Tickets;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class Ticket {
    private static final DateTimeFormatter DISPLAY = DateTimeFormatter.ofPattern("dd MMM yyyy, hh:mm a");

    private int ticketId;
    private String ticketNo;
    private String subject;
    private String description;
    private String priority;
    private int raisedBy;
    private Integer assignedTo;
    private Integer assignedBy;
    private String status;
    private LocalDateTime createdDate;
    private LocalDateTime assignedDate;
    private LocalDateTime startedDate;
    private LocalDateTime resolvedDate;
    private LocalDateTime closedDate;

    private String raisedByName;
    private String assignedToName;
    private String assignedByName;

    public int getTicketId() { return ticketId; }
    public void setTicketId(int ticketId) { this.ticketId = ticketId; }
    public String getTicketNo() { return ticketNo; }
    public void setTicketNo(String ticketNo) { this.ticketNo = ticketNo; }
    public String getSubject() { return subject; }
    public void setSubject(String subject) { this.subject = subject; }
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    public String getPriority() { return priority; }
    public void setPriority(String priority) { this.priority = priority; }
    public int getRaisedBy() { return raisedBy; }
    public void setRaisedBy(int raisedBy) { this.raisedBy = raisedBy; }
    public Integer getAssignedTo() { return assignedTo; }
    public void setAssignedTo(Integer assignedTo) { this.assignedTo = assignedTo; }
    public Integer getAssignedBy() { return assignedBy; }
    public void setAssignedBy(Integer assignedBy) { this.assignedBy = assignedBy; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
    public LocalDateTime getCreatedDate() { return createdDate; }
    public void setCreatedDate(LocalDateTime createdDate) { this.createdDate = createdDate; }
    public LocalDateTime getAssignedDate() { return assignedDate; }
    public void setAssignedDate(LocalDateTime assignedDate) { this.assignedDate = assignedDate; }
    public LocalDateTime getStartedDate() { return startedDate; }
    public void setStartedDate(LocalDateTime startedDate) { this.startedDate = startedDate; }
    public LocalDateTime getResolvedDate() { return resolvedDate; }
    public void setResolvedDate(LocalDateTime resolvedDate) { this.resolvedDate = resolvedDate; }
    public LocalDateTime getClosedDate() { return closedDate; }
    public void setClosedDate(LocalDateTime closedDate) { this.closedDate = closedDate; }
    public String getRaisedByName() { return raisedByName; }
    public void setRaisedByName(String raisedByName) { this.raisedByName = raisedByName; }
    public String getAssignedToName() { return assignedToName; }
    public void setAssignedToName(String assignedToName) { this.assignedToName = assignedToName; }
    public String getAssignedByName() { return assignedByName; }
    public void setAssignedByName(String assignedByName) { this.assignedByName = assignedByName; }

    public String getCreatedDateDisplay() { return format(createdDate); }
    public String getAssignedDateDisplay() { return format(assignedDate); }
    public String getStartedDateDisplay() { return format(startedDate); }
    public String getResolvedDateDisplay() { return format(resolvedDate); }
    public String getClosedDateDisplay() { return format(closedDate); }

    private String format(LocalDateTime value) {
        return value == null ? "-" : value.format(DISPLAY);
    }
}
