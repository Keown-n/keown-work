namespace Events2
{
    public delegate void TemperatureChangeHandler(string msg);

    public class TempMonitor
    {
        public event TemperatureChangeHandler OnTemperatureChange;
        private int temp;

        public int Temp
        {
            get { return temp; }
            set
            {

                value = temp;
                RaisedTemp("Changed");



            }
        }

        protected virtual void RaisedTemp(string msg)
        {

            OnTemperatureChange?.Invoke(msg);

        }


    }

    public class Sub
    {
        public void OnTempChange(string msg)
        {
            Console.WriteLine("Temp change :" + msg);
        }



        internal class Program
        {

            static void Main(string[] args)
            {
                TempMonitor tempMonitor = new TempMonitor();
                Sub sub = new Sub();
                tempMonitor.OnTemperatureChange += sub.OnTempChange;

                tempMonitor.Temp = 100;


                Console.ReadKey();
            }
        }
    }
}
