import java.io.IOException;
import java.util.List;

public class Main {
    public static void main(String[] args) throws IOException {
        // Dependencies are now inverted and depend on abstractions
        IFileHandler fileHandler = new FileHandler();
        IDataLoader dataLoader = new DataLoader();
        IDataAnalyzer dataAnalyzer = new DataAnalyzer();

        List<String[]> rawData = fileHandler.readCsv("train_99.csv");
        List<Ride> rides = dataLoader.load(rawData);

        // LSP: We can substitute Ride with PremiumRide without changing the behavior
//        Ride premium = new PremiumRide();
//        rides.add(premium);

        // Analyze
        double averageDuration = dataAnalyzer.averageTripDuration(rides);
        System.out.println("Average Trip Duration: " + averageDuration);

    }
}
