using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Data;

namespace StudentRegistrationProject
{
    /// <summary>
    /// Interaction logic for StudentData.xaml
    /// </summary>
    public partial class StudentData : Window
    {
        ConnectToDB conn = new ConnectToDB();
        public StudentData()
        {
            InitializeComponent();
            
            
        }

        private void btnDisplay_Click(object sender, RoutedEventArgs e)
        {
            conn.ViewStudent();
            datagrid.ItemsSource = conn.dataTable.DefaultView;
        }
    }
}
