using ClassesApp;

namespace Classes
{
    internal class Program
    {
       
        static void Main(string[] args)
        {

            Customer earl = new Customer("Earl");
            Customer frankTheTank = new Customer("Frank", "Mainstreet", "55537");
            
            Customer myCustomer = new Customer();

            myCustomer.SetDetails("Frank", "Mainstreet 2", "51312");

            Console.WriteLine("MyCustomer is: " + myCustomer.Name + " and he lives in " + myCustomer.Address );

            Console.WriteLine("earl is: " + earl.Name + " and he lives in " + earl.Address);

            Console.ReadKey();
        }
    }
    }
}
