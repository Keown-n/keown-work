
Console.WriteLine("Enter the first Number:");

double num1 = double.Parse(Console.ReadLine());

Console.WriteLine("Enter the second number :");

double num2 = double.Parse(Console.ReadLine());

double total = num1 + num2;
total = Math.Round(total,2);

//Console.WriteLine("The sum is " + total);

//Console.WriteLine($"The sum is  {total}");

Console.WriteLine("The sum is  {0}", total);

Console.ReadKey();