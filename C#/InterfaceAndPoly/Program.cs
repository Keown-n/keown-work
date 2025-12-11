namespace InterfaceAndPoly
{
    internal class Program
    {
        public interface IPaymentProcessor
        {
            void Process(decimal amount);
        }

        public class CreditCardProcessor : IPaymentProcessor
        {
            public void Process(decimal amount)
            {
                Console.WriteLine(" Processing : R"+ amount);
            }
        }

        public class PayProcessor : IPaymentProcessor
        {
            public void Process(decimal amount)
            {
                Console.WriteLine(" Pay Processing : R" + amount);
            }
        }

        public class PayServices
        {
            private readonly IPaymentProcessor _processor;

            public PayServices(IPaymentProcessor processor)
            {

                _processor = processor;
            }

            public void ProcessOrder(decimal amount)
            {
                _processor.Process(amount);
            }


        }


        static void Main(string[] args)
        {
            IPaymentProcessor credit = new CreditCardProcessor();
            PayServices payServices = new PayServices(credit);
            payServices.ProcessOrder(100.123m);

            IPaymentProcessor pay = new PayProcessor();
            payServices = new PayServices(pay);
            payServices.ProcessOrder(100.123m);





            Console.ReadKey();
        }
    }
}
