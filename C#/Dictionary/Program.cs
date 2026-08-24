namespace Dictionary
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Dictionary<int, string> emp = new Dictionary<int, string>();
            emp.Add(1, "kk");
            emp.Add(2, "c");
            emp.Add(3, "a");

            emp[2] = "ppp";
             emp.Remove(3);

            emp.TryAdd(1, "oo");

            foreach ( KeyValuePair<int,string> x in emp)
            {
                Console.WriteLine($"{x.Key} : {x.Value}");
            }

            Console.ReadKey();
        }
    }
}
