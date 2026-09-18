package models.Tickets;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class TicketResolution {
    private static final DateTimeFormatter DISPLAY = DateTimeFormatter.ofPattern("dd MMM yyyy, hh:mm a");

    private int resolutionId;
    private int ticketId;
    private int resolvedBy;
    private String resolvedByName;
    private String solution;
    private String resolutionNotes;
    private LocalDateTime resolvedDate;

    public int getResolutionId() { return resolutionId; }
    public void setResolutionId(int resolutionId) { this.resolutionId = resolutionId; }
    public int getTicketId() { return ticketId; }
    public void setTicketId(int ticketId) { this.ticketId = ticketId; }
    public int getResolvedBy() { return resolvedBy; }
    public void setResolvedBy(int resolvedBy) { this.resolvedBy = resolvedBy; }
    public String getResolvedByName() { return resolvedByName; }
    public void setResolvedByName(String resolvedByName) { this.resolvedByName = resolvedByName; }
    public String getSolution() { return solution; }
    public void setSolution(String solution) { this.solution = solution; }
    public String getResolutionNotes() { return resolutionNotes; }
    public void setResolutionNotes(String resolutionNotes) { this.resolutionNotes = resolutionNotes; }
    public LocalDateTime getResolvedDate() { return resolvedDate; }
    public void setResolvedDate(LocalDateTime resolvedDate) { this.resolvedDate = resolvedDate; }
    public String getResolvedDateDisplay() { return resolvedDate == null ? "-" : resolvedDate.format(DISPLAY); }
}
