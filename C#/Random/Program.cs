
// creating an instance of the Random Class
Random random = new Random();
// this will give us a random  number between 1 and 10
int randomNumber = random.Next(1, 11);

Console.WriteLine("Guess the number");

string inputString = Console.ReadLine();
int num1 = 0;

bool isNumber = int.TryParse(inputString, out num1);

if (isNumber)
{
    if (num1 == randomNumber)
    {
        Console.WriteLine("You guessed right!");
    }
    else
    {
        Console.WriteLine("You guessed wrong, try again!");
    }
}
else
{
    Console.WriteLine("Haha you troll. You should've entered a number");
}
Console.ReadKey();