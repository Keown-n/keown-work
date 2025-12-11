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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace StudentRegistrationProject
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void btnRegister_Click(object sender, RoutedEventArgs e)
        {
            ConnectToDB connectToDB = new ConnectToDB();
            connectToDB.RegisterStudent(Convert.ToInt32(txtStudentID.Text), txtFname.Text, txtSurname.Text, txtAddress.Text, txtCity.Text, txtNumber.Text);
            MessageBox.Show("Student Registered Successfully");

            txtStudentID.Clear();
            txtFname.Clear();
            txtSurname.Clear();
            txtAddress.Clear();
            txtCity.Clear();
            txtNumber.Clear();


        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            ConnectToDB connectToDB = new ConnectToDB();
            connectToDB.DeleteStudent(Convert.ToInt32(txtStudentID.Text));
            MessageBox.Show("Student Deleted Successfully");
            txtStudentID.Clear();
            txtFname.Clear();
            txtSurname.Clear();
            txtAddress.Clear();
            txtCity.Clear();
            txtNumber.Clear();

        }

        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            ConnectToDB connectToDB = new ConnectToDB();
            connectToDB.UpdateStudent(Convert.ToInt32(txtStudentID.Text), txtFname.Text, txtSurname.Text, txtAddress.Text, txtCity.Text, txtNumber.Text);
            MessageBox.Show("Student Updated Successfully");
            txtStudentID.Clear();
            txtFname.Clear();
            txtSurname.Clear();
            txtAddress.Clear();
            txtCity.Clear();
            txtNumber.Clear();

        }

        private void btnSelect_Click(object sender, RoutedEventArgs e)
        {
            StudentData sd = new StudentData();
            sd.Show();
        }
    }
}
