import java.util.List;

public interface IDataLoader {
    List<Ride> load(List<String[]> rawData);
}