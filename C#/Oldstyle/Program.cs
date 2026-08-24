namespace Oldstyle
{
    internal class Program
    {
        static int myResult;
        static void Main(string[] args)
        {

            Console.WriteLine("Enter a number, I'll add 10 to it!");
            int num1 = int.Parse(Console.ReadLine());

            myResult = AddTwoValues(num1, 10);
            Console.WriteLine("The result is " + myResult);

            Console.ReadKey();
        }

        static int SubtractTwoValues(int value1, int value2)
        {
            int result = (value1 - value2);
            return result;
        }
        static int AddTwoValues(int value1, int value2)
        {
            int result = (value1 - value2);
            return result;
        }
    }
}
