using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Domain
{
    public class Booking
    {
        public string Seat { get; set; }
        public int number { get; set; }
        public Booking(string x, int y) { 
            Seat = x;
            number = y;
        }
    }
}
