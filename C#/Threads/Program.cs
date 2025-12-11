namespace Threads
{
    internal class Program
    {
        static void Main(string[] args)
        {
            //Console.WriteLine("Hello");
            //Thread.Sleep(10000);

            //Thread thread = new Thread(Test);

            //thread.Start();

            //new Thread(() =>
            //{
            //    Console.WriteLine("Lambda Thread");
            //}).Start();

            //var taskCom = new TaskCompletionSource<bool>();
            var thread = new Thread(() =>
            {
                Thread.Sleep(1000);
                Console.WriteLine("hello");
                //taskCom.TrySetResult(true);
            });

            
          
            thread.Start();

            //var test = taskCom.Task.Result;
            //Console.WriteLine(test);

            Console.ReadKey();
        }

        public static void Test()
        {
            Console.WriteLine("Test");
            Thread.Sleep(5000);
        }
    }
}
