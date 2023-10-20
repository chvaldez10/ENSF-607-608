import java.util.ArrayList;

/**
 * Represents a movie with details such as title, release year, runtime, genre, rating, and a list of actors.
 */
public class Movie {

    private String title;
    private String releasedYear;
    private int runTime;
    private String genre;
    private String rating;
    private ArrayList<String> actors;

    /**
     * Constructs a new Movie with the specified details.
     *
     * @param title the title of the movie
     * @param releasedYear the year the movie was released
     * @param runTime the runtime of the movie in minutes
     * @param genre the genre of the movie
     * @param rating the rating of the movie
     * @param actors the list of actors in the movie
     */
    public Movie(String title, String releasedYear, int runTime, String genre, String rating, ArrayList<String> actors) {
        this.title = title;
        this.releasedYear = releasedYear;
        this.runTime = runTime;
        this.genre = genre;
        this.rating = rating;
        this.actors = actors;
    }

    /**
     * Returns the title of the movie.
     *
     * @return the title of the movie
     */
    public String getTitle() {
        return title;
    }

    /**
     * Sets the title of the movie.
     *
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * Returns the year the movie was released.
     *
     * @return the released year of the movie
     */
    public String getReleasedYear() {
        return releasedYear;
    }

    /**
     * Sets the year the movie was released.
     *
     * @param releasedYear the year to set
     */
    public void setReleasedYear(String releasedYear) {
        this.releasedYear = releasedYear;
    }

    /**
     * Returns the runtime of the movie.
     *
     * @return the runtime of the movie
     */
    public int getRunTime() {
        return runTime;
    }

    /**
     * Sets the runtime of the movie.
     *
     * @param runTime the runtime to set
     */
    public void setRunTime(int runTime) {
        this.runTime = runTime;
    }

    /**
     * Returns the genre of the movie.
     *
     * @return the genre of the movie
     */
    public String getGenre() {
        return genre;
    }

    /**
     * Sets the genre of the movie.
     *
     * @param genre the genre to set
     */
    public void setGenre(String genre) {
        this.genre = genre;
    }

    /**
     * Returns the rating of the movie.
     *
     * @return the rating of the movie
     */
    public String getRating() {
        return rating;
    }

    /**
     * Sets the rating of the movie.
     *
     * @param rating the rating to set
     */
    public void setRating(String rating) {
        this.rating = rating;
    }

    /**
     * Returns the list of actors in the movie.
     *
     * @return the actors in the movie
     */
    public ArrayList<String> getActors() {
        return actors;
    }

    /**
     * Sets the list of actors in the movie.
     *
     * @param actors the list of actors to set
     */
    public void setActors(ArrayList<String> actors) {
        this.actors = actors;
    }
}
