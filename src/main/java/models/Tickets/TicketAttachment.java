package models.Tickets;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class TicketAttachment {
    private static final DateTimeFormatter DISPLAY = DateTimeFormatter.ofPattern("dd MMM yyyy, hh:mm a");

    private int attachmentId;
    private int ticketId;
    private String fileName;
    private String storedName;
    private String filePath;
    private String contentType;
    private String attachmentType;
    private int uploadedBy;
    private String uploadedByName;
    private LocalDateTime uploadedDate;

    public int getAttachmentId() { return attachmentId; }
    public void setAttachmentId(int attachmentId) { this.attachmentId = attachmentId; }
    public int getTicketId() { return ticketId; }
    public void setTicketId(int ticketId) { this.ticketId = ticketId; }
    public String getFileName() { return fileName; }
    public void setFileName(String fileName) { this.fileName = fileName; }
    public String getStoredName() { return storedName; }
    public void setStoredName(String storedName) { this.storedName = storedName; }
    public String getFilePath() { return filePath; }
    public void setFilePath(String filePath) { this.filePath = filePath; }
    public String getContentType() { return contentType; }
    public void setContentType(String contentType) { this.contentType = contentType; }
    public String getAttachmentType() { return attachmentType; }
    public void setAttachmentType(String attachmentType) { this.attachmentType = attachmentType; }
    public int getUploadedBy() { return uploadedBy; }
    public void setUploadedBy(int uploadedBy) { this.uploadedBy = uploadedBy; }
    public String getUploadedByName() { return uploadedByName; }
    public void setUploadedByName(String uploadedByName) { this.uploadedByName = uploadedByName; }
    public LocalDateTime getUploadedDate() { return uploadedDate; }
    public void setUploadedDate(LocalDateTime uploadedDate) { this.uploadedDate = uploadedDate; }
    public String getUploadedDateDisplay() { return uploadedDate == null ? "-" : uploadedDate.format(DISPLAY); }
}
