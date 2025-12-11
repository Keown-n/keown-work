void WriteSomething()
{
    Console.WriteLine("I'm writing something!");
}

WriteSomething();

// A method that has the parameter myString of type String
void WriteSomethingSpecific(string myString)
{
    Console.WriteLine("You passed this argument to me " + myString);
}

string myUsername = "Frank";

WriteSomethingSpecific(myUsername);

Console.WriteLine("This is outside of the method");

int AddTwoValues(int value1, int value2)
{
    int result = value1 + value2;
    return result;
}

int num1 = int.Parse(Console.ReadLine());

int myResult = AddTwoValues(num1, 10);
Console.WriteLine("The result is" + myResult);
Console.ReadKey();

