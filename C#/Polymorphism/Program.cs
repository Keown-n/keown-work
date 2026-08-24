namespace Polymorphism
{
    internal class Program
    {
        public class Animal
        {
            public virtual void MakeSound()
            {
                Console.WriteLine("Some generic animal sound");
            }
        }

        public class Dog : Animal
        {
            public override void MakeSound()
            {
                Console.WriteLine("Bark");
            }
        }

        public class Cat : Animal
        {
            public override void MakeSound()
            {
                Console.WriteLine("Meow");
            }
        }
        static void Main(string[] args)
        {
            // Part 2 of Polymorphism
            Animal my = new Dog();
            my.MakeSound();



            Console.ReadKey();
        }
    }
}
