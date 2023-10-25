import java.util.List;
import java.util.ArrayList;

public class DataLoader implements IDataLoader {
    public List<Ride> load(List<String[]> rawData) {
        List<Ride> rides = new ArrayList<>();
        // Skip header row by starting from index 1
        for (int i = 1; i < rawData.size(); i++) {
            String[] row = rawData.get(i);
//            Ride ride = new Ride();
//            rides.add(ride);
        }
        return rides;
    }
}
