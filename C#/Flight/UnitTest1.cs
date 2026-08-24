using Domain;
using FluentAssertions;

namespace FlightTest
{
    public class UnitTest1
    {
        [Theory]
        [InlineData(3,2,1)]
        [InlineData(3, 1, 2)]
        public void Bookin_reduces_the_number_of_seats( int seatCapacity, int numberSeats, int remainingSeats)
        {
            var flight = new Flight(seatCapacity:seatCapacity);

            flight.BookSeat("1A",numberSeats);
            flight.RemainingSeats.Should().Be(remainingSeats); 

        }
       
        [Fact]
        public void Avoids_overbooking()
        {
            var flight = new Flight(seatCapacity:3);
            var error = flight.BookSeat("1A",4);

            error.Should().BeOfType<OverBookingError>();

        }

        [Fact]
        public void Books_flight_successfully()
        {
            var flight = new Flight(seatCapacity: 3);
            var error = flight.BookSeat("1A", 1);

            error.Should().BeNull();

        }

        [Fact]
        public void Remeber_booking()
        {
            var flight = new Flight(seatCapacity: 3);
            flight.BookSeat("1A", 1);

            flight.BookingList.Should().ContainEquivalentOf(new Booking("1A", 1));

        }


        [Theory]
        [InlineData(3, 1, 1, 3)]
        [InlineData(3, 2, 1, 2)]
        public void Cancel_booking_freeup_seat(
           int initialCapacity,
              int seatsBooked,
                int seatsCancelled,
                int expectedRemainingSeats
            )
        {
            var flight = new Flight(seatCapacity: initialCapacity);
            flight.BookSeat("1A", seatsBooked);

            flight.CancelBooking("1A", seatsCancelled);

            flight.RemainingSeats.Should().Be(expectedRemainingSeats);


        }

        [Fact]
        public void Dont_cancel_for_passangers_not_listed()
        {
            var flight = new Flight(seatCapacity: 3);
            flight.BookSeat("1A", 2);

            var error = flight.CancelBooking("2A", 1);

            error.Should().BeOfType<BookingNotFoundError>();


        }

        [Fact]
        public void Cancel_for_passangers_on_the_list()
        {
            var flight = new Flight(seatCapacity: 3);

            flight.BookSeat("1A", 2);

            var result = flight.CancelBooking("1A", 2);

            result.Should().BeNull();



        }




    }
}
