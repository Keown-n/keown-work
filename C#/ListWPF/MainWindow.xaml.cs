using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ListWPF
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    /// 

    

    public partial class MainWindow : Window
    {
        public List<Person> ppl = new List<Person>()
        {
            new Person() {Name="John", Age=20 },
            new Person() {Name="bohn", Age=20 },
            new Person() {Name="tohn", Age=20 },
            new Person() {Name="eohn", Age=20 }
        };

        public MainWindow()
        {
            InitializeComponent();

            listName.ItemsSource = ppl;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
           
        }
    }
}