package models.Tickets;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class TicketComment {
    private static final DateTimeFormatter DISPLAY = DateTimeFormatter.ofPattern("dd MMM yyyy, hh:mm a");

    private int commentId;
    private int ticketId;
    private int commentBy;
    private String commentByName;
    private String commentText;
    private LocalDateTime commentDate;

    public int getCommentId() { return commentId; }
    public void setCommentId(int commentId) { this.commentId = commentId; }
    public int getTicketId() { return ticketId; }
    public void setTicketId(int ticketId) { this.ticketId = ticketId; }
    public int getCommentBy() { return commentBy; }
    public void setCommentBy(int commentBy) { this.commentBy = commentBy; }
    public String getCommentByName() { return commentByName; }
    public void setCommentByName(String commentByName) { this.commentByName = commentByName; }
    public String getCommentText() { return commentText; }
    public void setCommentText(String commentText) { this.commentText = commentText; }
    public LocalDateTime getCommentDate() { return commentDate; }
    public void setCommentDate(LocalDateTime commentDate) { this.commentDate = commentDate; }
    public String getCommentDateDisplay() { return commentDate == null ? "-" : commentDate.format(DISPLAY); }
}
