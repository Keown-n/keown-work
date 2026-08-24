namespace WeatherSimulator
{
    internal class Program
    {

        static void Main(string[] args)
        {
            Console.WriteLine("Enter the Number of dates");
            int days = int.Parse(Console.ReadLine());

            int[] temp = new int[days];
            string[] conditions = { "Sunny", "Cloudy", "Rainy", "Snowing" };
            string[] weatherCondition = new string[days];

            Random rand = new Random();

            for (int i = 0; i < days; i++) { 
                
                temp[i] = rand.Next(-10,40);

                weatherCondition[i]= conditions[rand.Next(conditions.Length)];
            
            }

            Console.WriteLine($"This is the Average Temperature {CalcAver(temp)}");
            Console.WriteLine($"This is the Max Temperature {temp.Max()}");

            Console.ReadKey();
        }

        static double CalcAver(int[] temp) {

            int sum = 0;

            foreach (int i in temp) { 
                
                sum += i;
            }

            return sum / temp.Length;


        }
    }
}
