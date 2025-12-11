namespace Delegates_and_Events
{
    internal class Program
    {
        public delegate void LogHandler(string message);

        public class Logger
        {
            public void LogCon(string message)
            {

                Console.WriteLine("Console: " + message);

            }

            public void LogFile(string message)
            {

                Console.WriteLine("File: " + message);

            }
        }

        static void Main(string[] args)
        {
            Logger log = new Logger();

            LogHandler lh = log.LogCon;
            lh += log.LogFile;
            lh("hello");

            Console.ReadKey();
        }
    }
}
