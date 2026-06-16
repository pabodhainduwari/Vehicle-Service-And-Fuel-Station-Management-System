package services;

import java.util.ArrayList;
import java.util.List;

public class serviceRequest {
	public static int getTotalRequests() {
		//SELECT COUNT(*) FROM booking;
		return 150;
	}
	public static int getAssignedRequests() {
        // SELECT COUNT(*) FROM service_requests WHERE status = 'Assigned'
        return 80;
    }
	public static int getPendingRequests() {
        // SELECT COUNT(*) FROM service_requests WHERE status = 'Pending'
        return 70;
    }
	public static List<serviceRequest> getRecentRequests(int limit) {
        // SELECT * FROM booking ORDER BY request_date DESC LIMIT ?
        return new ArrayList<>(); // replace with actual list
    }
}
