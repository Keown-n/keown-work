namespace Generics
{
    internal class Program
    {
        static void Main(string[] args)
        {
            
            //Box<string> strBox = new Box<string>("Hello");

            //Console.WriteLine(strBox.Log());
            //strBox.UpdateContent("World");
            //Console.WriteLine(strBox.GetContent());

            Box<int, string> box = new Box<int, string>(1, "One");
            box.Display();

            Logger logger = new Logger();
            logger.Log("This is a string message");
            logger.Log(12345); // Logging an integer
            logger.Log(box); 


            Console.ReadLine();
        }
    }
}
