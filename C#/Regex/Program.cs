using System.Text.RegularExpressions;

namespace RegexE
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Regex regex = new Regex(@"\d");



            
            string text = "Hi there 123";

            
            MatchCollection hits = regex.Matches(text);

            
            Console.WriteLine("{0} hits found:\n   {1}",
                              hits.Count,
                              text);

            
            foreach (Match aHit in hits)
            {
                GroupCollection groups = aHit.Groups;
                Console.WriteLine("'{0}' found at {1}",
                                  groups["word"].Value,
                                  groups[0].Index
                                 );
            }
            Console.ReadLine();
        }
    }
}
