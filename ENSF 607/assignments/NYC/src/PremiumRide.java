public class PremiumRide extends Ride {
    boolean hasRefreshments;

    /**
     * Constructs a new {@code Ride} instance.
     *
     * @param pickupDatetime   the datetime when the ride was picked up
     * @param dropoffDatetime  the datetime when the ride was dropped off
     * @param passengerCount   the number of passengers in the ride
     * @param pickupLongitude  the longitude of the pickup location
     * @param pickupLatitude   the latitude of the pickup location
     * @param dropoffLongitude the longitude of the dropoff location
     * @param dropoffLatitude  the latitude of the dropoff location
     * @param tripDuration     the duration of the trip in minutes
     */
    public PremiumRide(String pickupDatetime, String dropoffDatetime, int passengerCount, double pickupLongitude, double pickupLatitude, double dropoffLongitude, double dropoffLatitude, int tripDuration) {
        super(pickupDatetime, dropoffDatetime, passengerCount, pickupLongitude, pickupLatitude, dropoffLongitude, dropoffLatitude, tripDuration);
    }

    // Constructor and other methods...
}
