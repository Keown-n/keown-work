
//int[] arr = new int[5];
//arr[0] = 5;
//arr[1] = 7;
//arr[2] = 6;
//arr[3] = 9; 
//arr[4] = 2;

//int[] arr = {2, 5, 6, 4, 8, 6};

//string[] weekDays = {"Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"};

//Console.WriteLine("Lenght of the weekdays Array is: " + weekDays.Length);

////for (int i = 0; i < weekDays.Length; i++)
////{
////    Console.WriteLine(weekDays[i]);
////}

//foreach (string day in weekDays)
//{
//    Console.WriteLine(day);
//}


//foreach(int x in arr)
//{
//    Console.WriteLine(x);
//}

//int[,] arr2 = new int[3,3];

//int[,] arr2 = { { 1, 2 }, { 6, 7} };

//Console.WriteLine(arr2[0,0]);
//Console.WriteLine(arr2[0,1]);
//Console.WriteLine(arr2[1, 0]);
//Console.WriteLine(arr2[1,1]);


//int[,,] array3DDeclaration = new int[3, 3, 3];

//// initialized 3D Array
//string[,,] simple3DArray =
//{
//    {
//        {"000", "001"},
//        {"010", "011" }
//    },
//    {
//        {"100", "101"},
//        {"110", "111"}
//    }
//};

//// assign a value
//simple3DArray[2, 1, 0] = "Hi, what's up?";

//Console.WriteLine(simple3DArray[2, 1, 0]);

// TODO
int[,] arr2 = { { 1, 2, 3 }, { 4, 5, 6 }, { 7,8,9 } };


for (int x = 0; x < 3; x++)
{
    int sum = 0;

    for (int j = 0; j < 3; j++)
    {


        sum += arr2[x, j];

    }

    Console.WriteLine(sum);

}


Console.ReadKey();











Console.ReadKey();