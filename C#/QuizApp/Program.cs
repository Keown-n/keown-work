// See https://aka.ms/new-console-template for more information

using static System.Formats.Asn1.AsnWriter;

string question1 = "What is the capital of Germany";
string answer1 = "Berlin";

string question2 = "What is 2+2";
string answer2 = "4";

string question3 = "What color do you get by mixing blue and yellow";
string answer3 = "Green";

int score = 0;

Console.WriteLine(question1);
string userAnswer1 = Console.ReadLine().ToLower();
if (userAnswer1.Trim() == answer1.ToLower())
{
    Console.WriteLine("Correct!");
    score += 1;
}
else
{
    Console.WriteLine("Wrong, the correct answer is: " + answer1);
}

Console.WriteLine(question2);
string userAnswer2 = Console.ReadLine().ToLower();
if (userAnswer2.Trim() == answer2.ToLower())
{
    Console.WriteLine("Correct!");
    score += 1;
}
else
{
    Console.WriteLine("Wrong, the correct answer is: " + answer2);
}


Console.WriteLine(question3);
string userAnswer3 = Console.ReadLine().ToLower();
if (userAnswer3.Trim() == answer3.ToLower())
{
    Console.WriteLine("Correct!");
    score += 1;
}
else
{
    Console.WriteLine("Wrong, the correct answer is: " + answer3);
}

Console.WriteLine($"Quiz completed! Your final score is: {score}/3");
if (score == 3)
{
    Console.WriteLine("Excellent! You got all the answers right!");
}
else if (score > 0)
{
    Console.WriteLine("Good Job, but keep learning!");
}
else
{
    Console.WriteLine("Try again and see if you can get some answers right next time!");
}




Console.ReadKey();