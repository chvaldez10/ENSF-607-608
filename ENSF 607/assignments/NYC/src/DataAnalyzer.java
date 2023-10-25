import java.util.List;

public class DataAnalyzer implements IDataAnalyzer {
    public double averageTripDuration(List<Ride> rides) {
        double totalDuration = 0.0;
        for (Ride ride : rides) {
            totalDuration += ride.getTripDuration();
        }
        return totalDuration / rides.size();
    }
}
