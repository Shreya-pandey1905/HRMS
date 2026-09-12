package models.Tickets;

public class TicketDashboardCounts {
    private int openCount;
    private int activeCount;
    private int resolvedCount;
    private int closedCount;

    public int getOpenCount() { return openCount; }
    public void setOpenCount(int openCount) { this.openCount = openCount; }
    public int getActiveCount() { return activeCount; }
    public void setActiveCount(int activeCount) { this.activeCount = activeCount; }
    public int getResolvedCount() { return resolvedCount; }
    public void setResolvedCount(int resolvedCount) { this.resolvedCount = resolvedCount; }
    public int getClosedCount() { return closedCount; }
    public void setClosedCount(int closedCount) { this.closedCount = closedCount; }
}
