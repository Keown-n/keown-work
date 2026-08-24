namespace Inheritence
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Dog myDog = new Dog();
            myDog.Sound();

            Cat myCat = new Cat();
            myCat.Sound();


            Console.ReadKey();
        }
    }


    class Animal
    {
        public void Eat()
        {
            Console.WriteLine("Eating...");
        }

        public virtual void Sound()
        {
            Console.WriteLine("Animal makes a generic sound");
        }
    }
    class Dog : Animal
    {
        public override void Sound()
        {
            Console.WriteLine("Barking...");
        }
    }

    class Cat : Animal
    {
        public override void Sound()
        {
            Console.WriteLine("Cat is meowing");
        }
    }
    class Collie : Dog
    {
        public void GoingNuts()
        {
            Console.WriteLine("Collie going Nuts");
        }
    }
}
