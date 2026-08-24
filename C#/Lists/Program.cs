namespace Lists
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //List<string> list = ["a", "b", "c", "d", "e"];

            //foreach (var item in list)
            //{
            //    Console.WriteLine(item);
            //}

            //list.Remove("a");

            //foreach (var item in list)
            //{
            //    Console.WriteLine(item);
            //}

            List<int> list2 =[1,5,7,9,3,6,2,4] ;

            list2.Sort();

            foreach (var item in list2)
            {
                Console.WriteLine(item);
            }

            List<int> x = list2.FindAll(x => x >= 5);

            foreach (var item in x)
            {
                Console.WriteLine(item);
            }

            bool boo = list2.Any(x => x >= 5);

            Console.ReadKey();
        }
    }
}
