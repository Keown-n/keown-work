

namespace Domain
{
    public class Flight
    {
        List<Booking> bookingList = new();

        public IEnumerable<Booking> BookingList => bookingList;
        public int RemainingSeats{ get; set; }
        

        public Flight(int seatCapacity)
        {
            RemainingSeats = seatCapacity;
        }

        public object? BookSeat(string seatNumber, int seat)
        {   
            if(seat > RemainingSeats || seat <0)
            {
                return new OverBookingError();
            }
            else
            {
                RemainingSeats -= seat;
                bookingList.Add(new Booking(seatNumber,seat));
                return null;
            }            

        }

        public object? CancelBooking(string seatNumber, int seat)
        {
            

            if(!bookingList.Any(booking => booking.Seat == seatNumber ))
            {
                
                return new BookingNotFoundError();
            }

            RemainingSeats += seat;
            return null;

        }


    }
}
