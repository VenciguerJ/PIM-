using System;
using System.Data.SqlClient;
using User_Assets;
using Client_Config;

namespace Database_Config
{
    public class Database
    {
        private static readonly string connectionString = "a";

        public static void RegisterUserOnDB(User tmpUser)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                
            }
        }

        public static void RegisterClientOnDB(Client tmpClient)
        
    }
}
