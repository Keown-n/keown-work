using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Generics
{
    //internal class Box<T>
    //{
    //    private T Content;

    //    public Box(T content)
    //    {
    //        Content = content;
    //    }
    //    public void UpdateContent(T content)
    //    {
    //        Content = content;
    //        Console.WriteLine("Updated Content");
    //    }
    //    public T GetContent()
    //    {
    //        return Content;
    //    }   

    //    public string Log()
    //    {
    //        return $"Box contains: {Content}";
    //    }
    //}
    internal class Box<T, V> where T :  class
    {
        public T first { get; set; }
        public V second { get; set; }

        public Box(T First, V Second)
        {
            first = First;
            second = Second;

        }
        public void Display()
        {
            Console.WriteLine($"First: {first}, Second: {second}");
        }   

    }
}
