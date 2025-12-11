using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Data;
using System.Security.Cryptography.X509Certificates;

namespace StudentRegistrationProject
{
    public class ConnectToDB
    {
        SqlConnection conn = new SqlConnection(@"Data Source=SAMBE2025006;Initial Catalog=StudentRegSambe;Integrated Security=True");
        SqlCommand cmd = new SqlCommand();
        SqlDataReader sqlDataReader;
        DataRow dataRow;
        public DataTable dataTable;



        public void RegisterStudent(int StudentID, string name, string lname, string address, string city, string number)
        {
            conn.Open();
            cmd = new SqlCommand(
                string.Format("INSERT INTO StudentRegs (StudentID, Name, Surname, Address, City, Cellphone) VALUES ('{0}', '{1}', '{2}', '{3}', '{4}', '{5}')", StudentID, name, lname, address, city, number),
                conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            cmd.Dispose();

        }

        public void DeleteStudent(int StudentID)
        {
            conn.Open();
            cmd = new SqlCommand(
                string.Format("DELETE FROM StudentRegs WHERE StudentID = '{0}'", StudentID),
                conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            cmd.Dispose();
        }

        public void UpdateStudent(int StudentID, string name, string lname, string address, string city, string number)
        {
            conn.Open();
            cmd = new SqlCommand(
                string.Format("UPDATE StudentRegs SET Name = '{1}', Surname = '{2}', Address = '{3}', City = '{4}', Cellphone = '{5}' WHERE StudentID = '{0}'", StudentID, name, lname, address, city, number),
                conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            cmd.Dispose();
        }

        public void ViewStudent()
        {
            conn.Open();
            cmd = new SqlCommand("SELECT * FROM StudentRegs", conn);
            sqlDataReader = cmd.ExecuteReader();
            dataTable = new DataTable();

            for(int i = 0; i < sqlDataReader.FieldCount; i++)
            {
                dataTable.Columns.Add(sqlDataReader.GetName(i));
            }

            while (sqlDataReader.Read())
            {
                dataRow = dataTable.NewRow();
                for(int i = 0; i < sqlDataReader.FieldCount; i++)
                {
                    dataRow[i] = sqlDataReader.GetValue(i);
                }
                dataTable.Rows.Add(dataRow);
            }

            conn.Close();
            cmd.Dispose();
            sqlDataReader.Close();
        }




    }

}

