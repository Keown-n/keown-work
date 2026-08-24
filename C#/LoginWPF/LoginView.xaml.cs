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

namespace LoginWPF
{
    /// <summary>
    /// Interaction logic for LoginView.xaml
    /// </summary>
    public partial class LoginView : UserControl
    {
        public LoginView()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            string pword = txtPass.Password;
            //string? password = Environment.GetEnvironmentVariable("Invoice");
            string? password = "123456789";

            if (!string.IsNullOrEmpty(pword) && string.IsNullOrEmpty(password)) {

                if (pword == password)
                {
                    MessageBox.Show("Password is correct");
                     
                }
                else { 
                
                    MessageBox.Show("Password is incorrect");

                }


            }
        }

        private void txtPass_PasswordChanged(object sender, RoutedEventArgs e)
        {
            btnLogin.IsEnabled = !string.IsNullOrEmpty(txtPass.Password);
        }
    }
}
