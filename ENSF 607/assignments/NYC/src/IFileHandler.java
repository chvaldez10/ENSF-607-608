import java.util.List;
import java.io.IOException;

public interface IFileHandler {
    List<String[]> readCsv(String filePath) throws IOException;
}
